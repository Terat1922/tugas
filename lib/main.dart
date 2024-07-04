import 'package:flutter/material.dart';
import 'logout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY HERO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogoutPage(), // Mengatur LogoutPage sebagai halaman awal
      debugShowCheckedModeBanner: false, // Menyembunyikan tulisan debug
    );
  }
}
