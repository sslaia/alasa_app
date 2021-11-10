import 'dart:async';
import 'package:sqflite/sqflite.dart' as sql;

class DatabasePage {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
    CREATE TABLE anggota(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    nama TEXT, 
    marga TEXT, 
    email TEXT, 
    telepon TEXT, 
    pendidikan TEXT, 
    tanggalLahir TEXT)
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
        'halasa.db',
        version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTables(database);
        }
    );
  }

  // Menyimpan data yang baru dimasukkan ke dalam tabel anggota di database
  static Future<int> simpanData(String nama, String marga, String email, String telepon, String pendidikan, String tanggalLahir) async {
    final db = await DatabasePage.db();
    final data = {
      'nama': nama,
      'marga': marga,
      'email': email,
      'telepon': telepon,
      'pendidikan': pendidikan,
      'tanggalLahir': tanggalLahir
    };
    final id = await db.insert(
        'anggota', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Mengambil semua isi tabel anggota dari database
  static Future<List<Map<String, dynamic>>> ambilSemuaAnggota() async {
    final db = await DatabasePage.db();
    return db.query('anggota', orderBy: "nama");
  }

  // Mengambil satu item dari tabel anggota
  static Future<List<Map<String, dynamic>>> ambilSatuAnggota(int id) async {
    final db = await DatabasePage.db();
    return db.query('anggota', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Mengupdate satu item dalam tabel anggota
  static Future<int> updateAnggota(int id, String nama, String marga, String email, String telepon, String pendidikan, String tanggalLahir) async {
    final db = await DatabasePage.db();
    final data = {
      'nama': nama,
      'marga': marga,
      'email': email,
      'telepon': telepon,
      'pendidikan': pendidikan,
      'tanggalLahir': tanggalLahir
    };

    final hasil = await db.update('anggota', data, where: "id = ?", whereArgs: [id]);
    return hasil;
  }

  // Menghapus satu item dalam tabel anggota
  static Future<void> hapusAnggota(int id) async {
    final db = await DatabasePage.db();
    try {
      await db.delete('anggota', where: "id = ?", whereArgs: [id]);
    } catch (err) {
      print("Ada masalah waktu mau menghapus: $err");
    }
  }

}