import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:masyarakat/Controller/MasyarakatController.dart';

import 'Controller/resource.dart';

class homeTest extends StatelessWidget {
  const homeTest({super.key});

  @override
  Widget build(BuildContext context) {
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        child: Obx(
              () => masyarakatController.isLoading.value
              ? const Center(
                child: CircularProgressIndicator(),
          )
              : ListView.builder(
                itemCount: masyarakatController.listmasyarakat.length,
                itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(onPressed: (){Get.toNamed('/Tmasyarakat');}, child: Text('Tambah Masyarakat'), style: buttonMasyarakat,),
                    Text('NIK : '
                        '${masyarakatController.listmasyarakat[index].nik}\nNama : ${masyarakatController.listmasyarakat[index].nama}\nUsername : ${masyarakatController.listmasyarakat[index].username}\nPassword : ${masyarakatController.listmasyarakat[index].password}\nNo Telp : ${masyarakatController.listmasyarakat[index].telp}'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size(100, 20),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.all(16.0),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () {
                              Get.toNamed('/Umasyarakat',
                                  arguments: {"index": index});
                              masyarakatController.getId(index);
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
                              masyarakatController.deleteData(
                                  masyarakatController
                                      .listmasyarakat[index].nik);
                              // ignore: invalid_use_of_protected_member
                              masyarakatController.listmasyarakat.value
                                  .clear();
                              masyarakatController.getData();
                              // Get.to(homeScreen());
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
