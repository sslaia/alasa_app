// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alasa_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Anggota extends DataClass implements Insertable<Anggota> {
  final int id;
  final String nama;
  final String marga;
  final String email;
  final String? telepon;
  final String? pendidikan;
  final String? tanggalLahir;
  Anggota(
      {required this.id,
      required this.nama,
      required this.marga,
      required this.email,
      this.telepon,
      this.pendidikan,
      this.tanggalLahir});
  factory Anggota.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Anggota(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nama: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nama'])!,
      marga: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}marga'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      telepon: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}telepon']),
      pendidikan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}pendidikan']),
      tanggalLahir: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tanggal_lahir']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    map['marga'] = Variable<String>(marga);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || telepon != null) {
      map['telepon'] = Variable<String?>(telepon);
    }
    if (!nullToAbsent || pendidikan != null) {
      map['pendidikan'] = Variable<String?>(pendidikan);
    }
    if (!nullToAbsent || tanggalLahir != null) {
      map['tanggal_lahir'] = Variable<String?>(tanggalLahir);
    }
    return map;
  }

  AnggotasCompanion toCompanion(bool nullToAbsent) {
    return AnggotasCompanion(
      id: Value(id),
      nama: Value(nama),
      marga: Value(marga),
      email: Value(email),
      telepon: telepon == null && nullToAbsent
          ? const Value.absent()
          : Value(telepon),
      pendidikan: pendidikan == null && nullToAbsent
          ? const Value.absent()
          : Value(pendidikan),
      tanggalLahir: tanggalLahir == null && nullToAbsent
          ? const Value.absent()
          : Value(tanggalLahir),
    );
  }

  factory Anggota.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Anggota(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      marga: serializer.fromJson<String>(json['marga']),
      email: serializer.fromJson<String>(json['email']),
      telepon: serializer.fromJson<String?>(json['telepon']),
      pendidikan: serializer.fromJson<String?>(json['pendidikan']),
      tanggalLahir: serializer.fromJson<String?>(json['tanggalLahir']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'marga': serializer.toJson<String>(marga),
      'email': serializer.toJson<String>(email),
      'telepon': serializer.toJson<String?>(telepon),
      'pendidikan': serializer.toJson<String?>(pendidikan),
      'tanggalLahir': serializer.toJson<String?>(tanggalLahir),
    };
  }

  Anggota copyWith(
          {int? id,
          String? nama,
          String? marga,
          String? email,
          String? telepon,
          String? pendidikan,
          String? tanggalLahir}) =>
      Anggota(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        marga: marga ?? this.marga,
        email: email ?? this.email,
        telepon: telepon ?? this.telepon,
        pendidikan: pendidikan ?? this.pendidikan,
        tanggalLahir: tanggalLahir ?? this.tanggalLahir,
      );
  @override
  String toString() {
    return (StringBuffer('Anggota(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('marga: $marga, ')
          ..write('email: $email, ')
          ..write('telepon: $telepon, ')
          ..write('pendidikan: $pendidikan, ')
          ..write('tanggalLahir: $tanggalLahir')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nama, marga, email, telepon, pendidikan, tanggalLahir);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Anggota &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.marga == this.marga &&
          other.email == this.email &&
          other.telepon == this.telepon &&
          other.pendidikan == this.pendidikan &&
          other.tanggalLahir == this.tanggalLahir);
}

class AnggotasCompanion extends UpdateCompanion<Anggota> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String> marga;
  final Value<String> email;
  final Value<String?> telepon;
  final Value<String?> pendidikan;
  final Value<String?> tanggalLahir;
  const AnggotasCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.marga = const Value.absent(),
    this.email = const Value.absent(),
    this.telepon = const Value.absent(),
    this.pendidikan = const Value.absent(),
    this.tanggalLahir = const Value.absent(),
  });
  AnggotasCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    required String marga,
    required String email,
    this.telepon = const Value.absent(),
    this.pendidikan = const Value.absent(),
    this.tanggalLahir = const Value.absent(),
  })  : nama = Value(nama),
        marga = Value(marga),
        email = Value(email);
  static Insertable<Anggota> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? marga,
    Expression<String>? email,
    Expression<String?>? telepon,
    Expression<String?>? pendidikan,
    Expression<String?>? tanggalLahir,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (marga != null) 'marga': marga,
      if (email != null) 'email': email,
      if (telepon != null) 'telepon': telepon,
      if (pendidikan != null) 'pendidikan': pendidikan,
      if (tanggalLahir != null) 'tanggal_lahir': tanggalLahir,
    });
  }

  AnggotasCompanion copyWith(
      {Value<int>? id,
      Value<String>? nama,
      Value<String>? marga,
      Value<String>? email,
      Value<String?>? telepon,
      Value<String?>? pendidikan,
      Value<String?>? tanggalLahir}) {
    return AnggotasCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      marga: marga ?? this.marga,
      email: email ?? this.email,
      telepon: telepon ?? this.telepon,
      pendidikan: pendidikan ?? this.pendidikan,
      tanggalLahir: tanggalLahir ?? this.tanggalLahir,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (marga.present) {
      map['marga'] = Variable<String>(marga.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (telepon.present) {
      map['telepon'] = Variable<String?>(telepon.value);
    }
    if (pendidikan.present) {
      map['pendidikan'] = Variable<String?>(pendidikan.value);
    }
    if (tanggalLahir.present) {
      map['tanggal_lahir'] = Variable<String?>(tanggalLahir.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnggotasCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('marga: $marga, ')
          ..write('email: $email, ')
          ..write('telepon: $telepon, ')
          ..write('pendidikan: $pendidikan, ')
          ..write('tanggalLahir: $tanggalLahir')
          ..write(')'))
        .toString();
  }
}

class $AnggotasTable extends Anggotas with TableInfo<$AnggotasTable, Anggota> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AnggotasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _namaMeta = const VerificationMeta('nama');
  late final GeneratedColumn<String?> nama = GeneratedColumn<String?>(
      'nama', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _margaMeta = const VerificationMeta('marga');
  late final GeneratedColumn<String?> marga = GeneratedColumn<String?>(
      'marga', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _teleponMeta = const VerificationMeta('telepon');
  late final GeneratedColumn<String?> telepon = GeneratedColumn<String?>(
      'telepon', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _pendidikanMeta = const VerificationMeta('pendidikan');
  late final GeneratedColumn<String?> pendidikan = GeneratedColumn<String?>(
      'pendidikan', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _tanggalLahirMeta =
      const VerificationMeta('tanggalLahir');
  late final GeneratedColumn<String?> tanggalLahir = GeneratedColumn<String?>(
      'tanggal_lahir', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nama, marga, email, telepon, pendidikan, tanggalLahir];
  @override
  String get aliasedName => _alias ?? 'anggotas';
  @override
  String get actualTableName => 'anggotas';
  @override
  VerificationContext validateIntegrity(Insertable<Anggota> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
          _namaMeta, nama.isAcceptableOrUnknown(data['nama']!, _namaMeta));
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('marga')) {
      context.handle(
          _margaMeta, marga.isAcceptableOrUnknown(data['marga']!, _margaMeta));
    } else if (isInserting) {
      context.missing(_margaMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('telepon')) {
      context.handle(_teleponMeta,
          telepon.isAcceptableOrUnknown(data['telepon']!, _teleponMeta));
    }
    if (data.containsKey('pendidikan')) {
      context.handle(
          _pendidikanMeta,
          pendidikan.isAcceptableOrUnknown(
              data['pendidikan']!, _pendidikanMeta));
    }
    if (data.containsKey('tanggal_lahir')) {
      context.handle(
          _tanggalLahirMeta,
          tanggalLahir.isAcceptableOrUnknown(
              data['tanggal_lahir']!, _tanggalLahirMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Anggota map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Anggota.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $AnggotasTable createAlias(String alias) {
    return $AnggotasTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $AnggotasTable anggotas = $AnggotasTable(this);
  late final AnggotaDao anggotaDao = AnggotaDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [anggotas];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AnggotaDaoMixin on DatabaseAccessor<AppDatabase> {
  $AnggotasTable get anggotas => attachedDatabase.anggotas;
}
