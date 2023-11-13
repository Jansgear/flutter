import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/Controller/PetugasController.dart';
// import 'package:pengaduan_masyarakat_flutter/controllers/MasyarakatController.dart';
// import 'package:pengaduan_masyarakat_flutter/home.dart';

import '../Controller/MasyarakatController.dart';
import '../homeScreen.dart';

class ReadPetugas extends StatelessWidget {
  const ReadPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController pc = Get.put(PetugasController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Read petugas'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Obx(
          () => pc.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: pc.listpetugas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Id petugas : '
                              '${pc.listpetugas[index].id_petugas}\nNama : ${pc.listpetugas[index].nama_petugas}\nUsername : ${pc.listpetugas[index].username}\nPassword : ${pc.listpetugas[index].password}\nNo Telp : ${pc.listpetugas[index].telp}\n level: ${pc.listpetugas[index].level}'),
                          Row(
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.all(16.0),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Get.toNamed('/Umasyarakat',
                                        arguments: {"index": index});
                                    pc.getId(index);
                                  },
                                  child: Text(
                                    'Edit',
                                  )),
                              SizedBox(
                                width: 50,
                                height: 10,
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.all(16.0),
                                    textStyle: const TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    pc.deleteData(
                                        pc.listpetugas[index].id_petugas);
                                    // ignore: invalid_use_of_protected_member
                                    pc.listpetugas.value
                                        .clear();
                                    pc.getData();
                                    Get.to(homeScreen());
                                  },
                                  child: Text(
                                    'Delete',
                                  )),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
