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
    return Container();
  }
}
