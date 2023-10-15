import 'dart:convert';

import 'package:get/get.dart';
import 'package:json/model/modelSatu.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SatuController extends GetxController{
  RxBool isLoading = false.obs;
  RxList<ModelSatu> list = RxList<ModelSatu>();

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  getData() async{
    try{
      isLoading.value = true;
      var response = await http.get(Uri.parse('https://mocki.io/v1/c521a476-30a1-48cf-a6a4-5f48f61a5d50'));
      if(response.statusCode == 200){
        isLoading.value = false;
        final content = jsonDecode(response.body);

        for(Map<String, dynamic> i in content) {
          list.value.add(ModelSatu.fromJson(i));
        }
      } else {
        isLoading.value = false;
        print('error');
      }
    } catch(e) {
      print(e.toString());
    }
  }
}