import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json/contoller/satuController.dart';

import 'model/modelSatu.dart';

class screenSatu extends StatelessWidget {
  const screenSatu({super.key});

  @override
  Widget build(BuildContext context) {
    SatuController sc = Get.put(SatuController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Satu'),
      ),
      body: Container(
        child: Center(
          child: Obx(
              () => sc.isLoading.value ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                  itemCount: sc.list.value.length,
                  itemBuilder: (context, index){
                    // final post = sc.list.value[index];
                    return ListTile(
                      onTap: (){
                        sc.getData();
                        Get.toNamed('/home');
                      },
                          leading: CircleAvatar(
                              child: Text('${sc.list.value[index].userId}')),
                          title: Text('${sc.list.value[index].name}'),
                          subtitle: Text('${sc.list.value[index].email}'),
                    );
                      },
                    ),
              )
          ),
        ),
      );
  }
}
