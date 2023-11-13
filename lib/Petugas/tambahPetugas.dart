import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/Controller/PetugasController.dart';
// import 'package:pengaduan_masyarakat_flutter/controllers/MasyarakatController.dart';
// import 'package:pengaduan_masyarakat_flutter/home.dart';

import '../Controller/MasyarakatController.dart';
import '../homeScreen.dart';

class CreatePetugas extends StatelessWidget {
  const CreatePetugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController pc = Get.put(PetugasController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Petugas'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextField(
            controller: pc.idPetugasController,
            decoration: InputDecoration(labelText: 'Input NIK'),
          ),
          TextField(
            controller: pc.namaPetugasController,
            decoration: InputDecoration(labelText: 'Input Nama'),
          ),
          TextField(
            controller: pc.usernameController,
            decoration: InputDecoration(labelText: 'Input Username'),
          ),
          TextField(
            controller: pc.passwordController,
            decoration: InputDecoration(labelText: 'Input Password'),
          ),
          TextField(
            controller: pc.telpController,
            decoration: InputDecoration(labelText: 'Input No Telp'),
          ),
          TextField(
            controller: pc.levelController,
            decoration: InputDecoration(labelText: 'Input Level'),
          ),
          SizedBox(
            width: 20,
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.to(homeScreen());
                pc.postData();
              },
              child: Text('Submit'),style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.all(16.0),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),)
        ],
      ),
    );
  }
}
