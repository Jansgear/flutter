import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:json/contoller/duaController.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DuaController dc = Get.put(DuaController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Container(
        child: Center(
          child: Obx(
              () => dc.isLoading.value ? const Center(
                child: CircularProgressIndicator(),
              )
              : ListView.builder(
                itemCount: dc.listDua.value.length,
                itemBuilder: (context, index) {
                  final post = dc.listDua.value[index];
                  return ListTile(
                    onTap: () {
                      dc.getPost(index);
                      Get.toNamed('/dua');
                    },
                    leading: CircleAvatar(
                      child: Text('${dc.listDua.value[index].firstname}'),
                    ),
                    title: Text('${dc.listDua.value[index].createdAt}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        if(post.posts != null)
                          for(var post in post.posts!)
                            RichText(text: TextSpan(
                              text: post.title,
                              style: DefaultTextStyle.of(context).style
                            ))
                      ],
                    ),
                  );
                }
              )
          ),
        ),
      ),
    );
  }
}
