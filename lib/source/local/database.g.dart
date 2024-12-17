// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CowDataTable extends CowData with TableInfo<$CowDataTable, CowDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CowDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<int> sex = GeneratedColumn<int>(
      'sex', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _birthMeta = const VerificationMeta('birth');
  @override
  late final GeneratedColumn<DateTime> birth = GeneratedColumn<DateTime>(
      'birth', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, sex, birth];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cow_data';
  @override
  VerificationContext validateIntegrity(Insertable<CowDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
          _sexMeta, sex.isAcceptableOrUnknown(data['sex']!, _sexMeta));
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('birth')) {
      context.handle(
          _birthMeta, birth.isAcceptableOrUnknown(data['birth']!, _birthMeta));
    } else if (isInserting) {
      context.missing(_birthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CowDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CowDataData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sex'])!,
      birth: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth'])!,
    );
  }

  @override
  $CowDataTable createAlias(String alias) {
    return $CowDataTable(attachedDatabase, alias);
  }
}

class CowDataData extends DataClass implements Insertable<CowDataData> {
  final int id;
  final String name;
  final int sex;
  final DateTime birth;
  const CowDataData(
      {required this.id,
      required this.name,
      required this.sex,
      required this.birth});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sex'] = Variable<int>(sex);
    map['birth'] = Variable<DateTime>(birth);
    return map;
  }

  CowDataCompanion toCompanion(bool nullToAbsent) {
    return CowDataCompanion(
      id: Value(id),
      name: Value(name),
      sex: Value(sex),
      birth: Value(birth),
    );
  }

  factory CowDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CowDataData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sex: serializer.fromJson<int>(json['sex']),
      birth: serializer.fromJson<DateTime>(json['birth']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'sex': serializer.toJson<int>(sex),
      'birth': serializer.toJson<DateTime>(birth),
    };
  }

  CowDataData copyWith({int? id, String? name, int? sex, DateTime? birth}) =>
      CowDataData(
        id: id ?? this.id,
        name: name ?? this.name,
        sex: sex ?? this.sex,
        birth: birth ?? this.birth,
      );
  CowDataData copyWithCompanion(CowDataCompanion data) {
    return CowDataData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      sex: data.sex.present ? data.sex.value : this.sex,
      birth: data.birth.present ? data.birth.value : this.birth,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CowDataData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sex: $sex, ')
          ..write('birth: $birth')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, sex, birth);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CowDataData &&
          other.id == this.id &&
          other.name == this.name &&
          other.sex == this.sex &&
          other.birth == this.birth);
}

class CowDataCompanion extends UpdateCompanion<CowDataData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> sex;
  final Value<DateTime> birth;
  const CowDataCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sex = const Value.absent(),
    this.birth = const Value.absent(),
  });
  CowDataCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int sex,
    required DateTime birth,
  })  : name = Value(name),
        sex = Value(sex),
        birth = Value(birth);
  static Insertable<CowDataData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? sex,
    Expression<DateTime>? birth,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sex != null) 'sex': sex,
      if (birth != null) 'birth': birth,
    });
  }

  CowDataCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? sex,
      Value<DateTime>? birth}) {
    return CowDataCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sex: sex ?? this.sex,
      birth: birth ?? this.birth,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sex.present) {
      map['sex'] = Variable<int>(sex.value);
    }
    if (birth.present) {
      map['birth'] = Variable<DateTime>(birth.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CowDataCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sex: $sex, ')
          ..write('birth: $birth')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CowDataTable cowData = $CowDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cowData];
}

typedef $$CowDataTableCreateCompanionBuilder = CowDataCompanion Function({
  Value<int> id,
  required String name,
  required int sex,
  required DateTime birth,
});
typedef $$CowDataTableUpdateCompanionBuilder = CowDataCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> sex,
  Value<DateTime> birth,
});

class $$CowDataTableFilterComposer
    extends Composer<_$AppDatabase, $CowDataTable> {
  $$CowDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get birth => $composableBuilder(
      column: $table.birth, builder: (column) => ColumnFilters(column));
}

class $$CowDataTableOrderingComposer
    extends Composer<_$AppDatabase, $CowDataTable> {
  $$CowDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sex => $composableBuilder(
      column: $table.sex, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get birth => $composableBuilder(
      column: $table.birth, builder: (column) => ColumnOrderings(column));
}

class $$CowDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $CowDataTable> {
  $$CowDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<DateTime> get birth =>
      $composableBuilder(column: $table.birth, builder: (column) => column);
}

class $$CowDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CowDataTable,
    CowDataData,
    $$CowDataTableFilterComposer,
    $$CowDataTableOrderingComposer,
    $$CowDataTableAnnotationComposer,
    $$CowDataTableCreateCompanionBuilder,
    $$CowDataTableUpdateCompanionBuilder,
    (CowDataData, BaseReferences<_$AppDatabase, $CowDataTable, CowDataData>),
    CowDataData,
    PrefetchHooks Function()> {
  $$CowDataTableTableManager(_$AppDatabase db, $CowDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CowDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CowDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CowDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> sex = const Value.absent(),
            Value<DateTime> birth = const Value.absent(),
          }) =>
              CowDataCompanion(
            id: id,
            name: name,
            sex: sex,
            birth: birth,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int sex,
            required DateTime birth,
          }) =>
              CowDataCompanion.insert(
            id: id,
            name: name,
            sex: sex,
            birth: birth,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CowDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CowDataTable,
    CowDataData,
    $$CowDataTableFilterComposer,
    $$CowDataTableOrderingComposer,
    $$CowDataTableAnnotationComposer,
    $$CowDataTableCreateCompanionBuilder,
    $$CowDataTableUpdateCompanionBuilder,
    (CowDataData, BaseReferences<_$AppDatabase, $CowDataTable, CowDataData>),
    CowDataData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CowDataTableTableManager get cowData =>
      $$CowDataTableTableManager(_db, _db.cowData);
}
