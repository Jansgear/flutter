import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/Controller/PetugasController.dart';
// import 'package:pengaduan_masyarakat_flutter/controllers/MasyarakatController.dart';
// import 'package:pengaduan_masyarakat_flutter/home.dart';

import '../Controller/MasyarakatController.dart';
import '../homeScreen.dart';

class UpdatePetugas extends StatelessWidget {
  const UpdatePetugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController pc = Get.put(PetugasController());
    final index = pc.id.value;
    // ignore: invalid_use_of_protected_member
    final nik = pc.listpetugas.value[index].id_petugas;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit petugas'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: pc.editNamaPetugasController,
            decoration: InputDecoration(labelText: 'Input Nama'),
          ),
          TextField(
            controller: pc.editUsernameController,
            decoration: InputDecoration(labelText: 'Input Username'),
          ),
          TextField(
            controller: pc.editPasswordController,
            decoration: InputDecoration(labelText: 'Input Password'),
          ),
          TextField(
            controller: pc.editTelpController,
            decoration: InputDecoration(labelText: 'Input No Telp'),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(homeScreen());
                pc.updateData(nik);
              },
              child: Text('Update'))
        ],
      ),
    );
  }
}
