import 'package:alasa_app/daftar_anggota.dart';
import 'package:alasa_app/formulir_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Alasa")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            Text("Ya'ahowu", style: TextStyle(fontSize: 24)),
            SizedBox(height: 50),
            Text("ALASA", style: TextStyle(fontSize: 48)),
            SizedBox(height: 50),
            Text("Aplikasi database anggota", style: TextStyle(fontSize: 24)),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        activeIcon: Icons.close,
        spacing: 3,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        elevation: 8.0,
        isOpenOnStart: false,
        animationSpeed: 200,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.margin),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: 'Daftar anggota',
            visible: true,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DaftarAnggota(),),);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.accessibility),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            label: 'Manipulasi data',
            onTap: () {
              //TODO: Operasi database (update, delete)
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.edit),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: 'Memasukkan data',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FormulirPage(),),);
              //TODO: Memasukkan data
            },
          ),
        ],
      ),
    );
  }
}
