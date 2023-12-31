import 'package:flutter/material.dart';
import 'package:lapor_book/model/Akun.dart';

class MyLaporan extends StatelessWidget {
  final Akun akun;
  MyLaporan({super.key, required this.akun});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ini My Laporan"),
    );
  }
}