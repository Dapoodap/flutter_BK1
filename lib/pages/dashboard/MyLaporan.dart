import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lapor_book/model/Akun.dart';
import 'package:lapor_book/model/Laporan.dart';
import 'package:lapor_book/component/list_item.dart';

class MyLaporan extends StatefulWidget {
  final Akun akun;
  MyLaporan({Key? key, required this.akun}) : super(key: key);

  @override
  State<MyLaporan> createState() => _MyLaporanState();
}

class _MyLaporanState extends State<MyLaporan> {
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Laporan> listLaporan = [];

  @override
  void initState() {
    super.initState();
    getTransaksi();
  }

  void getTransaksi() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('laporan')
          .where('uid', isEqualTo: _auth.currentUser!.uid)
          .get();

      if (mounted) {
        setState(() {
          listLaporan.clear();
          for (var documents in querySnapshot.docs) {
            List<dynamic>? komentarData = documents.data()['komentar'];

            List<Komentar>? listKomentar = komentarData?.map((map) {
              return Komentar(
                nama: map['nama'],
                isi: map['isi'],
              );
            }).toList();

            listLaporan.add(
              Laporan(
                uid: documents.data()['uid'],
                docId: documents.data()['docId'],
                judul: documents.data()['judul'],
                like : documents.data()['like'],
                instansi: documents.data()['instansi'],
                deskripsi: documents.data()['deskripsi'],
                nama: documents.data()['nama'],
                status: documents.data()['status'],
                gambar: documents.data()['gambar'],
                tanggal: documents['tanggal'].toDate(),
                maps: documents.data()['maps'],
                likedBy: documents.data()['likedBy'],

                komentar: listKomentar,
              ),
            );
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 1.234,
          ),
          itemCount: listLaporan.length,
          itemBuilder: (context, index) {
            return ListItem(
              laporan: listLaporan[index],
              akun: widget.akun,
              isLaporanku: true,
            );
          },
        ),
      ),
    );
  }
}