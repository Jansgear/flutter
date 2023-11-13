import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:masyarakat/Controller/MasyarakatController.dart';
import 'package:masyarakat/Controller/PetugasController.dart';
import 'package:masyarakat/Controller/resource.dart';
import 'package:masyarakat/Model/MasyarakatModel.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController pc = Get.put(PetugasController());
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    return Scaffold(
      appBar: AppBar(
        title: Text('home screen'),
      ),
      body: Container(
        child: Column(
          children: [

            DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                disabledItemFn: (String s) => s.startsWith('I'),
              ),
              items: [

              ],
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Menu mode",
                  hintText: "country in menu mode",
                ),
              ),
              onChanged: print,
              selectedItem: "Brazil",
            ),
            SizedBox(height: 10,),

            // DropdownSearch<String>.multiSelection(
            //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
            //   popupProps: PopupPropsMultiSelection.menu(
            //     showSelectedItems: true,
            //     disabledItemFn: (String s) => s.startsWith('I'),
            //   ),
            //   onChanged: print,
            //   selectedItems: ["Brazil"],
            // ),

            Container(
              height: 150,
                width: 1000,
                // color: Colors.green,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){Get.toNamed('/Tmasyarakat');}, child: Text('Tambah Masyarakat'), style: buttonMasyarakat,),
                    Container(
                      child: Obx(
                            () => masyarakatController.isLoading.value
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            : ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: masyarakatController.listmasyarakat.length,
                              itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                  ],
                ),
            ),
            SizedBox(height: 30,),

            Container(
              height: 250,
              width: 1000,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){Get.toNamed('/Tpetugas');}, child: Text('Tambah Petugas'), style: buttonPetugas,),
                    Obx(
                          () => pc.isLoading.value
                          ? const Center(
                        child: CircularProgressIndicator(),
                      )
                          : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: pc.listpetugas.length,
                            itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Id petugas : '
                                    '${pc.listpetugas[index].id_petugas}\nNama : ${pc.listpetugas[index].nama_petugas}\nUsername : ${pc.listpetugas[index].username}\nPassword : ${pc.listpetugas[index].password}\nNo Telp : ${pc.listpetugas[index].telp}\n level: ${pc.listpetugas[index].level}'),
                                Column(
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
                  ],
                ),
            ),

            // SizedBox(height: 10,),
            // ElevatedButton(onPressed: (){Get.toNamed('/Rpetugas');}, child: Text('View data'), style: buttonPetugas,),
            SizedBox(height: 10,),
            //
            // ElevatedButton(onPressed: (){}, child: Text('')),
            // ElevatedButton(onPressed: (){}, child: Text('')),
            // SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
