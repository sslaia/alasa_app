import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                    hintText: "Nama Anda",
                    hintStyle: const TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: margaController,
                decoration: InputDecoration(
                    hintText: "Marga Anda",
                    hintStyle: const TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email Anda",
                    hintStyle: const TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: teleponController,
                decoration: InputDecoration(
                    hintText: "Telepon Anda",
                    hintStyle: const TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: pendidikanController,
                decoration: InputDecoration(
                    hintText: "Pendidikan terakhir Anda",
                    hintStyle: const TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: tanggalLahirController,
                decoration: InputDecoration(
                    hintText: "Tanggal lahir Anda",
                    hintStyle: const TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  print('Data telah dikirim');
                },
                child: Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
