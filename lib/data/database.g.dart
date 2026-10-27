// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoriteTracksTable extends FavoriteTracks
    with TableInfo<$FavoriteTracksTable, FavoriteTrack> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteTracksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _trackIdMeta = const VerificationMeta(
    'trackId',
  );
  @override
  late final GeneratedColumn<String> trackId = GeneratedColumn<String>(
    'track_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [trackId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_tracks';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteTrack> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('track_id')) {
      context.handle(
        _trackIdMeta,
        trackId.isAcceptableOrUnknown(data['track_id']!, _trackIdMeta),
      );
    } else if (isInserting) {
      context.missing(_trackIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trackId};
  @override
  FavoriteTrack map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteTrack(
      trackId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}track_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FavoriteTracksTable createAlias(String alias) {
    return $FavoriteTracksTable(attachedDatabase, alias);
  }
}

class FavoriteTrack extends DataClass implements Insertable<FavoriteTrack> {
  final String trackId;
  final DateTime createdAt;
  const FavoriteTrack({required this.trackId, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['track_id'] = Variable<String>(trackId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoriteTracksCompanion toCompanion(bool nullToAbsent) {
    return FavoriteTracksCompanion(
      trackId: Value(trackId),
      createdAt: Value(createdAt),
    );
  }

  factory FavoriteTrack.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteTrack(
      trackId: serializer.fromJson<String>(json['trackId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'trackId': serializer.toJson<String>(trackId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavoriteTrack copyWith({String? trackId, DateTime? createdAt}) =>
      FavoriteTrack(
        trackId: trackId ?? this.trackId,
        createdAt: createdAt ?? this.createdAt,
      );
  FavoriteTrack copyWithCompanion(FavoriteTracksCompanion data) {
    return FavoriteTrack(
      trackId: data.trackId.present ? data.trackId.value : this.trackId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteTrack(')
          ..write('trackId: $trackId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(trackId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteTrack &&
          other.trackId == this.trackId &&
          other.createdAt == this.createdAt);
}

class FavoriteTracksCompanion extends UpdateCompanion<FavoriteTrack> {
  final Value<String> trackId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FavoriteTracksCompanion({
    this.trackId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavoriteTracksCompanion.insert({
    required String trackId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : trackId = Value(trackId);
  static Insertable<FavoriteTrack> custom({
    Expression<String>? trackId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (trackId != null) 'track_id': trackId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavoriteTracksCompanion copyWith({
    Value<String>? trackId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return FavoriteTracksCompanion(
      trackId: trackId ?? this.trackId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (trackId.present) {
      map['track_id'] = Variable<String>(trackId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteTracksCompanion(')
          ..write('trackId: $trackId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteTracksTable favoriteTracks = $FavoriteTracksTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteTracks];
}

typedef $$FavoriteTracksTableCreateCompanionBuilder =
    FavoriteTracksCompanion Function({
      required String trackId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$FavoriteTracksTableUpdateCompanionBuilder =
    FavoriteTracksCompanion Function({
      Value<String> trackId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$FavoriteTracksTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteTracksTable> {
  $$FavoriteTracksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get trackId => $composableBuilder(
    column: $table.trackId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteTracksTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteTracksTable> {
  $$FavoriteTracksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get trackId => $composableBuilder(
    column: $table.trackId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteTracksTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteTracksTable> {
  $$FavoriteTracksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get trackId =>
      $composableBuilder(column: $table.trackId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavoriteTracksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteTracksTable,
          FavoriteTrack,
          $$FavoriteTracksTableFilterComposer,
          $$FavoriteTracksTableOrderingComposer,
          $$FavoriteTracksTableAnnotationComposer,
          $$FavoriteTracksTableCreateCompanionBuilder,
          $$FavoriteTracksTableUpdateCompanionBuilder,
          (
            FavoriteTrack,
            BaseReferences<_$AppDatabase, $FavoriteTracksTable, FavoriteTrack>,
          ),
          FavoriteTrack,
          PrefetchHooks Function()
        > {
  $$FavoriteTracksTableTableManager(
    _$AppDatabase db,
    $FavoriteTracksTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteTracksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteTracksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteTracksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> trackId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteTracksCompanion(
                trackId: trackId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String trackId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FavoriteTracksCompanion.insert(
                trackId: trackId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$FavoriteTracksTable, FavoriteTrack>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $FavoriteTracksTable,
                    FavoriteTrack
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteTracksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteTracksTable,
      FavoriteTrack,
      $$FavoriteTracksTableFilterComposer,
      $$FavoriteTracksTableOrderingComposer,
      $$FavoriteTracksTableAnnotationComposer,
      $$FavoriteTracksTableCreateCompanionBuilder,
      $$FavoriteTracksTableUpdateCompanionBuilder,
      (
        FavoriteTrack,
        BaseReferences<_$AppDatabase, $FavoriteTracksTable, FavoriteTrack>,
      ),
      FavoriteTrack,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteTracksTableTableManager get favoriteTracks =>
      $$FavoriteTracksTableTableManager(_db, _db.favoriteTracks);
}
