import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:pengaduan_masyarakat_flutter/models/PetugasModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/PetugasModel.dart';

class PetugasController extends GetxController {
  RxInt show = RxInt(0);
  RxBool isLoading = RxBool(false);

  RxList<PetugasModel> listpetugas = RxList<PetugasModel>([]);

  TextEditingController idPetugasController = TextEditingController();
  TextEditingController namaPetugasController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  TextEditingController editNamaPetugasController = TextEditingController();
  TextEditingController editUsernameController = TextEditingController();
  TextEditingController editPasswordController = TextEditingController();
  TextEditingController editTelpController = TextEditingController();
  TextEditingController editLevelController = TextEditingController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading.value == true;
      var res =
          await http.get(Uri.parse('http://192.168.43.105:5000/petugas'));
      print(res);

      if (res.statusCode == 200) {
        isLoading.value == false;
        final content = jsonDecode(res.body);
        for (Map<String, dynamic> i in content) {
          listpetugas.add(PetugasModel.fromJson(i));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> postData() async {
    final Map<String, dynamic> datas = {
      "id": idPetugasController.text,
      "nama": namaPetugasController.text,
      "username": usernameController.text,
      "password": passwordController.text,
      "telp": telpController.text,
      "level": levelController.text,
    };

    final response = await http.post(
        Uri.parse('http://192.168.43.105:5000/petugas'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(datas));
    if (response.statusCode == 201) {
      // ignore: invalid_use_of_protected_member
      listpetugas.value.clear();
      getData();
      return true;
    } else {
      return false;
    }
  }

  final id = 0.obs;

  void getId(int ids) async {
    id.value = ids;
  }

  Future<bool> updateData(nik) async {
    final Map<String, dynamic> datas = {
      "nama": namaPetugasController.text,
      "username": usernameController.text,
      "password": passwordController.text,
      "telp": telpController.text,
      "level": levelController.text,
    };
    final response = await http.patch(
        Uri.parse('http://192.168.43.105:5000/petugas/${nik}'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(datas));
    if (response.statusCode == 201) {
      // ignore: invalid_use_of_protected_member
      listpetugas.value.clear();
      getData();
      return true;
    } else {
      return false;
    }
  }

  void getId2(int ids) async {
    id.value = ids;
  }

  Future<bool> deleteData(nik) async {
    final response = await http.delete(
        Uri.parse('http://192.168.43.105:5000/petugas/${nik}'),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
