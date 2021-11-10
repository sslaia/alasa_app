import 'package:alasa_app/detil_anggota.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:alasa_app/database_page.dart';

class DaftarAnggota extends StatefulWidget {
  const DaftarAnggota({Key? key}) : super(key: key);

  @override
  _DaftarAnggotaState createState() => _DaftarAnggotaState();
}

class _DaftarAnggotaState extends State<DaftarAnggota> {
  // Semua anggota
  List<Map<String, dynamic>> _anggota = [];
  bool _sedangMengambil = true;

  // Mengambil data anggota dari database
  void _ambilDataAnggota() async {
    final data = await DatabasePage.ambilSemuaAnggota();
    setState(() {
      _anggota = data;
      _sedangMengambil = false;
    });
  }

  @override
  void initState() {
    _ambilDataAnggota();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar anggota'),
      ),
      body: _sedangMengambil
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: _anggota.length,
          itemBuilder: (context, index) => Card(
            color: Colors.orange[200],
            margin: const EdgeInsets.all(12.0),
            child: Slidable(
              actionPane: const SlidableDrawerActionPane(),
              secondaryActions: [
                IconSlideAction(
                  caption: 'Hapus',
                  color: Colors.red,
                  icon: Icons.delete,
                  // onTap: () => hapusData(_anggota[index]['id']),
                  onTap: () async {
                    await DatabasePage.hapusAnggota(_anggota[index]['id']);
                    _ambilDataAnggota();
                  },
                )
              ],
              child: ListTile(
                  title: Text(_anggota[index]['nama'] +
                      ' ' +
                      _anggota[index]['marga']),
                  subtitle: Text(_anggota[index]['email'] +
                      ',' +
                      _anggota[index]['telepon']),
                  onTap: () {
                    int id = _anggota[index]['id'];
                    String nama = _anggota[index]['nama'];
                    String marga = _anggota[index]['marga'];
                    String email = _anggota[index]['email'];
                    String telepon;
                    if (_anggota[index]['telepon'] != null) {
                      telepon = _anggota[index]['telepon'];
                    } else {
                      telepon = "kosong";
                    }
                    String pendidikan;
                    if (_anggota[index]['pendidikan'] != null) {
                      pendidikan = _anggota[index]['pendidikan'];
                    } else {
                      pendidikan = "kosong";
                    }
                    String tanggalLahir;
                    if (_anggota[index]['tanggalLahir'] != null) {
                      tanggalLahir = _anggota[index]['tanggalLahir'];
                    } else {
                      tanggalLahir = "kosong";
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetilAnggota(
                            id: id,
                            nama: nama,
                            marga: marga,
                            email: email,
                            telepon: telepon,
                            pendidikan: pendidikan,
                            tanggalLahir: tanggalLahir),
                      ),
                    );
                  }),
            ),
          )),
    );
  }

  Future<void> hapusData(int id) async {
    await DatabasePage.hapusAnggota(id);
  }
}
