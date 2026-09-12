// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CollectionTableTable extends CollectionTable
    with TableInfo<$CollectionTableTable, CollectionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediaMeta = const VerificationMeta('media');
  @override
  late final GeneratedColumn<Uint8List> media = GeneratedColumn<Uint8List>(
      'media', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _modifiedAtMeta =
      const VerificationMeta('modifiedAt');
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
      'modified_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, media, createdAt, modifiedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection';
  @override
  VerificationContext validateIntegrity(
      Insertable<CollectionTableData> instance,
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('media')) {
      context.handle(
          _mediaMeta, media.isAcceptableOrUnknown(data['media']!, _mediaMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('modified_at')) {
      context.handle(
          _modifiedAtMeta,
          modifiedAt.isAcceptableOrUnknown(
              data['modified_at']!, _modifiedAtMeta));
    } else if (isInserting) {
      context.missing(_modifiedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      media: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}media']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      modifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_at'])!,
    );
  }

  @override
  $CollectionTableTable createAlias(String alias) {
    return $CollectionTableTable(attachedDatabase, alias);
  }
}

class CollectionTableData extends DataClass
    implements Insertable<CollectionTableData> {
  final int id;
  final String name;
  final String? description;
  final Uint8List? media;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const CollectionTableData(
      {required this.id,
      required this.name,
      this.description,
      this.media,
      required this.createdAt,
      required this.modifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || media != null) {
      map['media'] = Variable<Uint8List>(media);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['modified_at'] = Variable<DateTime>(modifiedAt);
    return map;
  }

  CollectionTableCompanion toCompanion(bool nullToAbsent) {
    return CollectionTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      media:
          media == null && nullToAbsent ? const Value.absent() : Value(media),
      createdAt: Value(createdAt),
      modifiedAt: Value(modifiedAt),
    );
  }

  factory CollectionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      media: serializer.fromJson<Uint8List?>(json['media']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      modifiedAt: serializer.fromJson<DateTime>(json['modifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'media': serializer.toJson<Uint8List?>(media),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'modifiedAt': serializer.toJson<DateTime>(modifiedAt),
    };
  }

  CollectionTableData copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<Uint8List?> media = const Value.absent(),
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      CollectionTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        media: media.present ? media.value : this.media,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
  CollectionTableData copyWithCompanion(CollectionTableCompanion data) {
    return CollectionTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      media: data.media.present ? data.media.value : this.media,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt:
          data.modifiedAt.present ? data.modifiedAt.value : this.modifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('media: $media, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description,
      $driftBlobEquality.hash(media), createdAt, modifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.media, this.media) &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class CollectionTableCompanion extends UpdateCompanion<CollectionTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<Uint8List?> media;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const CollectionTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.media = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  CollectionTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.media = const Value.absent(),
    required DateTime createdAt,
    required DateTime modifiedAt,
  })  : name = Value(name),
        createdAt = Value(createdAt),
        modifiedAt = Value(modifiedAt);
  static Insertable<CollectionTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<Uint8List>? media,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (media != null) 'media': media,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
    });
  }

  CollectionTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<Uint8List?>? media,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return CollectionTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      media: media ?? this.media,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (media.present) {
      map['media'] = Variable<Uint8List>(media.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('media: $media, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }
}

class $NoteCitationTableTable extends NoteCitationTable
    with TableInfo<$NoteCitationTableTable, NoteCitationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteCitationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _modifiedAtMeta =
      const VerificationMeta('modifiedAt');
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
      'modified_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, createdAt, modifiedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_citation';
  @override
  VerificationContext validateIntegrity(
      Insertable<NoteCitationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('modified_at')) {
      context.handle(
          _modifiedAtMeta,
          modifiedAt.isAcceptableOrUnknown(
              data['modified_at']!, _modifiedAtMeta));
    } else if (isInserting) {
      context.missing(_modifiedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteCitationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteCitationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      modifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_at'])!,
    );
  }

  @override
  $NoteCitationTableTable createAlias(String alias) {
    return $NoteCitationTableTable(attachedDatabase, alias);
  }
}

class NoteCitationTableData extends DataClass
    implements Insertable<NoteCitationTableData> {
  final int id;
  final String title;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const NoteCitationTableData(
      {required this.id,
      required this.title,
      required this.createdAt,
      required this.modifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['modified_at'] = Variable<DateTime>(modifiedAt);
    return map;
  }

  NoteCitationTableCompanion toCompanion(bool nullToAbsent) {
    return NoteCitationTableCompanion(
      id: Value(id),
      title: Value(title),
      createdAt: Value(createdAt),
      modifiedAt: Value(modifiedAt),
    );
  }

  factory NoteCitationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteCitationTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      modifiedAt: serializer.fromJson<DateTime>(json['modifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'modifiedAt': serializer.toJson<DateTime>(modifiedAt),
    };
  }

  NoteCitationTableData copyWith(
          {int? id,
          String? title,
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      NoteCitationTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
  NoteCitationTableData copyWithCompanion(NoteCitationTableCompanion data) {
    return NoteCitationTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt:
          data.modifiedAt.present ? data.modifiedAt.value : this.modifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteCitationTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, createdAt, modifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteCitationTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class NoteCitationTableCompanion
    extends UpdateCompanion<NoteCitationTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const NoteCitationTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  NoteCitationTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime createdAt,
    required DateTime modifiedAt,
  })  : title = Value(title),
        createdAt = Value(createdAt),
        modifiedAt = Value(modifiedAt);
  static Insertable<NoteCitationTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
    });
  }

  NoteCitationTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return NoteCitationTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteCitationTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }
}

class $NoteTableTable extends NoteTable
    with TableInfo<$NoteTableTable, NoteTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediaMeta = const VerificationMeta('media');
  @override
  late final GeneratedColumn<Uint8List> media = GeneratedColumn<Uint8List>(
      'media', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _citationIdMeta =
      const VerificationMeta('citationId');
  @override
  late final GeneratedColumn<int> citationId = GeneratedColumn<int>(
      'citation_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES note_citation (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _modifiedAtMeta =
      const VerificationMeta('modifiedAt');
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
      'modified_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, content, media, citationId, createdAt, modifiedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note';
  @override
  VerificationContext validateIntegrity(Insertable<NoteTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('media')) {
      context.handle(
          _mediaMeta, media.isAcceptableOrUnknown(data['media']!, _mediaMeta));
    }
    if (data.containsKey('citation_id')) {
      context.handle(
          _citationIdMeta,
          citationId.isAcceptableOrUnknown(
              data['citation_id']!, _citationIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('modified_at')) {
      context.handle(
          _modifiedAtMeta,
          modifiedAt.isAcceptableOrUnknown(
              data['modified_at']!, _modifiedAtMeta));
    } else if (isInserting) {
      context.missing(_modifiedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      media: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}media']),
      citationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}citation_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      modifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_at'])!,
    );
  }

  @override
  $NoteTableTable createAlias(String alias) {
    return $NoteTableTable(attachedDatabase, alias);
  }
}

class NoteTableData extends DataClass implements Insertable<NoteTableData> {
  final int id;
  final String? content;
  final Uint8List? media;
  final int? citationId;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const NoteTableData(
      {required this.id,
      this.content,
      this.media,
      this.citationId,
      required this.createdAt,
      required this.modifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || media != null) {
      map['media'] = Variable<Uint8List>(media);
    }
    if (!nullToAbsent || citationId != null) {
      map['citation_id'] = Variable<int>(citationId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['modified_at'] = Variable<DateTime>(modifiedAt);
    return map;
  }

  NoteTableCompanion toCompanion(bool nullToAbsent) {
    return NoteTableCompanion(
      id: Value(id),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      media:
          media == null && nullToAbsent ? const Value.absent() : Value(media),
      citationId: citationId == null && nullToAbsent
          ? const Value.absent()
          : Value(citationId),
      createdAt: Value(createdAt),
      modifiedAt: Value(modifiedAt),
    );
  }

  factory NoteTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteTableData(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String?>(json['content']),
      media: serializer.fromJson<Uint8List?>(json['media']),
      citationId: serializer.fromJson<int?>(json['citationId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      modifiedAt: serializer.fromJson<DateTime>(json['modifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String?>(content),
      'media': serializer.toJson<Uint8List?>(media),
      'citationId': serializer.toJson<int?>(citationId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'modifiedAt': serializer.toJson<DateTime>(modifiedAt),
    };
  }

  NoteTableData copyWith(
          {int? id,
          Value<String?> content = const Value.absent(),
          Value<Uint8List?> media = const Value.absent(),
          Value<int?> citationId = const Value.absent(),
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      NoteTableData(
        id: id ?? this.id,
        content: content.present ? content.value : this.content,
        media: media.present ? media.value : this.media,
        citationId: citationId.present ? citationId.value : this.citationId,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
  NoteTableData copyWithCompanion(NoteTableCompanion data) {
    return NoteTableData(
      id: data.id.present ? data.id.value : this.id,
      content: data.content.present ? data.content.value : this.content,
      media: data.media.present ? data.media.value : this.media,
      citationId:
          data.citationId.present ? data.citationId.value : this.citationId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt:
          data.modifiedAt.present ? data.modifiedAt.value : this.modifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteTableData(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('media: $media, ')
          ..write('citationId: $citationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, $driftBlobEquality.hash(media),
      citationId, createdAt, modifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteTableData &&
          other.id == this.id &&
          other.content == this.content &&
          $driftBlobEquality.equals(other.media, this.media) &&
          other.citationId == this.citationId &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class NoteTableCompanion extends UpdateCompanion<NoteTableData> {
  final Value<int> id;
  final Value<String?> content;
  final Value<Uint8List?> media;
  final Value<int?> citationId;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const NoteTableCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.media = const Value.absent(),
    this.citationId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  NoteTableCompanion.insert({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.media = const Value.absent(),
    this.citationId = const Value.absent(),
    required DateTime createdAt,
    required DateTime modifiedAt,
  })  : createdAt = Value(createdAt),
        modifiedAt = Value(modifiedAt);
  static Insertable<NoteTableData> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<Uint8List>? media,
    Expression<int>? citationId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (media != null) 'media': media,
      if (citationId != null) 'citation_id': citationId,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
    });
  }

  NoteTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? content,
      Value<Uint8List?>? media,
      Value<int?>? citationId,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return NoteTableCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      media: media ?? this.media,
      citationId: citationId ?? this.citationId,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (media.present) {
      map['media'] = Variable<Uint8List>(media.value);
    }
    if (citationId.present) {
      map['citation_id'] = Variable<int>(citationId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteTableCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('media: $media, ')
          ..write('citationId: $citationId, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }
}

class $CollectionNoteRefTableTable extends CollectionNoteRefTable
    with TableInfo<$CollectionNoteRefTableTable, CollectionNoteRefTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionNoteRefTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
      'note_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES note (id)'));
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  @override
  late final GeneratedColumn<int> collectionId = GeneratedColumn<int>(
      'collection_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES collection (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, noteId, collectionId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_note_ref';
  @override
  VerificationContext validateIntegrity(
      Insertable<CollectionNoteRefTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('note_id')) {
      context.handle(_noteIdMeta,
          noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta));
    } else if (isInserting) {
      context.missing(_noteIdMeta);
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    } else if (isInserting) {
      context.missing(_collectionIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionNoteRefTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionNoteRefTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      noteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}note_id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $CollectionNoteRefTableTable createAlias(String alias) {
    return $CollectionNoteRefTableTable(attachedDatabase, alias);
  }
}

class CollectionNoteRefTableData extends DataClass
    implements Insertable<CollectionNoteRefTableData> {
  final int id;
  final int noteId;
  final int collectionId;
  final DateTime createdAt;
  const CollectionNoteRefTableData(
      {required this.id,
      required this.noteId,
      required this.collectionId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['note_id'] = Variable<int>(noteId);
    map['collection_id'] = Variable<int>(collectionId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CollectionNoteRefTableCompanion toCompanion(bool nullToAbsent) {
    return CollectionNoteRefTableCompanion(
      id: Value(id),
      noteId: Value(noteId),
      collectionId: Value(collectionId),
      createdAt: Value(createdAt),
    );
  }

  factory CollectionNoteRefTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionNoteRefTableData(
      id: serializer.fromJson<int>(json['id']),
      noteId: serializer.fromJson<int>(json['noteId']),
      collectionId: serializer.fromJson<int>(json['collectionId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'noteId': serializer.toJson<int>(noteId),
      'collectionId': serializer.toJson<int>(collectionId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CollectionNoteRefTableData copyWith(
          {int? id, int? noteId, int? collectionId, DateTime? createdAt}) =>
      CollectionNoteRefTableData(
        id: id ?? this.id,
        noteId: noteId ?? this.noteId,
        collectionId: collectionId ?? this.collectionId,
        createdAt: createdAt ?? this.createdAt,
      );
  CollectionNoteRefTableData copyWithCompanion(
      CollectionNoteRefTableCompanion data) {
    return CollectionNoteRefTableData(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionNoteRefTableData(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, noteId, collectionId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionNoteRefTableData &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.collectionId == this.collectionId &&
          other.createdAt == this.createdAt);
}

class CollectionNoteRefTableCompanion
    extends UpdateCompanion<CollectionNoteRefTableData> {
  final Value<int> id;
  final Value<int> noteId;
  final Value<int> collectionId;
  final Value<DateTime> createdAt;
  const CollectionNoteRefTableCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CollectionNoteRefTableCompanion.insert({
    this.id = const Value.absent(),
    required int noteId,
    required int collectionId,
    required DateTime createdAt,
  })  : noteId = Value(noteId),
        collectionId = Value(collectionId),
        createdAt = Value(createdAt);
  static Insertable<CollectionNoteRefTableData> custom({
    Expression<int>? id,
    Expression<int>? noteId,
    Expression<int>? collectionId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (collectionId != null) 'collection_id': collectionId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CollectionNoteRefTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? noteId,
      Value<int>? collectionId,
      Value<DateTime>? createdAt}) {
    return CollectionNoteRefTableCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      collectionId: collectionId ?? this.collectionId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<int>(noteId.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<int>(collectionId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionNoteRefTableCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CollectionMediaTableTable extends CollectionMediaTable
    with TableInfo<$CollectionMediaTableTable, CollectionMediaTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionMediaTableTable(this.attachedDatabase, [this._alias]);
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
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _captionMeta =
      const VerificationMeta('caption');
  @override
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
      'caption', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediaMeta = const VerificationMeta('media');
  @override
  late final GeneratedColumn<Uint8List> media = GeneratedColumn<Uint8List>(
      'media', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _modifiedAtMeta =
      const VerificationMeta('modifiedAt');
  @override
  late final GeneratedColumn<DateTime> modifiedAt = GeneratedColumn<DateTime>(
      'modified_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, caption, media, createdAt, modifiedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_media';
  @override
  VerificationContext validateIntegrity(
      Insertable<CollectionMediaTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('caption')) {
      context.handle(_captionMeta,
          caption.isAcceptableOrUnknown(data['caption']!, _captionMeta));
    }
    if (data.containsKey('media')) {
      context.handle(
          _mediaMeta, media.isAcceptableOrUnknown(data['media']!, _mediaMeta));
    } else if (isInserting) {
      context.missing(_mediaMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('modified_at')) {
      context.handle(
          _modifiedAtMeta,
          modifiedAt.isAcceptableOrUnknown(
              data['modified_at']!, _modifiedAtMeta));
    } else if (isInserting) {
      context.missing(_modifiedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionMediaTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionMediaTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      caption: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}caption']),
      media: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}media'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      modifiedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}modified_at'])!,
    );
  }

  @override
  $CollectionMediaTableTable createAlias(String alias) {
    return $CollectionMediaTableTable(attachedDatabase, alias);
  }
}

class CollectionMediaTableData extends DataClass
    implements Insertable<CollectionMediaTableData> {
  final int id;
  final String? name;
  final String? caption;
  final Uint8List media;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const CollectionMediaTableData(
      {required this.id,
      this.name,
      this.caption,
      required this.media,
      required this.createdAt,
      required this.modifiedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || caption != null) {
      map['caption'] = Variable<String>(caption);
    }
    map['media'] = Variable<Uint8List>(media);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['modified_at'] = Variable<DateTime>(modifiedAt);
    return map;
  }

  CollectionMediaTableCompanion toCompanion(bool nullToAbsent) {
    return CollectionMediaTableCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      caption: caption == null && nullToAbsent
          ? const Value.absent()
          : Value(caption),
      media: Value(media),
      createdAt: Value(createdAt),
      modifiedAt: Value(modifiedAt),
    );
  }

  factory CollectionMediaTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionMediaTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      caption: serializer.fromJson<String?>(json['caption']),
      media: serializer.fromJson<Uint8List>(json['media']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      modifiedAt: serializer.fromJson<DateTime>(json['modifiedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'caption': serializer.toJson<String?>(caption),
      'media': serializer.toJson<Uint8List>(media),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'modifiedAt': serializer.toJson<DateTime>(modifiedAt),
    };
  }

  CollectionMediaTableData copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> caption = const Value.absent(),
          Uint8List? media,
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      CollectionMediaTableData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        caption: caption.present ? caption.value : this.caption,
        media: media ?? this.media,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
  CollectionMediaTableData copyWithCompanion(
      CollectionMediaTableCompanion data) {
    return CollectionMediaTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      caption: data.caption.present ? data.caption.value : this.caption,
      media: data.media.present ? data.media.value : this.media,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt:
          data.modifiedAt.present ? data.modifiedAt.value : this.modifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionMediaTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('caption: $caption, ')
          ..write('media: $media, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, caption, $driftBlobEquality.hash(media), createdAt, modifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionMediaTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.caption == this.caption &&
          $driftBlobEquality.equals(other.media, this.media) &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class CollectionMediaTableCompanion
    extends UpdateCompanion<CollectionMediaTableData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> caption;
  final Value<Uint8List> media;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const CollectionMediaTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.caption = const Value.absent(),
    this.media = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  CollectionMediaTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.caption = const Value.absent(),
    required Uint8List media,
    required DateTime createdAt,
    required DateTime modifiedAt,
  })  : media = Value(media),
        createdAt = Value(createdAt),
        modifiedAt = Value(modifiedAt);
  static Insertable<CollectionMediaTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? caption,
    Expression<Uint8List>? media,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (caption != null) 'caption': caption,
      if (media != null) 'media': media,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
    });
  }

  CollectionMediaTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? caption,
      Value<Uint8List>? media,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return CollectionMediaTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      caption: caption ?? this.caption,
      media: media ?? this.media,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
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
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    if (media.present) {
      map['media'] = Variable<Uint8List>(media.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (modifiedAt.present) {
      map['modified_at'] = Variable<DateTime>(modifiedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionMediaTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('caption: $caption, ')
          ..write('media: $media, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }
}

class $HistoryTableTable extends HistoryTable
    with TableInfo<$HistoryTableTable, HistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
      'note_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES note (id)'));
  static const VerificationMeta _collectionIdMeta =
      const VerificationMeta('collectionId');
  @override
  late final GeneratedColumn<int> collectionId = GeneratedColumn<int>(
      'collection_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES collection (id)'));
  static const VerificationMeta _historyTypeMeta =
      const VerificationMeta('historyType');
  @override
  late final GeneratedColumn<int> historyType = GeneratedColumn<int>(
      'history_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, noteId, collectionId, historyType, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'history';
  @override
  VerificationContext validateIntegrity(Insertable<HistoryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('note_id')) {
      context.handle(_noteIdMeta,
          noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta));
    }
    if (data.containsKey('collection_id')) {
      context.handle(
          _collectionIdMeta,
          collectionId.isAcceptableOrUnknown(
              data['collection_id']!, _collectionIdMeta));
    }
    if (data.containsKey('history_type')) {
      context.handle(
          _historyTypeMeta,
          historyType.isAcceptableOrUnknown(
              data['history_type']!, _historyTypeMeta));
    } else if (isInserting) {
      context.missing(_historyTypeMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      noteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}note_id']),
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}collection_id']),
      historyType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}history_type'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $HistoryTableTable createAlias(String alias) {
    return $HistoryTableTable(attachedDatabase, alias);
  }
}

class HistoryTableData extends DataClass
    implements Insertable<HistoryTableData> {
  final int id;
  final int? noteId;
  final int? collectionId;
  final int historyType;
  final String? content;
  final DateTime createdAt;
  const HistoryTableData(
      {required this.id,
      this.noteId,
      this.collectionId,
      required this.historyType,
      this.content,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || noteId != null) {
      map['note_id'] = Variable<int>(noteId);
    }
    if (!nullToAbsent || collectionId != null) {
      map['collection_id'] = Variable<int>(collectionId);
    }
    map['history_type'] = Variable<int>(historyType);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HistoryTableCompanion toCompanion(bool nullToAbsent) {
    return HistoryTableCompanion(
      id: Value(id),
      noteId:
          noteId == null && nullToAbsent ? const Value.absent() : Value(noteId),
      collectionId: collectionId == null && nullToAbsent
          ? const Value.absent()
          : Value(collectionId),
      historyType: Value(historyType),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory HistoryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryTableData(
      id: serializer.fromJson<int>(json['id']),
      noteId: serializer.fromJson<int?>(json['noteId']),
      collectionId: serializer.fromJson<int?>(json['collectionId']),
      historyType: serializer.fromJson<int>(json['historyType']),
      content: serializer.fromJson<String?>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'noteId': serializer.toJson<int?>(noteId),
      'collectionId': serializer.toJson<int?>(collectionId),
      'historyType': serializer.toJson<int>(historyType),
      'content': serializer.toJson<String?>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HistoryTableData copyWith(
          {int? id,
          Value<int?> noteId = const Value.absent(),
          Value<int?> collectionId = const Value.absent(),
          int? historyType,
          Value<String?> content = const Value.absent(),
          DateTime? createdAt}) =>
      HistoryTableData(
        id: id ?? this.id,
        noteId: noteId.present ? noteId.value : this.noteId,
        collectionId:
            collectionId.present ? collectionId.value : this.collectionId,
        historyType: historyType ?? this.historyType,
        content: content.present ? content.value : this.content,
        createdAt: createdAt ?? this.createdAt,
      );
  HistoryTableData copyWithCompanion(HistoryTableCompanion data) {
    return HistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
      historyType:
          data.historyType.present ? data.historyType.value : this.historyType,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableData(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId, ')
          ..write('historyType: $historyType, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, noteId, collectionId, historyType, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistoryTableData &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.collectionId == this.collectionId &&
          other.historyType == this.historyType &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class HistoryTableCompanion extends UpdateCompanion<HistoryTableData> {
  final Value<int> id;
  final Value<int?> noteId;
  final Value<int?> collectionId;
  final Value<int> historyType;
  final Value<String?> content;
  final Value<DateTime> createdAt;
  const HistoryTableCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.historyType = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HistoryTableCompanion.insert({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.collectionId = const Value.absent(),
    required int historyType,
    this.content = const Value.absent(),
    required DateTime createdAt,
  })  : historyType = Value(historyType),
        createdAt = Value(createdAt);
  static Insertable<HistoryTableData> custom({
    Expression<int>? id,
    Expression<int>? noteId,
    Expression<int>? collectionId,
    Expression<int>? historyType,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (collectionId != null) 'collection_id': collectionId,
      if (historyType != null) 'history_type': historyType,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HistoryTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? noteId,
      Value<int?>? collectionId,
      Value<int>? historyType,
      Value<String?>? content,
      Value<DateTime>? createdAt}) {
    return HistoryTableCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      collectionId: collectionId ?? this.collectionId,
      historyType: historyType ?? this.historyType,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (noteId.present) {
      map['note_id'] = Variable<int>(noteId.value);
    }
    if (collectionId.present) {
      map['collection_id'] = Variable<int>(collectionId.value);
    }
    if (historyType.present) {
      map['history_type'] = Variable<int>(historyType.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId, ')
          ..write('historyType: $historyType, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SyncEntityTableTable extends SyncEntityTable
    with TableInfo<$SyncEntityTableTable, SyncEntityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncEntityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localIdMeta =
      const VerificationMeta('localId');
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
      'local_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _originDeviceIdMeta =
      const VerificationMeta('originDeviceId');
  @override
  late final GeneratedColumn<String> originDeviceId = GeneratedColumn<String>(
      'origin_device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, entityType, uuid, localId, originDeviceId, updatedAt, isDeleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<SyncEntityTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('local_id')) {
      context.handle(_localIdMeta,
          localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta));
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('origin_device_id')) {
      context.handle(
          _originDeviceIdMeta,
          originDeviceId.isAcceptableOrUnknown(
              data['origin_device_id']!, _originDeviceIdMeta));
    } else if (isInserting) {
      context.missing(_originDeviceIdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {entityType, uuid},
        {entityType, localId},
      ];
  @override
  SyncEntityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncEntityTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      localId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}local_id'])!,
      originDeviceId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}origin_device_id'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $SyncEntityTableTable createAlias(String alias) {
    return $SyncEntityTableTable(attachedDatabase, alias);
  }
}

class SyncEntityTableData extends DataClass
    implements Insertable<SyncEntityTableData> {
  final int id;
  final String entityType;
  final String uuid;
  final int localId;
  final String originDeviceId;
  final DateTime updatedAt;
  final bool isDeleted;
  const SyncEntityTableData(
      {required this.id,
      required this.entityType,
      required this.uuid,
      required this.localId,
      required this.originDeviceId,
      required this.updatedAt,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['uuid'] = Variable<String>(uuid);
    map['local_id'] = Variable<int>(localId);
    map['origin_device_id'] = Variable<String>(originDeviceId);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  SyncEntityTableCompanion toCompanion(bool nullToAbsent) {
    return SyncEntityTableCompanion(
      id: Value(id),
      entityType: Value(entityType),
      uuid: Value(uuid),
      localId: Value(localId),
      originDeviceId: Value(originDeviceId),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
    );
  }

  factory SyncEntityTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncEntityTableData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      uuid: serializer.fromJson<String>(json['uuid']),
      localId: serializer.fromJson<int>(json['localId']),
      originDeviceId: serializer.fromJson<String>(json['originDeviceId']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'uuid': serializer.toJson<String>(uuid),
      'localId': serializer.toJson<int>(localId),
      'originDeviceId': serializer.toJson<String>(originDeviceId),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  SyncEntityTableData copyWith(
          {int? id,
          String? entityType,
          String? uuid,
          int? localId,
          String? originDeviceId,
          DateTime? updatedAt,
          bool? isDeleted}) =>
      SyncEntityTableData(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        uuid: uuid ?? this.uuid,
        localId: localId ?? this.localId,
        originDeviceId: originDeviceId ?? this.originDeviceId,
        updatedAt: updatedAt ?? this.updatedAt,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  SyncEntityTableData copyWithCompanion(SyncEntityTableCompanion data) {
    return SyncEntityTableData(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      localId: data.localId.present ? data.localId.value : this.localId,
      originDeviceId: data.originDeviceId.present
          ? data.originDeviceId.value
          : this.originDeviceId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncEntityTableData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('uuid: $uuid, ')
          ..write('localId: $localId, ')
          ..write('originDeviceId: $originDeviceId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, entityType, uuid, localId, originDeviceId, updatedAt, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncEntityTableData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.uuid == this.uuid &&
          other.localId == this.localId &&
          other.originDeviceId == this.originDeviceId &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted);
}

class SyncEntityTableCompanion extends UpdateCompanion<SyncEntityTableData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> uuid;
  final Value<int> localId;
  final Value<String> originDeviceId;
  final Value<DateTime> updatedAt;
  final Value<bool> isDeleted;
  const SyncEntityTableCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.uuid = const Value.absent(),
    this.localId = const Value.absent(),
    this.originDeviceId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
  });
  SyncEntityTableCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String uuid,
    required int localId,
    required String originDeviceId,
    required DateTime updatedAt,
    this.isDeleted = const Value.absent(),
  })  : entityType = Value(entityType),
        uuid = Value(uuid),
        localId = Value(localId),
        originDeviceId = Value(originDeviceId),
        updatedAt = Value(updatedAt);
  static Insertable<SyncEntityTableData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? uuid,
    Expression<int>? localId,
    Expression<String>? originDeviceId,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isDeleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (uuid != null) 'uuid': uuid,
      if (localId != null) 'local_id': localId,
      if (originDeviceId != null) 'origin_device_id': originDeviceId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
    });
  }

  SyncEntityTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? uuid,
      Value<int>? localId,
      Value<String>? originDeviceId,
      Value<DateTime>? updatedAt,
      Value<bool>? isDeleted}) {
    return SyncEntityTableCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      uuid: uuid ?? this.uuid,
      localId: localId ?? this.localId,
      originDeviceId: originDeviceId ?? this.originDeviceId,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (originDeviceId.present) {
      map['origin_device_id'] = Variable<String>(originDeviceId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncEntityTableCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('uuid: $uuid, ')
          ..write('localId: $localId, ')
          ..write('originDeviceId: $originDeviceId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }
}

class $SyncChangeLogTableTable extends SyncChangeLogTable
    with TableInfo<$SyncChangeLogTableTable, SyncChangeLogTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncChangeLogTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, entityType, uuid, operation, payload, updatedAt, deviceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_change_log';
  @override
  VerificationContext validateIntegrity(
      Insertable<SyncChangeLogTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncChangeLogTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncChangeLogTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
    );
  }

  @override
  $SyncChangeLogTableTable createAlias(String alias) {
    return $SyncChangeLogTableTable(attachedDatabase, alias);
  }
}

class SyncChangeLogTableData extends DataClass
    implements Insertable<SyncChangeLogTableData> {
  final int id;
  final String entityType;
  final String uuid;
  final String operation;
  final String? payload;
  final DateTime updatedAt;
  final String deviceId;
  const SyncChangeLogTableData(
      {required this.id,
      required this.entityType,
      required this.uuid,
      required this.operation,
      this.payload,
      required this.updatedAt,
      required this.deviceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['uuid'] = Variable<String>(uuid);
    map['operation'] = Variable<String>(operation);
    if (!nullToAbsent || payload != null) {
      map['payload'] = Variable<String>(payload);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['device_id'] = Variable<String>(deviceId);
    return map;
  }

  SyncChangeLogTableCompanion toCompanion(bool nullToAbsent) {
    return SyncChangeLogTableCompanion(
      id: Value(id),
      entityType: Value(entityType),
      uuid: Value(uuid),
      operation: Value(operation),
      payload: payload == null && nullToAbsent
          ? const Value.absent()
          : Value(payload),
      updatedAt: Value(updatedAt),
      deviceId: Value(deviceId),
    );
  }

  factory SyncChangeLogTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncChangeLogTableData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      uuid: serializer.fromJson<String>(json['uuid']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String?>(json['payload']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'uuid': serializer.toJson<String>(uuid),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String?>(payload),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deviceId': serializer.toJson<String>(deviceId),
    };
  }

  SyncChangeLogTableData copyWith(
          {int? id,
          String? entityType,
          String? uuid,
          String? operation,
          Value<String?> payload = const Value.absent(),
          DateTime? updatedAt,
          String? deviceId}) =>
      SyncChangeLogTableData(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        uuid: uuid ?? this.uuid,
        operation: operation ?? this.operation,
        payload: payload.present ? payload.value : this.payload,
        updatedAt: updatedAt ?? this.updatedAt,
        deviceId: deviceId ?? this.deviceId,
      );
  SyncChangeLogTableData copyWithCompanion(SyncChangeLogTableCompanion data) {
    return SyncChangeLogTableData(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncChangeLogTableData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('uuid: $uuid, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deviceId: $deviceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, entityType, uuid, operation, payload, updatedAt, deviceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncChangeLogTableData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.uuid == this.uuid &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.updatedAt == this.updatedAt &&
          other.deviceId == this.deviceId);
}

class SyncChangeLogTableCompanion
    extends UpdateCompanion<SyncChangeLogTableData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> uuid;
  final Value<String> operation;
  final Value<String?> payload;
  final Value<DateTime> updatedAt;
  final Value<String> deviceId;
  const SyncChangeLogTableCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.uuid = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deviceId = const Value.absent(),
  });
  SyncChangeLogTableCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String uuid,
    required String operation,
    this.payload = const Value.absent(),
    required DateTime updatedAt,
    required String deviceId,
  })  : entityType = Value(entityType),
        uuid = Value(uuid),
        operation = Value(operation),
        updatedAt = Value(updatedAt),
        deviceId = Value(deviceId);
  static Insertable<SyncChangeLogTableData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? uuid,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<DateTime>? updatedAt,
    Expression<String>? deviceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (uuid != null) 'uuid': uuid,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deviceId != null) 'device_id': deviceId,
    });
  }

  SyncChangeLogTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? uuid,
      Value<String>? operation,
      Value<String?>? payload,
      Value<DateTime>? updatedAt,
      Value<String>? deviceId}) {
    return SyncChangeLogTableCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      uuid: uuid ?? this.uuid,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      updatedAt: updatedAt ?? this.updatedAt,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncChangeLogTableCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('uuid: $uuid, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deviceId: $deviceId')
          ..write(')'))
        .toString();
  }
}

class $SyncPeerStateTableTable extends SyncPeerStateTable
    with TableInfo<$SyncPeerStateTableTable, SyncPeerStateTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncPeerStateTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _peerDeviceIdMeta =
      const VerificationMeta('peerDeviceId');
  @override
  late final GeneratedColumn<String> peerDeviceId = GeneratedColumn<String>(
      'peer_device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _peerNameMeta =
      const VerificationMeta('peerName');
  @override
  late final GeneratedColumn<String> peerName = GeneratedColumn<String>(
      'peer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastSentChangeIdMeta =
      const VerificationMeta('lastSentChangeId');
  @override
  late final GeneratedColumn<int> lastSentChangeId = GeneratedColumn<int>(
      'last_sent_change_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastReceivedChangeIdMeta =
      const VerificationMeta('lastReceivedChangeId');
  @override
  late final GeneratedColumn<int> lastReceivedChangeId = GeneratedColumn<int>(
      'last_received_change_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastSyncedAtMeta =
      const VerificationMeta('lastSyncedAt');
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
      'last_synced_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isTrustedMeta =
      const VerificationMeta('isTrusted');
  @override
  late final GeneratedColumn<bool> isTrusted = GeneratedColumn<bool>(
      'is_trusted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_trusted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        peerDeviceId,
        peerName,
        lastSentChangeId,
        lastReceivedChangeId,
        lastSyncedAt,
        isTrusted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_peer_state';
  @override
  VerificationContext validateIntegrity(
      Insertable<SyncPeerStateTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('peer_device_id')) {
      context.handle(
          _peerDeviceIdMeta,
          peerDeviceId.isAcceptableOrUnknown(
              data['peer_device_id']!, _peerDeviceIdMeta));
    } else if (isInserting) {
      context.missing(_peerDeviceIdMeta);
    }
    if (data.containsKey('peer_name')) {
      context.handle(_peerNameMeta,
          peerName.isAcceptableOrUnknown(data['peer_name']!, _peerNameMeta));
    } else if (isInserting) {
      context.missing(_peerNameMeta);
    }
    if (data.containsKey('last_sent_change_id')) {
      context.handle(
          _lastSentChangeIdMeta,
          lastSentChangeId.isAcceptableOrUnknown(
              data['last_sent_change_id']!, _lastSentChangeIdMeta));
    }
    if (data.containsKey('last_received_change_id')) {
      context.handle(
          _lastReceivedChangeIdMeta,
          lastReceivedChangeId.isAcceptableOrUnknown(
              data['last_received_change_id']!, _lastReceivedChangeIdMeta));
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
          _lastSyncedAtMeta,
          lastSyncedAt.isAcceptableOrUnknown(
              data['last_synced_at']!, _lastSyncedAtMeta));
    }
    if (data.containsKey('is_trusted')) {
      context.handle(_isTrustedMeta,
          isTrusted.isAcceptableOrUnknown(data['is_trusted']!, _isTrustedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {peerDeviceId};
  @override
  SyncPeerStateTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncPeerStateTableData(
      peerDeviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}peer_device_id'])!,
      peerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}peer_name'])!,
      lastSentChangeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}last_sent_change_id'])!,
      lastReceivedChangeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}last_received_change_id'])!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_synced_at']),
      isTrusted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_trusted'])!,
    );
  }

  @override
  $SyncPeerStateTableTable createAlias(String alias) {
    return $SyncPeerStateTableTable(attachedDatabase, alias);
  }
}

class SyncPeerStateTableData extends DataClass
    implements Insertable<SyncPeerStateTableData> {
  final String peerDeviceId;
  final String peerName;
  final int lastSentChangeId;
  final int lastReceivedChangeId;
  final DateTime? lastSyncedAt;
  final bool isTrusted;
  const SyncPeerStateTableData(
      {required this.peerDeviceId,
      required this.peerName,
      required this.lastSentChangeId,
      required this.lastReceivedChangeId,
      this.lastSyncedAt,
      required this.isTrusted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['peer_device_id'] = Variable<String>(peerDeviceId);
    map['peer_name'] = Variable<String>(peerName);
    map['last_sent_change_id'] = Variable<int>(lastSentChangeId);
    map['last_received_change_id'] = Variable<int>(lastReceivedChangeId);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    map['is_trusted'] = Variable<bool>(isTrusted);
    return map;
  }

  SyncPeerStateTableCompanion toCompanion(bool nullToAbsent) {
    return SyncPeerStateTableCompanion(
      peerDeviceId: Value(peerDeviceId),
      peerName: Value(peerName),
      lastSentChangeId: Value(lastSentChangeId),
      lastReceivedChangeId: Value(lastReceivedChangeId),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      isTrusted: Value(isTrusted),
    );
  }

  factory SyncPeerStateTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncPeerStateTableData(
      peerDeviceId: serializer.fromJson<String>(json['peerDeviceId']),
      peerName: serializer.fromJson<String>(json['peerName']),
      lastSentChangeId: serializer.fromJson<int>(json['lastSentChangeId']),
      lastReceivedChangeId:
          serializer.fromJson<int>(json['lastReceivedChangeId']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      isTrusted: serializer.fromJson<bool>(json['isTrusted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'peerDeviceId': serializer.toJson<String>(peerDeviceId),
      'peerName': serializer.toJson<String>(peerName),
      'lastSentChangeId': serializer.toJson<int>(lastSentChangeId),
      'lastReceivedChangeId': serializer.toJson<int>(lastReceivedChangeId),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'isTrusted': serializer.toJson<bool>(isTrusted),
    };
  }

  SyncPeerStateTableData copyWith(
          {String? peerDeviceId,
          String? peerName,
          int? lastSentChangeId,
          int? lastReceivedChangeId,
          Value<DateTime?> lastSyncedAt = const Value.absent(),
          bool? isTrusted}) =>
      SyncPeerStateTableData(
        peerDeviceId: peerDeviceId ?? this.peerDeviceId,
        peerName: peerName ?? this.peerName,
        lastSentChangeId: lastSentChangeId ?? this.lastSentChangeId,
        lastReceivedChangeId: lastReceivedChangeId ?? this.lastReceivedChangeId,
        lastSyncedAt:
            lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
        isTrusted: isTrusted ?? this.isTrusted,
      );
  SyncPeerStateTableData copyWithCompanion(SyncPeerStateTableCompanion data) {
    return SyncPeerStateTableData(
      peerDeviceId: data.peerDeviceId.present
          ? data.peerDeviceId.value
          : this.peerDeviceId,
      peerName: data.peerName.present ? data.peerName.value : this.peerName,
      lastSentChangeId: data.lastSentChangeId.present
          ? data.lastSentChangeId.value
          : this.lastSentChangeId,
      lastReceivedChangeId: data.lastReceivedChangeId.present
          ? data.lastReceivedChangeId.value
          : this.lastReceivedChangeId,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      isTrusted: data.isTrusted.present ? data.isTrusted.value : this.isTrusted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncPeerStateTableData(')
          ..write('peerDeviceId: $peerDeviceId, ')
          ..write('peerName: $peerName, ')
          ..write('lastSentChangeId: $lastSentChangeId, ')
          ..write('lastReceivedChangeId: $lastReceivedChangeId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isTrusted: $isTrusted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(peerDeviceId, peerName, lastSentChangeId,
      lastReceivedChangeId, lastSyncedAt, isTrusted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncPeerStateTableData &&
          other.peerDeviceId == this.peerDeviceId &&
          other.peerName == this.peerName &&
          other.lastSentChangeId == this.lastSentChangeId &&
          other.lastReceivedChangeId == this.lastReceivedChangeId &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.isTrusted == this.isTrusted);
}

class SyncPeerStateTableCompanion
    extends UpdateCompanion<SyncPeerStateTableData> {
  final Value<String> peerDeviceId;
  final Value<String> peerName;
  final Value<int> lastSentChangeId;
  final Value<int> lastReceivedChangeId;
  final Value<DateTime?> lastSyncedAt;
  final Value<bool> isTrusted;
  final Value<int> rowid;
  const SyncPeerStateTableCompanion({
    this.peerDeviceId = const Value.absent(),
    this.peerName = const Value.absent(),
    this.lastSentChangeId = const Value.absent(),
    this.lastReceivedChangeId = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.isTrusted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncPeerStateTableCompanion.insert({
    required String peerDeviceId,
    required String peerName,
    this.lastSentChangeId = const Value.absent(),
    this.lastReceivedChangeId = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.isTrusted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : peerDeviceId = Value(peerDeviceId),
        peerName = Value(peerName);
  static Insertable<SyncPeerStateTableData> custom({
    Expression<String>? peerDeviceId,
    Expression<String>? peerName,
    Expression<int>? lastSentChangeId,
    Expression<int>? lastReceivedChangeId,
    Expression<DateTime>? lastSyncedAt,
    Expression<bool>? isTrusted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (peerDeviceId != null) 'peer_device_id': peerDeviceId,
      if (peerName != null) 'peer_name': peerName,
      if (lastSentChangeId != null) 'last_sent_change_id': lastSentChangeId,
      if (lastReceivedChangeId != null)
        'last_received_change_id': lastReceivedChangeId,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (isTrusted != null) 'is_trusted': isTrusted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncPeerStateTableCompanion copyWith(
      {Value<String>? peerDeviceId,
      Value<String>? peerName,
      Value<int>? lastSentChangeId,
      Value<int>? lastReceivedChangeId,
      Value<DateTime?>? lastSyncedAt,
      Value<bool>? isTrusted,
      Value<int>? rowid}) {
    return SyncPeerStateTableCompanion(
      peerDeviceId: peerDeviceId ?? this.peerDeviceId,
      peerName: peerName ?? this.peerName,
      lastSentChangeId: lastSentChangeId ?? this.lastSentChangeId,
      lastReceivedChangeId: lastReceivedChangeId ?? this.lastReceivedChangeId,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      isTrusted: isTrusted ?? this.isTrusted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (peerDeviceId.present) {
      map['peer_device_id'] = Variable<String>(peerDeviceId.value);
    }
    if (peerName.present) {
      map['peer_name'] = Variable<String>(peerName.value);
    }
    if (lastSentChangeId.present) {
      map['last_sent_change_id'] = Variable<int>(lastSentChangeId.value);
    }
    if (lastReceivedChangeId.present) {
      map['last_received_change_id'] =
          Variable<int>(lastReceivedChangeId.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (isTrusted.present) {
      map['is_trusted'] = Variable<bool>(isTrusted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncPeerStateTableCompanion(')
          ..write('peerDeviceId: $peerDeviceId, ')
          ..write('peerName: $peerName, ')
          ..write('lastSentChangeId: $lastSentChangeId, ')
          ..write('lastReceivedChangeId: $lastReceivedChangeId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isTrusted: $isTrusted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DeviceIdentityTableTable extends DeviceIdentityTable
    with TableInfo<$DeviceIdentityTableTable, DeviceIdentityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeviceIdentityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceNameMeta =
      const VerificationMeta('deviceName');
  @override
  late final GeneratedColumn<String> deviceName = GeneratedColumn<String>(
      'device_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, deviceId, deviceName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'device_identity';
  @override
  VerificationContext validateIntegrity(
      Insertable<DeviceIdentityTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('device_name')) {
      context.handle(
          _deviceNameMeta,
          deviceName.isAcceptableOrUnknown(
              data['device_name']!, _deviceNameMeta));
    } else if (isInserting) {
      context.missing(_deviceNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeviceIdentityTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceIdentityTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      deviceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_name'])!,
    );
  }

  @override
  $DeviceIdentityTableTable createAlias(String alias) {
    return $DeviceIdentityTableTable(attachedDatabase, alias);
  }
}

class DeviceIdentityTableData extends DataClass
    implements Insertable<DeviceIdentityTableData> {
  final int id;
  final String deviceId;
  final String deviceName;
  const DeviceIdentityTableData(
      {required this.id, required this.deviceId, required this.deviceName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['device_id'] = Variable<String>(deviceId);
    map['device_name'] = Variable<String>(deviceName);
    return map;
  }

  DeviceIdentityTableCompanion toCompanion(bool nullToAbsent) {
    return DeviceIdentityTableCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      deviceName: Value(deviceName),
    );
  }

  factory DeviceIdentityTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceIdentityTableData(
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      deviceName: serializer.fromJson<String>(json['deviceName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'deviceName': serializer.toJson<String>(deviceName),
    };
  }

  DeviceIdentityTableData copyWith(
          {int? id, String? deviceId, String? deviceName}) =>
      DeviceIdentityTableData(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        deviceName: deviceName ?? this.deviceName,
      );
  DeviceIdentityTableData copyWithCompanion(DeviceIdentityTableCompanion data) {
    return DeviceIdentityTableData(
      id: data.id.present ? data.id.value : this.id,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      deviceName:
          data.deviceName.present ? data.deviceName.value : this.deviceName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceIdentityTableData(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceName: $deviceName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, deviceId, deviceName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceIdentityTableData &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.deviceName == this.deviceName);
}

class DeviceIdentityTableCompanion
    extends UpdateCompanion<DeviceIdentityTableData> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<String> deviceName;
  const DeviceIdentityTableCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.deviceName = const Value.absent(),
  });
  DeviceIdentityTableCompanion.insert({
    this.id = const Value.absent(),
    required String deviceId,
    required String deviceName,
  })  : deviceId = Value(deviceId),
        deviceName = Value(deviceName);
  static Insertable<DeviceIdentityTableData> custom({
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<String>? deviceName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (deviceName != null) 'device_name': deviceName,
    });
  }

  DeviceIdentityTableCompanion copyWith(
      {Value<int>? id, Value<String>? deviceId, Value<String>? deviceName}) {
    return DeviceIdentityTableCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      deviceName: deviceName ?? this.deviceName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (deviceName.present) {
      map['device_name'] = Variable<String>(deviceName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeviceIdentityTableCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceName: $deviceName')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CollectionTableTable collectionTable =
      $CollectionTableTable(this);
  late final $NoteCitationTableTable noteCitationTable =
      $NoteCitationTableTable(this);
  late final $NoteTableTable noteTable = $NoteTableTable(this);
  late final $CollectionNoteRefTableTable collectionNoteRefTable =
      $CollectionNoteRefTableTable(this);
  late final $CollectionMediaTableTable collectionMediaTable =
      $CollectionMediaTableTable(this);
  late final $HistoryTableTable historyTable = $HistoryTableTable(this);
  late final $SyncEntityTableTable syncEntityTable =
      $SyncEntityTableTable(this);
  late final $SyncChangeLogTableTable syncChangeLogTable =
      $SyncChangeLogTableTable(this);
  late final $SyncPeerStateTableTable syncPeerStateTable =
      $SyncPeerStateTableTable(this);
  late final $DeviceIdentityTableTable deviceIdentityTable =
      $DeviceIdentityTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        collectionTable,
        noteCitationTable,
        noteTable,
        collectionNoteRefTable,
        collectionMediaTable,
        historyTable,
        syncEntityTable,
        syncChangeLogTable,
        syncPeerStateTable,
        deviceIdentityTable
      ];
}

typedef $$CollectionTableTableCreateCompanionBuilder = CollectionTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<Uint8List?> media,
  required DateTime createdAt,
  required DateTime modifiedAt,
});
typedef $$CollectionTableTableUpdateCompanionBuilder = CollectionTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<Uint8List?> media,
  Value<DateTime> createdAt,
  Value<DateTime> modifiedAt,
});

final class $$CollectionTableTableReferences extends BaseReferences<
    _$AppDatabase, $CollectionTableTable, CollectionTableData> {
  $$CollectionTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionNoteRefTableTable,
      List<CollectionNoteRefTableData>> _collectionNoteRefTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.collectionNoteRefTable,
          aliasName: $_aliasNameGenerator(
              db.collectionTable.id, db.collectionNoteRefTable.collectionId));

  $$CollectionNoteRefTableTableProcessedTableManager
      get collectionNoteRefTableRefs {
    final manager = $$CollectionNoteRefTableTableTableManager(
            $_db, $_db.collectionNoteRefTable)
        .filter((f) => f.collectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionNoteRefTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$HistoryTableTable, List<HistoryTableData>>
      _historyTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.historyTable,
              aliasName: $_aliasNameGenerator(
                  db.collectionTable.id, db.historyTable.collectionId));

  $$HistoryTableTableProcessedTableManager get historyTableRefs {
    final manager = $$HistoryTableTableTableManager($_db, $_db.historyTable)
        .filter((f) => f.collectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_historyTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CollectionTableTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionTableTable> {
  $$CollectionTableTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> collectionNoteRefTableRefs(
      Expression<bool> Function($$CollectionNoteRefTableTableFilterComposer f)
          f) {
    final $$CollectionNoteRefTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.collectionNoteRefTable,
            getReferencedColumn: (t) => t.collectionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionNoteRefTableTableFilterComposer(
                  $db: $db,
                  $table: $db.collectionNoteRefTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> historyTableRefs(
      Expression<bool> Function($$HistoryTableTableFilterComposer f) f) {
    final $$HistoryTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.historyTable,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HistoryTableTableFilterComposer(
              $db: $db,
              $table: $db.historyTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CollectionTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionTableTable> {
  $$CollectionTableTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => ColumnOrderings(column));
}

class $$CollectionTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionTableTable> {
  $$CollectionTableTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<Uint8List> get media =>
      $composableBuilder(column: $table.media, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => column);

  Expression<T> collectionNoteRefTableRefs<T extends Object>(
      Expression<T> Function($$CollectionNoteRefTableTableAnnotationComposer a)
          f) {
    final $$CollectionNoteRefTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.collectionNoteRefTable,
            getReferencedColumn: (t) => t.collectionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionNoteRefTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.collectionNoteRefTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> historyTableRefs<T extends Object>(
      Expression<T> Function($$HistoryTableTableAnnotationComposer a) f) {
    final $$HistoryTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.historyTable,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HistoryTableTableAnnotationComposer(
              $db: $db,
              $table: $db.historyTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CollectionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CollectionTableTable,
    CollectionTableData,
    $$CollectionTableTableFilterComposer,
    $$CollectionTableTableOrderingComposer,
    $$CollectionTableTableAnnotationComposer,
    $$CollectionTableTableCreateCompanionBuilder,
    $$CollectionTableTableUpdateCompanionBuilder,
    (CollectionTableData, $$CollectionTableTableReferences),
    CollectionTableData,
    PrefetchHooks Function(
        {bool collectionNoteRefTableRefs, bool historyTableRefs})> {
  $$CollectionTableTableTableManager(
      _$AppDatabase db, $CollectionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<Uint8List?> media = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> modifiedAt = const Value.absent(),
          }) =>
              CollectionTableCompanion(
            id: id,
            name: name,
            description: description,
            media: media,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<Uint8List?> media = const Value.absent(),
            required DateTime createdAt,
            required DateTime modifiedAt,
          }) =>
              CollectionTableCompanion.insert(
            id: id,
            name: name,
            description: description,
            media: media,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {collectionNoteRefTableRefs = false, historyTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionNoteRefTableRefs) db.collectionNoteRefTable,
                if (historyTableRefs) db.historyTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionNoteRefTableRefs)
                    await $_getPrefetchedData<CollectionTableData,
                            $CollectionTableTable, CollectionNoteRefTableData>(
                        currentTable: table,
                        referencedTable: $$CollectionTableTableReferences
                            ._collectionNoteRefTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionTableTableReferences(db, table, p0)
                                .collectionNoteRefTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.collectionId == item.id),
                        typedResults: items),
                  if (historyTableRefs)
                    await $_getPrefetchedData<CollectionTableData,
                            $CollectionTableTable, HistoryTableData>(
                        currentTable: table,
                        referencedTable: $$CollectionTableTableReferences
                            ._historyTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionTableTableReferences(db, table, p0)
                                .historyTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.collectionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CollectionTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CollectionTableTable,
    CollectionTableData,
    $$CollectionTableTableFilterComposer,
    $$CollectionTableTableOrderingComposer,
    $$CollectionTableTableAnnotationComposer,
    $$CollectionTableTableCreateCompanionBuilder,
    $$CollectionTableTableUpdateCompanionBuilder,
    (CollectionTableData, $$CollectionTableTableReferences),
    CollectionTableData,
    PrefetchHooks Function(
        {bool collectionNoteRefTableRefs, bool historyTableRefs})>;
typedef $$NoteCitationTableTableCreateCompanionBuilder
    = NoteCitationTableCompanion Function({
  Value<int> id,
  required String title,
  required DateTime createdAt,
  required DateTime modifiedAt,
});
typedef $$NoteCitationTableTableUpdateCompanionBuilder
    = NoteCitationTableCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<DateTime> createdAt,
  Value<DateTime> modifiedAt,
});

final class $$NoteCitationTableTableReferences extends BaseReferences<
    _$AppDatabase, $NoteCitationTableTable, NoteCitationTableData> {
  $$NoteCitationTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NoteTableTable, List<NoteTableData>>
      _noteTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.noteTable,
              aliasName: $_aliasNameGenerator(
                  db.noteCitationTable.id, db.noteTable.citationId));

  $$NoteTableTableProcessedTableManager get noteTableRefs {
    final manager = $$NoteTableTableTableManager($_db, $_db.noteTable)
        .filter((f) => f.citationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_noteTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$NoteCitationTableTableFilterComposer
    extends Composer<_$AppDatabase, $NoteCitationTableTable> {
  $$NoteCitationTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> noteTableRefs(
      Expression<bool> Function($$NoteTableTableFilterComposer f) f) {
    final $$NoteTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.noteTable,
        getReferencedColumn: (t) => t.citationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteTableTableFilterComposer(
              $db: $db,
              $table: $db.noteTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NoteCitationTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteCitationTableTable> {
  $$NoteCitationTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => ColumnOrderings(column));
}

class $$NoteCitationTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteCitationTableTable> {
  $$NoteCitationTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => column);

  Expression<T> noteTableRefs<T extends Object>(
      Expression<T> Function($$NoteTableTableAnnotationComposer a) f) {
    final $$NoteTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.noteTable,
        getReferencedColumn: (t) => t.citationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteTableTableAnnotationComposer(
              $db: $db,
              $table: $db.noteTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NoteCitationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoteCitationTableTable,
    NoteCitationTableData,
    $$NoteCitationTableTableFilterComposer,
    $$NoteCitationTableTableOrderingComposer,
    $$NoteCitationTableTableAnnotationComposer,
    $$NoteCitationTableTableCreateCompanionBuilder,
    $$NoteCitationTableTableUpdateCompanionBuilder,
    (NoteCitationTableData, $$NoteCitationTableTableReferences),
    NoteCitationTableData,
    PrefetchHooks Function({bool noteTableRefs})> {
  $$NoteCitationTableTableTableManager(
      _$AppDatabase db, $NoteCitationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteCitationTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteCitationTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteCitationTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> modifiedAt = const Value.absent(),
          }) =>
              NoteCitationTableCompanion(
            id: id,
            title: title,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required DateTime createdAt,
            required DateTime modifiedAt,
          }) =>
              NoteCitationTableCompanion.insert(
            id: id,
            title: title,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$NoteCitationTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({noteTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (noteTableRefs) db.noteTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (noteTableRefs)
                    await $_getPrefetchedData<NoteCitationTableData,
                            $NoteCitationTableTable, NoteTableData>(
                        currentTable: table,
                        referencedTable: $$NoteCitationTableTableReferences
                            ._noteTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NoteCitationTableTableReferences(db, table, p0)
                                .noteTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.citationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$NoteCitationTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NoteCitationTableTable,
    NoteCitationTableData,
    $$NoteCitationTableTableFilterComposer,
    $$NoteCitationTableTableOrderingComposer,
    $$NoteCitationTableTableAnnotationComposer,
    $$NoteCitationTableTableCreateCompanionBuilder,
    $$NoteCitationTableTableUpdateCompanionBuilder,
    (NoteCitationTableData, $$NoteCitationTableTableReferences),
    NoteCitationTableData,
    PrefetchHooks Function({bool noteTableRefs})>;
typedef $$NoteTableTableCreateCompanionBuilder = NoteTableCompanion Function({
  Value<int> id,
  Value<String?> content,
  Value<Uint8List?> media,
  Value<int?> citationId,
  required DateTime createdAt,
  required DateTime modifiedAt,
});
typedef $$NoteTableTableUpdateCompanionBuilder = NoteTableCompanion Function({
  Value<int> id,
  Value<String?> content,
  Value<Uint8List?> media,
  Value<int?> citationId,
  Value<DateTime> createdAt,
  Value<DateTime> modifiedAt,
});

final class $$NoteTableTableReferences
    extends BaseReferences<_$AppDatabase, $NoteTableTable, NoteTableData> {
  $$NoteTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NoteCitationTableTable _citationIdTable(_$AppDatabase db) =>
      db.noteCitationTable.createAlias($_aliasNameGenerator(
          db.noteTable.citationId, db.noteCitationTable.id));

  $$NoteCitationTableTableProcessedTableManager? get citationId {
    final $_column = $_itemColumn<int>('citation_id');
    if ($_column == null) return null;
    final manager =
        $$NoteCitationTableTableTableManager($_db, $_db.noteCitationTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_citationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CollectionNoteRefTableTable,
      List<CollectionNoteRefTableData>> _collectionNoteRefTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.collectionNoteRefTable,
          aliasName: $_aliasNameGenerator(
              db.noteTable.id, db.collectionNoteRefTable.noteId));

  $$CollectionNoteRefTableTableProcessedTableManager
      get collectionNoteRefTableRefs {
    final manager = $$CollectionNoteRefTableTableTableManager(
            $_db, $_db.collectionNoteRefTable)
        .filter((f) => f.noteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionNoteRefTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$HistoryTableTable, List<HistoryTableData>>
      _historyTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.historyTable,
          aliasName:
              $_aliasNameGenerator(db.noteTable.id, db.historyTable.noteId));

  $$HistoryTableTableProcessedTableManager get historyTableRefs {
    final manager = $$HistoryTableTableTableManager($_db, $_db.historyTable)
        .filter((f) => f.noteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_historyTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$NoteTableTableFilterComposer
    extends Composer<_$AppDatabase, $NoteTableTable> {
  $$NoteTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => ColumnFilters(column));

  $$NoteCitationTableTableFilterComposer get citationId {
    final $$NoteCitationTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.citationId,
        referencedTable: $db.noteCitationTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteCitationTableTableFilterComposer(
              $db: $db,
              $table: $db.noteCitationTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> collectionNoteRefTableRefs(
      Expression<bool> Function($$CollectionNoteRefTableTableFilterComposer f)
          f) {
    final $$CollectionNoteRefTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.collectionNoteRefTable,
            getReferencedColumn: (t) => t.noteId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionNoteRefTableTableFilterComposer(
                  $db: $db,
                  $table: $db.collectionNoteRefTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> historyTableRefs(
      Expression<bool> Function($$HistoryTableTableFilterComposer f) f) {
    final $$HistoryTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.historyTable,
        getReferencedColumn: (t) => t.noteId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HistoryTableTableFilterComposer(
              $db: $db,
              $table: $db.historyTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NoteTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteTableTable> {
  $$NoteTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => ColumnOrderings(column));

  $$NoteCitationTableTableOrderingComposer get citationId {
    final $$NoteCitationTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.citationId,
        referencedTable: $db.noteCitationTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteCitationTableTableOrderingComposer(
              $db: $db,
              $table: $db.noteCitationTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NoteTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteTableTable> {
  $$NoteTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<Uint8List> get media =>
      $composableBuilder(column: $table.media, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => column);

  $$NoteCitationTableTableAnnotationComposer get citationId {
    final $$NoteCitationTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.citationId,
            referencedTable: $db.noteCitationTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$NoteCitationTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.noteCitationTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> collectionNoteRefTableRefs<T extends Object>(
      Expression<T> Function($$CollectionNoteRefTableTableAnnotationComposer a)
          f) {
    final $$CollectionNoteRefTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.collectionNoteRefTable,
            getReferencedColumn: (t) => t.noteId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionNoteRefTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.collectionNoteRefTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> historyTableRefs<T extends Object>(
      Expression<T> Function($$HistoryTableTableAnnotationComposer a) f) {
    final $$HistoryTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.historyTable,
        getReferencedColumn: (t) => t.noteId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HistoryTableTableAnnotationComposer(
              $db: $db,
              $table: $db.historyTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NoteTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoteTableTable,
    NoteTableData,
    $$NoteTableTableFilterComposer,
    $$NoteTableTableOrderingComposer,
    $$NoteTableTableAnnotationComposer,
    $$NoteTableTableCreateCompanionBuilder,
    $$NoteTableTableUpdateCompanionBuilder,
    (NoteTableData, $$NoteTableTableReferences),
    NoteTableData,
    PrefetchHooks Function(
        {bool citationId,
        bool collectionNoteRefTableRefs,
        bool historyTableRefs})> {
  $$NoteTableTableTableManager(_$AppDatabase db, $NoteTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<Uint8List?> media = const Value.absent(),
            Value<int?> citationId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> modifiedAt = const Value.absent(),
          }) =>
              NoteTableCompanion(
            id: id,
            content: content,
            media: media,
            citationId: citationId,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<Uint8List?> media = const Value.absent(),
            Value<int?> citationId = const Value.absent(),
            required DateTime createdAt,
            required DateTime modifiedAt,
          }) =>
              NoteTableCompanion.insert(
            id: id,
            content: content,
            media: media,
            citationId: citationId,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$NoteTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {citationId = false,
              collectionNoteRefTableRefs = false,
              historyTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionNoteRefTableRefs) db.collectionNoteRefTable,
                if (historyTableRefs) db.historyTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (citationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.citationId,
                    referencedTable:
                        $$NoteTableTableReferences._citationIdTable(db),
                    referencedColumn:
                        $$NoteTableTableReferences._citationIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionNoteRefTableRefs)
                    await $_getPrefetchedData<NoteTableData, $NoteTableTable,
                            CollectionNoteRefTableData>(
                        currentTable: table,
                        referencedTable: $$NoteTableTableReferences
                            ._collectionNoteRefTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NoteTableTableReferences(db, table, p0)
                                .collectionNoteRefTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.noteId == item.id),
                        typedResults: items),
                  if (historyTableRefs)
                    await $_getPrefetchedData<NoteTableData, $NoteTableTable,
                            HistoryTableData>(
                        currentTable: table,
                        referencedTable: $$NoteTableTableReferences
                            ._historyTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NoteTableTableReferences(db, table, p0)
                                .historyTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.noteId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$NoteTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NoteTableTable,
    NoteTableData,
    $$NoteTableTableFilterComposer,
    $$NoteTableTableOrderingComposer,
    $$NoteTableTableAnnotationComposer,
    $$NoteTableTableCreateCompanionBuilder,
    $$NoteTableTableUpdateCompanionBuilder,
    (NoteTableData, $$NoteTableTableReferences),
    NoteTableData,
    PrefetchHooks Function(
        {bool citationId,
        bool collectionNoteRefTableRefs,
        bool historyTableRefs})>;
typedef $$CollectionNoteRefTableTableCreateCompanionBuilder
    = CollectionNoteRefTableCompanion Function({
  Value<int> id,
  required int noteId,
  required int collectionId,
  required DateTime createdAt,
});
typedef $$CollectionNoteRefTableTableUpdateCompanionBuilder
    = CollectionNoteRefTableCompanion Function({
  Value<int> id,
  Value<int> noteId,
  Value<int> collectionId,
  Value<DateTime> createdAt,
});

final class $$CollectionNoteRefTableTableReferences extends BaseReferences<
    _$AppDatabase, $CollectionNoteRefTableTable, CollectionNoteRefTableData> {
  $$CollectionNoteRefTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $NoteTableTable _noteIdTable(_$AppDatabase db) =>
      db.noteTable.createAlias($_aliasNameGenerator(
          db.collectionNoteRefTable.noteId, db.noteTable.id));

  $$NoteTableTableProcessedTableManager get noteId {
    final $_column = $_itemColumn<int>('note_id')!;

    final manager = $$NoteTableTableTableManager($_db, $_db.noteTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CollectionTableTable _collectionIdTable(_$AppDatabase db) =>
      db.collectionTable.createAlias($_aliasNameGenerator(
          db.collectionNoteRefTable.collectionId, db.collectionTable.id));

  $$CollectionTableTableProcessedTableManager get collectionId {
    final $_column = $_itemColumn<int>('collection_id')!;

    final manager =
        $$CollectionTableTableTableManager($_db, $_db.collectionTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CollectionNoteRefTableTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionNoteRefTableTable> {
  $$CollectionNoteRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$NoteTableTableFilterComposer get noteId {
    final $$NoteTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.noteId,
        referencedTable: $db.noteTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteTableTableFilterComposer(
              $db: $db,
              $table: $db.noteTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CollectionTableTableFilterComposer get collectionId {
    final $$CollectionTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableFilterComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionNoteRefTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionNoteRefTableTable> {
  $$CollectionNoteRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$NoteTableTableOrderingComposer get noteId {
    final $$NoteTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.noteId,
        referencedTable: $db.noteTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteTableTableOrderingComposer(
              $db: $db,
              $table: $db.noteTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CollectionTableTableOrderingComposer get collectionId {
    final $$CollectionTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableOrderingComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionNoteRefTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionNoteRefTableTable> {
  $$CollectionNoteRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$NoteTableTableAnnotationComposer get noteId {
    final $$NoteTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.noteId,
        referencedTable: $db.noteTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteTableTableAnnotationComposer(
              $db: $db,
              $table: $db.noteTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CollectionTableTableAnnotationComposer get collectionId {
    final $$CollectionTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableAnnotationComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionNoteRefTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CollectionNoteRefTableTable,
    CollectionNoteRefTableData,
    $$CollectionNoteRefTableTableFilterComposer,
    $$CollectionNoteRefTableTableOrderingComposer,
    $$CollectionNoteRefTableTableAnnotationComposer,
    $$CollectionNoteRefTableTableCreateCompanionBuilder,
    $$CollectionNoteRefTableTableUpdateCompanionBuilder,
    (CollectionNoteRefTableData, $$CollectionNoteRefTableTableReferences),
    CollectionNoteRefTableData,
    PrefetchHooks Function({bool noteId, bool collectionId})> {
  $$CollectionNoteRefTableTableTableManager(
      _$AppDatabase db, $CollectionNoteRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionNoteRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionNoteRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionNoteRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> noteId = const Value.absent(),
            Value<int> collectionId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              CollectionNoteRefTableCompanion(
            id: id,
            noteId: noteId,
            collectionId: collectionId,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int noteId,
            required int collectionId,
            required DateTime createdAt,
          }) =>
              CollectionNoteRefTableCompanion.insert(
            id: id,
            noteId: noteId,
            collectionId: collectionId,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionNoteRefTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({noteId = false, collectionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (noteId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.noteId,
                    referencedTable: $$CollectionNoteRefTableTableReferences
                        ._noteIdTable(db),
                    referencedColumn: $$CollectionNoteRefTableTableReferences
                        ._noteIdTable(db)
                        .id,
                  ) as T;
                }
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable: $$CollectionNoteRefTableTableReferences
                        ._collectionIdTable(db),
                    referencedColumn: $$CollectionNoteRefTableTableReferences
                        ._collectionIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CollectionNoteRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CollectionNoteRefTableTable,
        CollectionNoteRefTableData,
        $$CollectionNoteRefTableTableFilterComposer,
        $$CollectionNoteRefTableTableOrderingComposer,
        $$CollectionNoteRefTableTableAnnotationComposer,
        $$CollectionNoteRefTableTableCreateCompanionBuilder,
        $$CollectionNoteRefTableTableUpdateCompanionBuilder,
        (CollectionNoteRefTableData, $$CollectionNoteRefTableTableReferences),
        CollectionNoteRefTableData,
        PrefetchHooks Function({bool noteId, bool collectionId})>;
typedef $$CollectionMediaTableTableCreateCompanionBuilder
    = CollectionMediaTableCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> caption,
  required Uint8List media,
  required DateTime createdAt,
  required DateTime modifiedAt,
});
typedef $$CollectionMediaTableTableUpdateCompanionBuilder
    = CollectionMediaTableCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> caption,
  Value<Uint8List> media,
  Value<DateTime> createdAt,
  Value<DateTime> modifiedAt,
});

class $$CollectionMediaTableTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionMediaTableTable> {
  $$CollectionMediaTableTableFilterComposer({
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

  ColumnFilters<String> get caption => $composableBuilder(
      column: $table.caption, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => ColumnFilters(column));
}

class $$CollectionMediaTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionMediaTableTable> {
  $$CollectionMediaTableTableOrderingComposer({
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

  ColumnOrderings<String> get caption => $composableBuilder(
      column: $table.caption, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get media => $composableBuilder(
      column: $table.media, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => ColumnOrderings(column));
}

class $$CollectionMediaTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionMediaTableTable> {
  $$CollectionMediaTableTableAnnotationComposer({
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

  GeneratedColumn<String> get caption =>
      $composableBuilder(column: $table.caption, builder: (column) => column);

  GeneratedColumn<Uint8List> get media =>
      $composableBuilder(column: $table.media, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get modifiedAt => $composableBuilder(
      column: $table.modifiedAt, builder: (column) => column);
}

class $$CollectionMediaTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CollectionMediaTableTable,
    CollectionMediaTableData,
    $$CollectionMediaTableTableFilterComposer,
    $$CollectionMediaTableTableOrderingComposer,
    $$CollectionMediaTableTableAnnotationComposer,
    $$CollectionMediaTableTableCreateCompanionBuilder,
    $$CollectionMediaTableTableUpdateCompanionBuilder,
    (
      CollectionMediaTableData,
      BaseReferences<_$AppDatabase, $CollectionMediaTableTable,
          CollectionMediaTableData>
    ),
    CollectionMediaTableData,
    PrefetchHooks Function()> {
  $$CollectionMediaTableTableTableManager(
      _$AppDatabase db, $CollectionMediaTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionMediaTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionMediaTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionMediaTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> caption = const Value.absent(),
            Value<Uint8List> media = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> modifiedAt = const Value.absent(),
          }) =>
              CollectionMediaTableCompanion(
            id: id,
            name: name,
            caption: caption,
            media: media,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> caption = const Value.absent(),
            required Uint8List media,
            required DateTime createdAt,
            required DateTime modifiedAt,
          }) =>
              CollectionMediaTableCompanion.insert(
            id: id,
            name: name,
            caption: caption,
            media: media,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CollectionMediaTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CollectionMediaTableTable,
        CollectionMediaTableData,
        $$CollectionMediaTableTableFilterComposer,
        $$CollectionMediaTableTableOrderingComposer,
        $$CollectionMediaTableTableAnnotationComposer,
        $$CollectionMediaTableTableCreateCompanionBuilder,
        $$CollectionMediaTableTableUpdateCompanionBuilder,
        (
          CollectionMediaTableData,
          BaseReferences<_$AppDatabase, $CollectionMediaTableTable,
              CollectionMediaTableData>
        ),
        CollectionMediaTableData,
        PrefetchHooks Function()>;
typedef $$HistoryTableTableCreateCompanionBuilder = HistoryTableCompanion
    Function({
  Value<int> id,
  Value<int?> noteId,
  Value<int?> collectionId,
  required int historyType,
  Value<String?> content,
  required DateTime createdAt,
});
typedef $$HistoryTableTableUpdateCompanionBuilder = HistoryTableCompanion
    Function({
  Value<int> id,
  Value<int?> noteId,
  Value<int?> collectionId,
  Value<int> historyType,
  Value<String?> content,
  Value<DateTime> createdAt,
});

final class $$HistoryTableTableReferences extends BaseReferences<_$AppDatabase,
    $HistoryTableTable, HistoryTableData> {
  $$HistoryTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NoteTableTable _noteIdTable(_$AppDatabase db) =>
      db.noteTable.createAlias(
          $_aliasNameGenerator(db.historyTable.noteId, db.noteTable.id));

  $$NoteTableTableProcessedTableManager? get noteId {
    final $_column = $_itemColumn<int>('note_id');
    if ($_column == null) return null;
    final manager = $$NoteTableTableTableManager($_db, $_db.noteTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_noteIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CollectionTableTable _collectionIdTable(_$AppDatabase db) =>
      db.collectionTable.createAlias($_aliasNameGenerator(
          db.historyTable.collectionId, db.collectionTable.id));

  $$CollectionTableTableProcessedTableManager? get collectionId {
    final $_column = $_itemColumn<int>('collection_id');
    if ($_column == null) return null;
    final manager =
        $$CollectionTableTableTableManager($_db, $_db.collectionTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_collectionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get historyType => $composableBuilder(
      column: $table.historyType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$NoteTableTableFilterComposer get noteId {
    final $$NoteTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.noteId,
        referencedTable: $db.noteTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteTableTableFilterComposer(
              $db: $db,
              $table: $db.noteTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CollectionTableTableFilterComposer get collectionId {
    final $$CollectionTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableFilterComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get historyType => $composableBuilder(
      column: $table.historyType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$NoteTableTableOrderingComposer get noteId {
    final $$NoteTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.noteId,
        referencedTable: $db.noteTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteTableTableOrderingComposer(
              $db: $db,
              $table: $db.noteTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CollectionTableTableOrderingComposer get collectionId {
    final $$CollectionTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableOrderingComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistoryTableTable> {
  $$HistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get historyType => $composableBuilder(
      column: $table.historyType, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$NoteTableTableAnnotationComposer get noteId {
    final $$NoteTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.noteId,
        referencedTable: $db.noteTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NoteTableTableAnnotationComposer(
              $db: $db,
              $table: $db.noteTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CollectionTableTableAnnotationComposer get collectionId {
    final $$CollectionTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.collectionId,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionTableTableAnnotationComposer(
              $db: $db,
              $table: $db.collectionTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HistoryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HistoryTableTable,
    HistoryTableData,
    $$HistoryTableTableFilterComposer,
    $$HistoryTableTableOrderingComposer,
    $$HistoryTableTableAnnotationComposer,
    $$HistoryTableTableCreateCompanionBuilder,
    $$HistoryTableTableUpdateCompanionBuilder,
    (HistoryTableData, $$HistoryTableTableReferences),
    HistoryTableData,
    PrefetchHooks Function({bool noteId, bool collectionId})> {
  $$HistoryTableTableTableManager(_$AppDatabase db, $HistoryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistoryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistoryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistoryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> noteId = const Value.absent(),
            Value<int?> collectionId = const Value.absent(),
            Value<int> historyType = const Value.absent(),
            Value<String?> content = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              HistoryTableCompanion(
            id: id,
            noteId: noteId,
            collectionId: collectionId,
            historyType: historyType,
            content: content,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> noteId = const Value.absent(),
            Value<int?> collectionId = const Value.absent(),
            required int historyType,
            Value<String?> content = const Value.absent(),
            required DateTime createdAt,
          }) =>
              HistoryTableCompanion.insert(
            id: id,
            noteId: noteId,
            collectionId: collectionId,
            historyType: historyType,
            content: content,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$HistoryTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({noteId = false, collectionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (noteId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.noteId,
                    referencedTable:
                        $$HistoryTableTableReferences._noteIdTable(db),
                    referencedColumn:
                        $$HistoryTableTableReferences._noteIdTable(db).id,
                  ) as T;
                }
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable:
                        $$HistoryTableTableReferences._collectionIdTable(db),
                    referencedColumn:
                        $$HistoryTableTableReferences._collectionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HistoryTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HistoryTableTable,
    HistoryTableData,
    $$HistoryTableTableFilterComposer,
    $$HistoryTableTableOrderingComposer,
    $$HistoryTableTableAnnotationComposer,
    $$HistoryTableTableCreateCompanionBuilder,
    $$HistoryTableTableUpdateCompanionBuilder,
    (HistoryTableData, $$HistoryTableTableReferences),
    HistoryTableData,
    PrefetchHooks Function({bool noteId, bool collectionId})>;
typedef $$SyncEntityTableTableCreateCompanionBuilder = SyncEntityTableCompanion
    Function({
  Value<int> id,
  required String entityType,
  required String uuid,
  required int localId,
  required String originDeviceId,
  required DateTime updatedAt,
  Value<bool> isDeleted,
});
typedef $$SyncEntityTableTableUpdateCompanionBuilder = SyncEntityTableCompanion
    Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> uuid,
  Value<int> localId,
  Value<String> originDeviceId,
  Value<DateTime> updatedAt,
  Value<bool> isDeleted,
});

class $$SyncEntityTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncEntityTableTable> {
  $$SyncEntityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get originDeviceId => $composableBuilder(
      column: $table.originDeviceId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$SyncEntityTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncEntityTableTable> {
  $$SyncEntityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get localId => $composableBuilder(
      column: $table.localId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get originDeviceId => $composableBuilder(
      column: $table.originDeviceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$SyncEntityTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncEntityTableTable> {
  $$SyncEntityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<String> get originDeviceId => $composableBuilder(
      column: $table.originDeviceId, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$SyncEntityTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncEntityTableTable,
    SyncEntityTableData,
    $$SyncEntityTableTableFilterComposer,
    $$SyncEntityTableTableOrderingComposer,
    $$SyncEntityTableTableAnnotationComposer,
    $$SyncEntityTableTableCreateCompanionBuilder,
    $$SyncEntityTableTableUpdateCompanionBuilder,
    (
      SyncEntityTableData,
      BaseReferences<_$AppDatabase, $SyncEntityTableTable, SyncEntityTableData>
    ),
    SyncEntityTableData,
    PrefetchHooks Function()> {
  $$SyncEntityTableTableTableManager(
      _$AppDatabase db, $SyncEntityTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncEntityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncEntityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncEntityTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<int> localId = const Value.absent(),
            Value<String> originDeviceId = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              SyncEntityTableCompanion(
            id: id,
            entityType: entityType,
            uuid: uuid,
            localId: localId,
            originDeviceId: originDeviceId,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String uuid,
            required int localId,
            required String originDeviceId,
            required DateTime updatedAt,
            Value<bool> isDeleted = const Value.absent(),
          }) =>
              SyncEntityTableCompanion.insert(
            id: id,
            entityType: entityType,
            uuid: uuid,
            localId: localId,
            originDeviceId: originDeviceId,
            updatedAt: updatedAt,
            isDeleted: isDeleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncEntityTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncEntityTableTable,
    SyncEntityTableData,
    $$SyncEntityTableTableFilterComposer,
    $$SyncEntityTableTableOrderingComposer,
    $$SyncEntityTableTableAnnotationComposer,
    $$SyncEntityTableTableCreateCompanionBuilder,
    $$SyncEntityTableTableUpdateCompanionBuilder,
    (
      SyncEntityTableData,
      BaseReferences<_$AppDatabase, $SyncEntityTableTable, SyncEntityTableData>
    ),
    SyncEntityTableData,
    PrefetchHooks Function()>;
typedef $$SyncChangeLogTableTableCreateCompanionBuilder
    = SyncChangeLogTableCompanion Function({
  Value<int> id,
  required String entityType,
  required String uuid,
  required String operation,
  Value<String?> payload,
  required DateTime updatedAt,
  required String deviceId,
});
typedef $$SyncChangeLogTableTableUpdateCompanionBuilder
    = SyncChangeLogTableCompanion Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> uuid,
  Value<String> operation,
  Value<String?> payload,
  Value<DateTime> updatedAt,
  Value<String> deviceId,
});

class $$SyncChangeLogTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncChangeLogTableTable> {
  $$SyncChangeLogTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));
}

class $$SyncChangeLogTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncChangeLogTableTable> {
  $$SyncChangeLogTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uuid => $composableBuilder(
      column: $table.uuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));
}

class $$SyncChangeLogTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncChangeLogTableTable> {
  $$SyncChangeLogTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);
}

class $$SyncChangeLogTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncChangeLogTableTable,
    SyncChangeLogTableData,
    $$SyncChangeLogTableTableFilterComposer,
    $$SyncChangeLogTableTableOrderingComposer,
    $$SyncChangeLogTableTableAnnotationComposer,
    $$SyncChangeLogTableTableCreateCompanionBuilder,
    $$SyncChangeLogTableTableUpdateCompanionBuilder,
    (
      SyncChangeLogTableData,
      BaseReferences<_$AppDatabase, $SyncChangeLogTableTable,
          SyncChangeLogTableData>
    ),
    SyncChangeLogTableData,
    PrefetchHooks Function()> {
  $$SyncChangeLogTableTableTableManager(
      _$AppDatabase db, $SyncChangeLogTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncChangeLogTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncChangeLogTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncChangeLogTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> uuid = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String?> payload = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
          }) =>
              SyncChangeLogTableCompanion(
            id: id,
            entityType: entityType,
            uuid: uuid,
            operation: operation,
            payload: payload,
            updatedAt: updatedAt,
            deviceId: deviceId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String uuid,
            required String operation,
            Value<String?> payload = const Value.absent(),
            required DateTime updatedAt,
            required String deviceId,
          }) =>
              SyncChangeLogTableCompanion.insert(
            id: id,
            entityType: entityType,
            uuid: uuid,
            operation: operation,
            payload: payload,
            updatedAt: updatedAt,
            deviceId: deviceId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncChangeLogTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncChangeLogTableTable,
    SyncChangeLogTableData,
    $$SyncChangeLogTableTableFilterComposer,
    $$SyncChangeLogTableTableOrderingComposer,
    $$SyncChangeLogTableTableAnnotationComposer,
    $$SyncChangeLogTableTableCreateCompanionBuilder,
    $$SyncChangeLogTableTableUpdateCompanionBuilder,
    (
      SyncChangeLogTableData,
      BaseReferences<_$AppDatabase, $SyncChangeLogTableTable,
          SyncChangeLogTableData>
    ),
    SyncChangeLogTableData,
    PrefetchHooks Function()>;
typedef $$SyncPeerStateTableTableCreateCompanionBuilder
    = SyncPeerStateTableCompanion Function({
  required String peerDeviceId,
  required String peerName,
  Value<int> lastSentChangeId,
  Value<int> lastReceivedChangeId,
  Value<DateTime?> lastSyncedAt,
  Value<bool> isTrusted,
  Value<int> rowid,
});
typedef $$SyncPeerStateTableTableUpdateCompanionBuilder
    = SyncPeerStateTableCompanion Function({
  Value<String> peerDeviceId,
  Value<String> peerName,
  Value<int> lastSentChangeId,
  Value<int> lastReceivedChangeId,
  Value<DateTime?> lastSyncedAt,
  Value<bool> isTrusted,
  Value<int> rowid,
});

class $$SyncPeerStateTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncPeerStateTableTable> {
  $$SyncPeerStateTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get peerDeviceId => $composableBuilder(
      column: $table.peerDeviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get peerName => $composableBuilder(
      column: $table.peerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastSentChangeId => $composableBuilder(
      column: $table.lastSentChangeId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastReceivedChangeId => $composableBuilder(
      column: $table.lastReceivedChangeId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isTrusted => $composableBuilder(
      column: $table.isTrusted, builder: (column) => ColumnFilters(column));
}

class $$SyncPeerStateTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncPeerStateTableTable> {
  $$SyncPeerStateTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get peerDeviceId => $composableBuilder(
      column: $table.peerDeviceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get peerName => $composableBuilder(
      column: $table.peerName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastSentChangeId => $composableBuilder(
      column: $table.lastSentChangeId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastReceivedChangeId => $composableBuilder(
      column: $table.lastReceivedChangeId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isTrusted => $composableBuilder(
      column: $table.isTrusted, builder: (column) => ColumnOrderings(column));
}

class $$SyncPeerStateTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncPeerStateTableTable> {
  $$SyncPeerStateTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get peerDeviceId => $composableBuilder(
      column: $table.peerDeviceId, builder: (column) => column);

  GeneratedColumn<String> get peerName =>
      $composableBuilder(column: $table.peerName, builder: (column) => column);

  GeneratedColumn<int> get lastSentChangeId => $composableBuilder(
      column: $table.lastSentChangeId, builder: (column) => column);

  GeneratedColumn<int> get lastReceivedChangeId => $composableBuilder(
      column: $table.lastReceivedChangeId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
      column: $table.lastSyncedAt, builder: (column) => column);

  GeneratedColumn<bool> get isTrusted =>
      $composableBuilder(column: $table.isTrusted, builder: (column) => column);
}

class $$SyncPeerStateTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncPeerStateTableTable,
    SyncPeerStateTableData,
    $$SyncPeerStateTableTableFilterComposer,
    $$SyncPeerStateTableTableOrderingComposer,
    $$SyncPeerStateTableTableAnnotationComposer,
    $$SyncPeerStateTableTableCreateCompanionBuilder,
    $$SyncPeerStateTableTableUpdateCompanionBuilder,
    (
      SyncPeerStateTableData,
      BaseReferences<_$AppDatabase, $SyncPeerStateTableTable,
          SyncPeerStateTableData>
    ),
    SyncPeerStateTableData,
    PrefetchHooks Function()> {
  $$SyncPeerStateTableTableTableManager(
      _$AppDatabase db, $SyncPeerStateTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncPeerStateTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncPeerStateTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncPeerStateTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> peerDeviceId = const Value.absent(),
            Value<String> peerName = const Value.absent(),
            Value<int> lastSentChangeId = const Value.absent(),
            Value<int> lastReceivedChangeId = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<bool> isTrusted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncPeerStateTableCompanion(
            peerDeviceId: peerDeviceId,
            peerName: peerName,
            lastSentChangeId: lastSentChangeId,
            lastReceivedChangeId: lastReceivedChangeId,
            lastSyncedAt: lastSyncedAt,
            isTrusted: isTrusted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String peerDeviceId,
            required String peerName,
            Value<int> lastSentChangeId = const Value.absent(),
            Value<int> lastReceivedChangeId = const Value.absent(),
            Value<DateTime?> lastSyncedAt = const Value.absent(),
            Value<bool> isTrusted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncPeerStateTableCompanion.insert(
            peerDeviceId: peerDeviceId,
            peerName: peerName,
            lastSentChangeId: lastSentChangeId,
            lastReceivedChangeId: lastReceivedChangeId,
            lastSyncedAt: lastSyncedAt,
            isTrusted: isTrusted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncPeerStateTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncPeerStateTableTable,
    SyncPeerStateTableData,
    $$SyncPeerStateTableTableFilterComposer,
    $$SyncPeerStateTableTableOrderingComposer,
    $$SyncPeerStateTableTableAnnotationComposer,
    $$SyncPeerStateTableTableCreateCompanionBuilder,
    $$SyncPeerStateTableTableUpdateCompanionBuilder,
    (
      SyncPeerStateTableData,
      BaseReferences<_$AppDatabase, $SyncPeerStateTableTable,
          SyncPeerStateTableData>
    ),
    SyncPeerStateTableData,
    PrefetchHooks Function()>;
typedef $$DeviceIdentityTableTableCreateCompanionBuilder
    = DeviceIdentityTableCompanion Function({
  Value<int> id,
  required String deviceId,
  required String deviceName,
});
typedef $$DeviceIdentityTableTableUpdateCompanionBuilder
    = DeviceIdentityTableCompanion Function({
  Value<int> id,
  Value<String> deviceId,
  Value<String> deviceName,
});

class $$DeviceIdentityTableTableFilterComposer
    extends Composer<_$AppDatabase, $DeviceIdentityTableTable> {
  $$DeviceIdentityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deviceName => $composableBuilder(
      column: $table.deviceName, builder: (column) => ColumnFilters(column));
}

class $$DeviceIdentityTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DeviceIdentityTableTable> {
  $$DeviceIdentityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceId => $composableBuilder(
      column: $table.deviceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deviceName => $composableBuilder(
      column: $table.deviceName, builder: (column) => ColumnOrderings(column));
}

class $$DeviceIdentityTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DeviceIdentityTableTable> {
  $$DeviceIdentityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get deviceName => $composableBuilder(
      column: $table.deviceName, builder: (column) => column);
}

class $$DeviceIdentityTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DeviceIdentityTableTable,
    DeviceIdentityTableData,
    $$DeviceIdentityTableTableFilterComposer,
    $$DeviceIdentityTableTableOrderingComposer,
    $$DeviceIdentityTableTableAnnotationComposer,
    $$DeviceIdentityTableTableCreateCompanionBuilder,
    $$DeviceIdentityTableTableUpdateCompanionBuilder,
    (
      DeviceIdentityTableData,
      BaseReferences<_$AppDatabase, $DeviceIdentityTableTable,
          DeviceIdentityTableData>
    ),
    DeviceIdentityTableData,
    PrefetchHooks Function()> {
  $$DeviceIdentityTableTableTableManager(
      _$AppDatabase db, $DeviceIdentityTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeviceIdentityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeviceIdentityTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeviceIdentityTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
            Value<String> deviceName = const Value.absent(),
          }) =>
              DeviceIdentityTableCompanion(
            id: id,
            deviceId: deviceId,
            deviceName: deviceName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String deviceId,
            required String deviceName,
          }) =>
              DeviceIdentityTableCompanion.insert(
            id: id,
            deviceId: deviceId,
            deviceName: deviceName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DeviceIdentityTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DeviceIdentityTableTable,
    DeviceIdentityTableData,
    $$DeviceIdentityTableTableFilterComposer,
    $$DeviceIdentityTableTableOrderingComposer,
    $$DeviceIdentityTableTableAnnotationComposer,
    $$DeviceIdentityTableTableCreateCompanionBuilder,
    $$DeviceIdentityTableTableUpdateCompanionBuilder,
    (
      DeviceIdentityTableData,
      BaseReferences<_$AppDatabase, $DeviceIdentityTableTable,
          DeviceIdentityTableData>
    ),
    DeviceIdentityTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CollectionTableTableTableManager get collectionTable =>
      $$CollectionTableTableTableManager(_db, _db.collectionTable);
  $$NoteCitationTableTableTableManager get noteCitationTable =>
      $$NoteCitationTableTableTableManager(_db, _db.noteCitationTable);
  $$NoteTableTableTableManager get noteTable =>
      $$NoteTableTableTableManager(_db, _db.noteTable);
  $$CollectionNoteRefTableTableTableManager get collectionNoteRefTable =>
      $$CollectionNoteRefTableTableTableManager(
          _db, _db.collectionNoteRefTable);
  $$CollectionMediaTableTableTableManager get collectionMediaTable =>
      $$CollectionMediaTableTableTableManager(_db, _db.collectionMediaTable);
  $$HistoryTableTableTableManager get historyTable =>
      $$HistoryTableTableTableManager(_db, _db.historyTable);
  $$SyncEntityTableTableTableManager get syncEntityTable =>
      $$SyncEntityTableTableTableManager(_db, _db.syncEntityTable);
  $$SyncChangeLogTableTableTableManager get syncChangeLogTable =>
      $$SyncChangeLogTableTableTableManager(_db, _db.syncChangeLogTable);
  $$SyncPeerStateTableTableTableManager get syncPeerStateTable =>
      $$SyncPeerStateTableTableTableManager(_db, _db.syncPeerStateTable);
  $$DeviceIdentityTableTableTableManager get deviceIdentityTable =>
      $$DeviceIdentityTableTableTableManager(_db, _db.deviceIdentityTable);
}
