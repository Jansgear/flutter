import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:pengaduan_masyarakat_flutter/Model/MasyarakatModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:masyarakat/Model/PengaduanModel.dart';

import '../Model/MasyarakatModel.dart';

class PengaduanController extends GetxController {
  RxInt show = RxInt(0);
  RxBool isLoading = RxBool(false);

  RxList<PengaduanModel> listpengaduan = RxList<PengaduanModel>([]);

  TextEditingController idPengaduanController = TextEditingController();
  TextEditingController tglPengaduanController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController isiLaporanController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  TextEditingController editNamaController = TextEditingController();
  TextEditingController editUsernameController = TextEditingController();
  TextEditingController editPasswordController = TextEditingController();
  TextEditingController editTelpController = TextEditingController();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading.value == true;
      var res =
      await http.get(Uri.parse('http://192.168.43.105:5000/masyarakat'));
      print(res);

      if (res.statusCode == 200) {
        isLoading.value == false;
        final content = jsonDecode(res.body);
        for (Map<String, dynamic> i in content) {
          listpengaduan.add(PengaduanModel.fromJson(i));
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> postData() async {
    final Map<String, dynamic> datas = {
      "id pengaduan": idPengaduanController.text,
      "tgl pengaduan": tglPengaduanController.text,
      "nik": nikController.text,
      "isi laporan": isiLaporanController.text,
      "foto": fotoController.text,
      "status": statusController.text,

    };

    final response = await http.post(
        Uri.parse('http://192.168.43.105:5000/pengaduan'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(datas));
    if (response.statusCode == 201) {
      // ignore: invalid_use_of_protected_member
      listpengaduan.value.clear();
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
      "nama": editNamaController.text,
      "username": editUsernameController.text,
      "password": editPasswordController.text,
      "telp": editTelpController.text,
    };
    final response = await http.patch(
        Uri.parse('http://192.168.43.105:5000/masyarakat/${nik}'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(datas));
    if (response.statusCode == 201) {
      // ignore: invalid_use_of_protected_member
      listpengaduan.value.clear();
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
        Uri.parse('http://192.168.43.105:5000/masyarakat/${nik}'),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

}
