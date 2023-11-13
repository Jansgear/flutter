import 'package:flutter/material.dart';

final ButtonStyle buttonMasyarakat = ElevatedButton.styleFrom(
  minimumSize: Size(1000, 36), backgroundColor: Colors.red,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);

final ButtonStyle buttonPetugas = ElevatedButton.styleFrom(
  minimumSize: Size(1000, 36), backgroundColor: Colors.green,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);