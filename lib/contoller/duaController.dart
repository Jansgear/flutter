import 'dart:convert';

import 'package:get/get.dart';
import 'package:json/model/modelDua.dart';
import 'package:http/http.dart' as http;

class DuaController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<ModelDua> listDua = RxList<ModelDua>();
  RxList<Posts> posts = RxList<Posts>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse('https://mocki.io/v1/c4d2fe1b-99e3-458a-9d45-14d4ba016346'));
      if(response.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(response.body);

        for(Map<String, dynamic> i in content ) {
          listDua.value.add(ModelDua.fromJson(i));
        }
      } else {
        isLoading.value = false;
        print('error');
      }
    } catch(e) {
      print(e.toString());
    }
  }

  RxInt id = 0.obs;

  void getPost(int ids) async{
    id.value = ids;
  }
}