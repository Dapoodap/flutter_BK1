class Laporan {
  final String uid;
  final String docId;
  int like;
  final String judul;
  final String instansi;
  String? deskripsi;
  String? gambar;
  final String nama;
  final String status;
  final DateTime tanggal;
  final String maps;
  List<Komentar>? komentar;
  List? likedBy;

  Laporan({
    required this.uid,
    required this.docId,
    required this.judul,
    required this.like,
    required this.instansi,
    this.deskripsi,
    this.gambar,
    required this.nama,
    required this.status,
    required this.tanggal,
    required this.maps,
    this.komentar,
    this.likedBy
  });
  void incrementLike() {
    like++;
  }
}

class Komentar {
  final String nama;
  final String isi;

  Komentar({
    required this.nama,
    required this.isi,
  });

}