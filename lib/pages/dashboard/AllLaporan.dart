import 'package:flutter/material.dart';
import 'package:lapor_book/model/Akun.dart';

class AllLaporan extends StatelessWidget {
  final Akun akun;
  AllLaporan({super.key, required this.akun});
  
  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ini All Laporan"),
    );
  }
}