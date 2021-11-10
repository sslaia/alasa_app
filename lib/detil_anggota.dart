import 'package:alasa_app/database_page.dart';
import 'package:flutter/material.dart';

class DetilAnggota extends StatefulWidget {
  final int id;
  final String nama;
  final String marga;
  final String email;
  final String telepon;
  final String pendidikan;
  final String tanggalLahir;

  const DetilAnggota(
      {Key? key,
      required this.id,
      required this.nama,
      required this.marga,
      required this.email,
      required this.telepon,
      required this.pendidikan,
      required this.tanggalLahir})
      : super(key: key);

  @override
  State<DetilAnggota> createState() => _DetilAnggotaState();
}

class _DetilAnggotaState extends State<DetilAnggota> {
  final _detilKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final margaController = TextEditingController();
  final emailController = TextEditingController();
  final teleponController = TextEditingController();
  final pendidikanController = TextEditingController();
  final tanggalLahirController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    margaController.dispose();
    emailController.dispose();
    teleponController.dispose();
    pendidikanController.dispose();
    tanggalLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    namaController.text = widget.nama;
    margaController.text = widget.marga;
    emailController.text = widget.email;
    if (widget.telepon != "kosong") {
      teleponController.text = widget.telepon;
    } else {
      teleponController.text = "";
    }
    if (widget.pendidikan != "kosong") {
      pendidikanController.text = widget.pendidikan;
    } else {
      pendidikanController.text = "";
    }
    if (widget.tanggalLahir != "kosong") {
      tanggalLahirController.text = widget.tanggalLahir;
    } else {
      tanggalLahirController.text = "";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detil data anggota'),
      ),
      body: Form(
        key: _detilKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: namaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan nama Anda!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Nama Anda",
                      labelText: "Nama depan",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: margaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan marga Anda!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Marga Anda",
                      labelText: "Nama belakang",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Masukkan email Anda!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Email Anda",
                      labelText: "Alamat email (contoh: manu@hewan.com)",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: teleponController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Telepon Anda",
                      labelText: "Nomor telepon (08120897652)",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: pendidikanController,
                  decoration: InputDecoration(
                      hintText: "Pendidikan terakhir Anda",
                      labelText: "Pendidikan terakhir (SD/SMP/SMA/PT)",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: tanggalLahirController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      hintText: "Tanggal lahir Anda",
                      labelText: "Tanggal lahir (contoh: 13/1/2001)",
                      hintStyle: const TextStyle(color: Colors.black26),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // final dao = Provider.of<AnggotaDao>(context, listen: false);
                    // DateTime tanggal = DateTime.parse(tanggalLahirController.text);

                    final form = _detilKey.currentState;

                    if (_detilKey.currentState!.validate()) {
                      form?.save();
                      // mengupdate data yang telah ada ke dalm tabel anggota di database
                      updateData();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data telah disimpan!'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  child: const Text('Kirim'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateData() async {
    await DatabasePage.updateAnggota(widget.id, namaController.text, margaController.text, emailController.text, teleponController.text, pendidikanController.text, tanggalLahirController.text);
  }
}
