import 'package:alasa_app/database_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormulirPage extends StatefulWidget {
  const FormulirPage({Key? key}) : super(key: key);

  @override
  _FormulirPageState createState() => _FormulirPageState();
}

class _FormulirPageState extends State<FormulirPage> {
  final _formKey = GlobalKey<FormState>();

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
    return Scaffold(
      appBar: AppBar(title: const Text('Formulir memasukkan data'),),
      body: Form(
        key: _formKey,
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
                    final form = _formKey.currentState;

                    if (_formKey.currentState!.validate()) {
                      form?.save();

                      // menyimpan data yang telah ada ke dalm tabel anggota di database
                      simpanData();

                      kosongkanFormulir();

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

  Future<void> simpanData() async {
    await DatabasePage.simpanData(namaController.text, margaController.text, emailController.text, teleponController.text, pendidikanController.text, tanggalLahirController.text);
  }

  void kosongkanFormulir() {
    // fungsi ini memuat ulang pohon widget dan mengosongkan formulir
    setState(() {
      namaController.clear();
      margaController.clear();
      emailController.clear();
      teleponController.clear();
      pendidikanController.clear();
      tanggalLahirController.clear();
    });
  }
}
