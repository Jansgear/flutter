import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/Masyarakat/readMasyarakat.dart';
import 'package:masyarakat/Masyarakat/tambahMasyarakat.dart';
import 'package:masyarakat/Masyarakat/updateMasyarakat.dart';
import 'package:masyarakat/Petugas/readPetugas.dart';
import 'package:masyarakat/Petugas/tambahPetugas.dart';
import 'package:masyarakat/Petugas/updatePetugas.dart';
import 'package:masyarakat/home.dart';
import 'package:masyarakat/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => homeScreen()),
        GetPage(name: '/Tmasyarakat', page: () => CreateMasyarakat()),
        GetPage(name: '/Rmasyarakat', page: () => ReadMasyarakat()),
        GetPage(name: '/Umasyarakat', page: () => UpdateMasyarakat()),

        GetPage(name: '/Tpetugas', page: () => CreatePetugas()),
        GetPage(name: '/Rpetugas', page: () => ReadPetugas()),
        GetPage(name: '/Upetugas', page: () => UpdatePetugas()),
      ],
      home: homeScreen(),
    );
  }
}