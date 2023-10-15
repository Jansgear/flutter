import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:json/home.dart';
import 'package:json/screen_dua.dart';
import 'package:json/screen_satu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyApp()),
        GetPage(name: '/home', page: () => homeScreen()),
        GetPage(name: '/satu', page: () => screenSatu()),
        GetPage(name: '/dua', page: () => screenDua())
      ],
      home: homeScreen(),
    );
  }
}

