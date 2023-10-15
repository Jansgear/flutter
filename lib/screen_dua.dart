import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:json/contoller/duaController.dart';

class screenDua extends StatelessWidget {
  const screenDua({super.key});

  @override
  Widget build(BuildContext context) {
    DuaController dc = Get.find();
    final id = dc.id.value;
    final posts = dc.listDua.value[id];
    return Scaffold(
      appBar: AppBar(
        title: Text('Screeen dua'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(posts.posts != null)
              for(var post in posts.posts!)
                Text('${posts.createdAt}\n')
          ],
        ),
      ),
    );
  }
}
