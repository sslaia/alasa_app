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

  String data = '';

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
      appBar: AppBar(title: Text('Formulir memasukkan data')),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                    hintText: "Nama Anda",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0,),
              TextField(
                controller: margaController,
                decoration: InputDecoration(
                    hintText: "Marga Anda",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email Anda",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0,),
              TextField(
                controller: teleponController,
                decoration: InputDecoration(
                    hintText: "Telepon Anda",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0,),
              TextField(
                controller: pendidikanController,
                decoration: InputDecoration(
                    hintText: "Pendidikan Anda",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(height: 8.0,),
              TextField(
                controller: tanggalLahirController,
                decoration: InputDecoration(
                    hintText: "Tanggal lahir Anda",
                    hintStyle: TextStyle(color: Colors.black26),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    data = namaController.text + ' ' + margaController.text + ' '
                        + emailController.text + ' ' + teleponController.text + ' '
                        + pendidikanController.text + ' ' + tanggalLahirController.text;
                  });
                },
                child: Text('Kirim'),
              ),
              Text('Data yang Anda masukkan adalah \n$data'),
            ],
          ),
        ),
      ),
    );
  }
}
