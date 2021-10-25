import 'package:moor_flutter/moor_flutter.dart';
part 'alasa_database.g.dart';

class Anggotas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text().withLength(min: 1, max: 50)();
  TextColumn get marga => text().withLength(min: 1, max: 20)();
  TextColumn get email => text().withLength(min: 1, max: 20)();
  TextColumn get telepon => text().nullable()();
  TextColumn get pendidikan => text().nullable()();
  TextColumn get tanggalLahir => text().nullable()();
}

@UseMoor(tables: [Anggotas], daos: [AnggotaDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db_alasa.sqlite',
    logStatements: true,
  )));

  @override
  int get schemaVersion => 1;

}

@UseDao(tables: [Anggotas])
class AnggotaDao extends DatabaseAccessor<AppDatabase> with _$AnggotaDaoMixin {
  final AppDatabase db;

  AnggotaDao(this.db) : super(db);

  // Ini fungsi untuk menarik data semua anggota dalam database
  Future<List<Anggota>> getSemuaAnggota() => select(anggotas).get();

  // Ini fungsi untuk menampilkan daftar urutan berdasarkan nama dan marga
  Stream<List<Anggota>> watchSemuaAnggota() {
    return (select(anggotas)
        ..orderBy(
            ([(t) => OrderingTerm(expression: t.nama, mode: OrderingMode.asc),
              (t) => OrderingTerm(expression: t.marga)])
        )
    ).watch();
  }
  // Ini fungsi untuk menampilkan daftar urutan berdasarkan pendidikan
  Stream<List<Anggota>> watchPendidikanAnggota() {
    return (select(anggotas)
      ..orderBy(
          ([(t) => OrderingTerm(expression: t.pendidikan, mode: OrderingMode.asc),
                (t) => OrderingTerm(expression: t.nama)])
      )
    ).watch();
  }

  // Ini fungsi untuk menambah item baru ke dalam database
  Future insertAnggota(Insertable<Anggota> anggota) => into(anggotas).insert(anggota);
  // Ini fungsi untuk mengubah item yang telah ada di dalam database
  Future updateAnggota(Insertable<Anggota> anggota) => update(anggotas).replace(anggota);
  // Ini fungsi untuk menghapus satu item dalam database
  Future deleteAnggota(Insertable<Anggota> anggota) => delete(anggotas).delete(anggota);
}