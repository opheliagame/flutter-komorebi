// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<int> mediaId = GeneratedColumn<int>(
      'media_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES collection_media (id)'));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES collection (id)'));
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
      [id, name, description, media, mediaId, parentId, createdAt, modifiedAt];
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
    if (data.containsKey('media_id')) {
      context.handle(_mediaIdMeta,
          mediaId.isAcceptableOrUnknown(data['media_id']!, _mediaIdMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
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
      mediaId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}media_id']),
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_id']),
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
  final int? mediaId;
  final int? parentId;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const CollectionTableData(
      {required this.id,
      required this.name,
      this.description,
      this.media,
      this.mediaId,
      this.parentId,
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
    if (!nullToAbsent || mediaId != null) {
      map['media_id'] = Variable<int>(mediaId);
    }
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<int>(parentId);
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
      mediaId: mediaId == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaId),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
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
      mediaId: serializer.fromJson<int?>(json['mediaId']),
      parentId: serializer.fromJson<int?>(json['parentId']),
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
      'mediaId': serializer.toJson<int?>(mediaId),
      'parentId': serializer.toJson<int?>(parentId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'modifiedAt': serializer.toJson<DateTime>(modifiedAt),
    };
  }

  CollectionTableData copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<Uint8List?> media = const Value.absent(),
          Value<int?> mediaId = const Value.absent(),
          Value<int?> parentId = const Value.absent(),
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      CollectionTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        media: media.present ? media.value : this.media,
        mediaId: mediaId.present ? mediaId.value : this.mediaId,
        parentId: parentId.present ? parentId.value : this.parentId,
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
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
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
          ..write('mediaId: $mediaId, ')
          ..write('parentId: $parentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description,
      $driftBlobEquality.hash(media), mediaId, parentId, createdAt, modifiedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.media, this.media) &&
          other.mediaId == this.mediaId &&
          other.parentId == this.parentId &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class CollectionTableCompanion extends UpdateCompanion<CollectionTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<Uint8List?> media;
  final Value<int?> mediaId;
  final Value<int?> parentId;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const CollectionTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.media = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  CollectionTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.media = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.parentId = const Value.absent(),
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
    Expression<int>? mediaId,
    Expression<int>? parentId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? modifiedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (media != null) 'media': media,
      if (mediaId != null) 'media_id': mediaId,
      if (parentId != null) 'parent_id': parentId,
      if (createdAt != null) 'created_at': createdAt,
      if (modifiedAt != null) 'modified_at': modifiedAt,
    });
  }

  CollectionTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<Uint8List?>? media,
      Value<int?>? mediaId,
      Value<int?>? parentId,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return CollectionTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      media: media ?? this.media,
      mediaId: mediaId ?? this.mediaId,
      parentId: parentId ?? this.parentId,
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
    if (mediaId.present) {
      map['media_id'] = Variable<int>(mediaId.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<int>(parentId.value);
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
          ..write('mediaId: $mediaId, ')
          ..write('parentId: $parentId, ')
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

class $CollectionNoteTableTable extends CollectionNoteTable
    with TableInfo<$CollectionNoteTableTable, CollectionNoteTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionNoteTableTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, noteId, collectionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_note';
  @override
  VerificationContext validateIntegrity(
      Insertable<CollectionNoteTableData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionNoteTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionNoteTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      noteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}note_id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
    );
  }

  @override
  $CollectionNoteTableTable createAlias(String alias) {
    return $CollectionNoteTableTable(attachedDatabase, alias);
  }
}

class CollectionNoteTableData extends DataClass
    implements Insertable<CollectionNoteTableData> {
  final int id;
  final int noteId;
  final int collectionId;
  const CollectionNoteTableData(
      {required this.id, required this.noteId, required this.collectionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['note_id'] = Variable<int>(noteId);
    map['collection_id'] = Variable<int>(collectionId);
    return map;
  }

  CollectionNoteTableCompanion toCompanion(bool nullToAbsent) {
    return CollectionNoteTableCompanion(
      id: Value(id),
      noteId: Value(noteId),
      collectionId: Value(collectionId),
    );
  }

  factory CollectionNoteTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionNoteTableData(
      id: serializer.fromJson<int>(json['id']),
      noteId: serializer.fromJson<int>(json['noteId']),
      collectionId: serializer.fromJson<int>(json['collectionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'noteId': serializer.toJson<int>(noteId),
      'collectionId': serializer.toJson<int>(collectionId),
    };
  }

  CollectionNoteTableData copyWith({int? id, int? noteId, int? collectionId}) =>
      CollectionNoteTableData(
        id: id ?? this.id,
        noteId: noteId ?? this.noteId,
        collectionId: collectionId ?? this.collectionId,
      );
  CollectionNoteTableData copyWithCompanion(CollectionNoteTableCompanion data) {
    return CollectionNoteTableData(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionNoteTableData(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, noteId, collectionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionNoteTableData &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.collectionId == this.collectionId);
}

class CollectionNoteTableCompanion
    extends UpdateCompanion<CollectionNoteTableData> {
  final Value<int> id;
  final Value<int> noteId;
  final Value<int> collectionId;
  const CollectionNoteTableCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.collectionId = const Value.absent(),
  });
  CollectionNoteTableCompanion.insert({
    this.id = const Value.absent(),
    required int noteId,
    required int collectionId,
  })  : noteId = Value(noteId),
        collectionId = Value(collectionId);
  static Insertable<CollectionNoteTableData> custom({
    Expression<int>? id,
    Expression<int>? noteId,
    Expression<int>? collectionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (noteId != null) 'note_id': noteId,
      if (collectionId != null) 'collection_id': collectionId,
    });
  }

  CollectionNoteTableCompanion copyWith(
      {Value<int>? id, Value<int>? noteId, Value<int>? collectionId}) {
    return CollectionNoteTableCompanion(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      collectionId: collectionId ?? this.collectionId,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionNoteTableCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CollectionMediaTableTable collectionMediaTable =
      $CollectionMediaTableTable(this);
  late final $CollectionTableTable collectionTable =
      $CollectionTableTable(this);
  late final $NoteCitationTableTable noteCitationTable =
      $NoteCitationTableTable(this);
  late final $NoteTableTable noteTable = $NoteTableTable(this);
  late final $CollectionNoteTableTable collectionNoteTable =
      $CollectionNoteTableTable(this);
  late final $HistoryTableTable historyTable = $HistoryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        collectionMediaTable,
        collectionTable,
        noteCitationTable,
        noteTable,
        collectionNoteTable,
        historyTable
      ];
}

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

final class $$CollectionMediaTableTableReferences extends BaseReferences<
    _$AppDatabase, $CollectionMediaTableTable, CollectionMediaTableData> {
  $$CollectionMediaTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionTableTable, List<CollectionTableData>>
      _collectionTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.collectionTable,
              aliasName: $_aliasNameGenerator(
                  db.collectionMediaTable.id, db.collectionTable.mediaId));

  $$CollectionTableTableProcessedTableManager get collectionTableRefs {
    final manager =
        $$CollectionTableTableTableManager($_db, $_db.collectionTable)
            .filter((f) => f.mediaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

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

  Expression<bool> collectionTableRefs(
      Expression<bool> Function($$CollectionTableTableFilterComposer f) f) {
    final $$CollectionTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.mediaId,
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
    return f(composer);
  }
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

  Expression<T> collectionTableRefs<T extends Object>(
      Expression<T> Function($$CollectionTableTableAnnotationComposer a) f) {
    final $$CollectionTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionTable,
        getReferencedColumn: (t) => t.mediaId,
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
    return f(composer);
  }
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
    (CollectionMediaTableData, $$CollectionMediaTableTableReferences),
    CollectionMediaTableData,
    PrefetchHooks Function({bool collectionTableRefs})> {
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
              .map((e) => (
                    e.readTable(table),
                    $$CollectionMediaTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({collectionTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionTableRefs) db.collectionTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionTableRefs)
                    await $_getPrefetchedData<CollectionMediaTableData,
                            $CollectionMediaTableTable, CollectionTableData>(
                        currentTable: table,
                        referencedTable: $$CollectionMediaTableTableReferences
                            ._collectionTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionMediaTableTableReferences(db, table, p0)
                                .collectionTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.mediaId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
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
        (CollectionMediaTableData, $$CollectionMediaTableTableReferences),
        CollectionMediaTableData,
        PrefetchHooks Function({bool collectionTableRefs})>;
typedef $$CollectionTableTableCreateCompanionBuilder = CollectionTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  Value<Uint8List?> media,
  Value<int?> mediaId,
  Value<int?> parentId,
  required DateTime createdAt,
  required DateTime modifiedAt,
});
typedef $$CollectionTableTableUpdateCompanionBuilder = CollectionTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<Uint8List?> media,
  Value<int?> mediaId,
  Value<int?> parentId,
  Value<DateTime> createdAt,
  Value<DateTime> modifiedAt,
});

final class $$CollectionTableTableReferences extends BaseReferences<
    _$AppDatabase, $CollectionTableTable, CollectionTableData> {
  $$CollectionTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CollectionMediaTableTable _mediaIdTable(_$AppDatabase db) =>
      db.collectionMediaTable.createAlias($_aliasNameGenerator(
          db.collectionTable.mediaId, db.collectionMediaTable.id));

  $$CollectionMediaTableTableProcessedTableManager? get mediaId {
    final $_column = $_itemColumn<int>('media_id');
    if ($_column == null) return null;
    final manager =
        $$CollectionMediaTableTableTableManager($_db, $_db.collectionMediaTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_mediaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CollectionTableTable _parentIdTable(_$AppDatabase db) =>
      db.collectionTable.createAlias($_aliasNameGenerator(
          db.collectionTable.parentId, db.collectionTable.id));

  $$CollectionTableTableProcessedTableManager? get parentId {
    final $_column = $_itemColumn<int>('parent_id');
    if ($_column == null) return null;
    final manager =
        $$CollectionTableTableTableManager($_db, $_db.collectionTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CollectionNoteTableTable,
      List<CollectionNoteTableData>> _collectionNoteTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.collectionNoteTable,
          aliasName: $_aliasNameGenerator(
              db.collectionTable.id, db.collectionNoteTable.collectionId));

  $$CollectionNoteTableTableProcessedTableManager get collectionNoteTableRefs {
    final manager = $$CollectionNoteTableTableTableManager(
            $_db, $_db.collectionNoteTable)
        .filter((f) => f.collectionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionNoteTableRefsTable($_db));
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

  $$CollectionMediaTableTableFilterComposer get mediaId {
    final $$CollectionMediaTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.mediaId,
        referencedTable: $db.collectionMediaTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionMediaTableTableFilterComposer(
              $db: $db,
              $table: $db.collectionMediaTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CollectionTableTableFilterComposer get parentId {
    final $$CollectionTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
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

  Expression<bool> collectionNoteTableRefs(
      Expression<bool> Function($$CollectionNoteTableTableFilterComposer f) f) {
    final $$CollectionNoteTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionNoteTable,
        getReferencedColumn: (t) => t.collectionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionNoteTableTableFilterComposer(
              $db: $db,
              $table: $db.collectionNoteTable,
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

  $$CollectionMediaTableTableOrderingComposer get mediaId {
    final $$CollectionMediaTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.mediaId,
            referencedTable: $db.collectionMediaTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionMediaTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.collectionMediaTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$CollectionTableTableOrderingComposer get parentId {
    final $$CollectionTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
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

  $$CollectionMediaTableTableAnnotationComposer get mediaId {
    final $$CollectionMediaTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.mediaId,
            referencedTable: $db.collectionMediaTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionMediaTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.collectionMediaTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$CollectionTableTableAnnotationComposer get parentId {
    final $$CollectionTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
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

  Expression<T> collectionNoteTableRefs<T extends Object>(
      Expression<T> Function($$CollectionNoteTableTableAnnotationComposer a)
          f) {
    final $$CollectionNoteTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.collectionNoteTable,
            getReferencedColumn: (t) => t.collectionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionNoteTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.collectionNoteTable,
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
        {bool mediaId,
        bool parentId,
        bool collectionNoteTableRefs,
        bool historyTableRefs})> {
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
            Value<int?> mediaId = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> modifiedAt = const Value.absent(),
          }) =>
              CollectionTableCompanion(
            id: id,
            name: name,
            description: description,
            media: media,
            mediaId: mediaId,
            parentId: parentId,
            createdAt: createdAt,
            modifiedAt: modifiedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            Value<Uint8List?> media = const Value.absent(),
            Value<int?> mediaId = const Value.absent(),
            Value<int?> parentId = const Value.absent(),
            required DateTime createdAt,
            required DateTime modifiedAt,
          }) =>
              CollectionTableCompanion.insert(
            id: id,
            name: name,
            description: description,
            media: media,
            mediaId: mediaId,
            parentId: parentId,
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
              {mediaId = false,
              parentId = false,
              collectionNoteTableRefs = false,
              historyTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionNoteTableRefs) db.collectionNoteTable,
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
                if (mediaId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.mediaId,
                    referencedTable:
                        $$CollectionTableTableReferences._mediaIdTable(db),
                    referencedColumn:
                        $$CollectionTableTableReferences._mediaIdTable(db).id,
                  ) as T;
                }
                if (parentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentId,
                    referencedTable:
                        $$CollectionTableTableReferences._parentIdTable(db),
                    referencedColumn:
                        $$CollectionTableTableReferences._parentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionNoteTableRefs)
                    await $_getPrefetchedData<CollectionTableData,
                            $CollectionTableTable, CollectionNoteTableData>(
                        currentTable: table,
                        referencedTable: $$CollectionTableTableReferences
                            ._collectionNoteTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CollectionTableTableReferences(db, table, p0)
                                .collectionNoteTableRefs,
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
        {bool mediaId,
        bool parentId,
        bool collectionNoteTableRefs,
        bool historyTableRefs})>;
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

  static MultiTypedResultKey<$CollectionNoteTableTable,
      List<CollectionNoteTableData>> _collectionNoteTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.collectionNoteTable,
          aliasName: $_aliasNameGenerator(
              db.noteTable.id, db.collectionNoteTable.noteId));

  $$CollectionNoteTableTableProcessedTableManager get collectionNoteTableRefs {
    final manager =
        $$CollectionNoteTableTableTableManager($_db, $_db.collectionNoteTable)
            .filter((f) => f.noteId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionNoteTableRefsTable($_db));
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

  Expression<bool> collectionNoteTableRefs(
      Expression<bool> Function($$CollectionNoteTableTableFilterComposer f) f) {
    final $$CollectionNoteTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionNoteTable,
        getReferencedColumn: (t) => t.noteId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionNoteTableTableFilterComposer(
              $db: $db,
              $table: $db.collectionNoteTable,
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

  Expression<T> collectionNoteTableRefs<T extends Object>(
      Expression<T> Function($$CollectionNoteTableTableAnnotationComposer a)
          f) {
    final $$CollectionNoteTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.collectionNoteTable,
            getReferencedColumn: (t) => t.noteId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionNoteTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.collectionNoteTable,
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
        bool collectionNoteTableRefs,
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
              collectionNoteTableRefs = false,
              historyTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionNoteTableRefs) db.collectionNoteTable,
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
                  if (collectionNoteTableRefs)
                    await $_getPrefetchedData<NoteTableData, $NoteTableTable,
                            CollectionNoteTableData>(
                        currentTable: table,
                        referencedTable: $$NoteTableTableReferences
                            ._collectionNoteTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NoteTableTableReferences(db, table, p0)
                                .collectionNoteTableRefs,
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
        bool collectionNoteTableRefs,
        bool historyTableRefs})>;
typedef $$CollectionNoteTableTableCreateCompanionBuilder
    = CollectionNoteTableCompanion Function({
  Value<int> id,
  required int noteId,
  required int collectionId,
});
typedef $$CollectionNoteTableTableUpdateCompanionBuilder
    = CollectionNoteTableCompanion Function({
  Value<int> id,
  Value<int> noteId,
  Value<int> collectionId,
});

final class $$CollectionNoteTableTableReferences extends BaseReferences<
    _$AppDatabase, $CollectionNoteTableTable, CollectionNoteTableData> {
  $$CollectionNoteTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $NoteTableTable _noteIdTable(_$AppDatabase db) =>
      db.noteTable.createAlias(
          $_aliasNameGenerator(db.collectionNoteTable.noteId, db.noteTable.id));

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
          db.collectionNoteTable.collectionId, db.collectionTable.id));

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

class $$CollectionNoteTableTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionNoteTableTable> {
  $$CollectionNoteTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

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

class $$CollectionNoteTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionNoteTableTable> {
  $$CollectionNoteTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

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

class $$CollectionNoteTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionNoteTableTable> {
  $$CollectionNoteTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

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

class $$CollectionNoteTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CollectionNoteTableTable,
    CollectionNoteTableData,
    $$CollectionNoteTableTableFilterComposer,
    $$CollectionNoteTableTableOrderingComposer,
    $$CollectionNoteTableTableAnnotationComposer,
    $$CollectionNoteTableTableCreateCompanionBuilder,
    $$CollectionNoteTableTableUpdateCompanionBuilder,
    (CollectionNoteTableData, $$CollectionNoteTableTableReferences),
    CollectionNoteTableData,
    PrefetchHooks Function({bool noteId, bool collectionId})> {
  $$CollectionNoteTableTableTableManager(
      _$AppDatabase db, $CollectionNoteTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionNoteTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionNoteTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionNoteTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> noteId = const Value.absent(),
            Value<int> collectionId = const Value.absent(),
          }) =>
              CollectionNoteTableCompanion(
            id: id,
            noteId: noteId,
            collectionId: collectionId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int noteId,
            required int collectionId,
          }) =>
              CollectionNoteTableCompanion.insert(
            id: id,
            noteId: noteId,
            collectionId: collectionId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionNoteTableTableReferences(db, table, e)
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
                        $$CollectionNoteTableTableReferences._noteIdTable(db),
                    referencedColumn: $$CollectionNoteTableTableReferences
                        ._noteIdTable(db)
                        .id,
                  ) as T;
                }
                if (collectionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.collectionId,
                    referencedTable: $$CollectionNoteTableTableReferences
                        ._collectionIdTable(db),
                    referencedColumn: $$CollectionNoteTableTableReferences
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

typedef $$CollectionNoteTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CollectionNoteTableTable,
    CollectionNoteTableData,
    $$CollectionNoteTableTableFilterComposer,
    $$CollectionNoteTableTableOrderingComposer,
    $$CollectionNoteTableTableAnnotationComposer,
    $$CollectionNoteTableTableCreateCompanionBuilder,
    $$CollectionNoteTableTableUpdateCompanionBuilder,
    (CollectionNoteTableData, $$CollectionNoteTableTableReferences),
    CollectionNoteTableData,
    PrefetchHooks Function({bool noteId, bool collectionId})>;
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CollectionMediaTableTableTableManager get collectionMediaTable =>
      $$CollectionMediaTableTableTableManager(_db, _db.collectionMediaTable);
  $$CollectionTableTableTableManager get collectionTable =>
      $$CollectionTableTableTableManager(_db, _db.collectionTable);
  $$NoteCitationTableTableTableManager get noteCitationTable =>
      $$NoteCitationTableTableTableManager(_db, _db.noteCitationTable);
  $$NoteTableTableTableManager get noteTable =>
      $$NoteTableTableTableManager(_db, _db.noteTable);
  $$CollectionNoteTableTableTableManager get collectionNoteTable =>
      $$CollectionNoteTableTableTableManager(_db, _db.collectionNoteTable);
  $$HistoryTableTableTableManager get historyTable =>
      $$HistoryTableTableTableManager(_db, _db.historyTable);
}
