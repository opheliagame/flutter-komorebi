// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class CollectionMedia extends Table
    with TableInfo<CollectionMedia, CollectionMediaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CollectionMedia(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
      'caption', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<Uint8List> media = GeneratedColumn<Uint8List>(
      'media', aliasedName, false,
      type: DriftSqlType.blob, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionMediaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionMediaData(
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
  CollectionMedia createAlias(String alias) {
    return CollectionMedia(attachedDatabase, alias);
  }
}

class CollectionMediaData extends DataClass
    implements Insertable<CollectionMediaData> {
  final int id;
  final String? name;
  final String? caption;
  final Uint8List media;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const CollectionMediaData(
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

  CollectionMediaCompanion toCompanion(bool nullToAbsent) {
    return CollectionMediaCompanion(
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

  factory CollectionMediaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionMediaData(
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

  CollectionMediaData copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> caption = const Value.absent(),
          Uint8List? media,
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      CollectionMediaData(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        caption: caption.present ? caption.value : this.caption,
        media: media ?? this.media,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
  CollectionMediaData copyWithCompanion(CollectionMediaCompanion data) {
    return CollectionMediaData(
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
    return (StringBuffer('CollectionMediaData(')
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
      (other is CollectionMediaData &&
          other.id == this.id &&
          other.name == this.name &&
          other.caption == this.caption &&
          $driftBlobEquality.equals(other.media, this.media) &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class CollectionMediaCompanion extends UpdateCompanion<CollectionMediaData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> caption;
  final Value<Uint8List> media;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const CollectionMediaCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.caption = const Value.absent(),
    this.media = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  CollectionMediaCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.caption = const Value.absent(),
    required Uint8List media,
    required DateTime createdAt,
    required DateTime modifiedAt,
  })  : media = Value(media),
        createdAt = Value(createdAt),
        modifiedAt = Value(modifiedAt);
  static Insertable<CollectionMediaData> custom({
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

  CollectionMediaCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? caption,
      Value<Uint8List>? media,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return CollectionMediaCompanion(
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
    return (StringBuffer('CollectionMediaCompanion(')
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

class Collection extends Table with TableInfo<Collection, CollectionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Collection(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<Uint8List> media = GeneratedColumn<Uint8List>(
      'media', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  late final GeneratedColumn<int> mediaId = GeneratedColumn<int>(
      'media_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES collection_media (id)'));
  late final GeneratedColumn<int> parentId = GeneratedColumn<int>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES collection (id)'));
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionData(
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
  Collection createAlias(String alias) {
    return Collection(attachedDatabase, alias);
  }
}

class CollectionData extends DataClass implements Insertable<CollectionData> {
  final int id;
  final String name;
  final String? description;
  final Uint8List? media;
  final int? mediaId;
  final int? parentId;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const CollectionData(
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

  CollectionCompanion toCompanion(bool nullToAbsent) {
    return CollectionCompanion(
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

  factory CollectionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionData(
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

  CollectionData copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<Uint8List?> media = const Value.absent(),
          Value<int?> mediaId = const Value.absent(),
          Value<int?> parentId = const Value.absent(),
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      CollectionData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        media: media.present ? media.value : this.media,
        mediaId: mediaId.present ? mediaId.value : this.mediaId,
        parentId: parentId.present ? parentId.value : this.parentId,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
  CollectionData copyWithCompanion(CollectionCompanion data) {
    return CollectionData(
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
    return (StringBuffer('CollectionData(')
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
      (other is CollectionData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          $driftBlobEquality.equals(other.media, this.media) &&
          other.mediaId == this.mediaId &&
          other.parentId == this.parentId &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class CollectionCompanion extends UpdateCompanion<CollectionData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<Uint8List?> media;
  final Value<int?> mediaId;
  final Value<int?> parentId;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const CollectionCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.media = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  CollectionCompanion.insert({
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
  static Insertable<CollectionData> custom({
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

  CollectionCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<Uint8List?>? media,
      Value<int?>? mediaId,
      Value<int?>? parentId,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return CollectionCompanion(
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
    return (StringBuffer('CollectionCompanion(')
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

class NoteCitation extends Table
    with TableInfo<NoteCitation, NoteCitationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  NoteCitation(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteCitationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteCitationData(
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
  NoteCitation createAlias(String alias) {
    return NoteCitation(attachedDatabase, alias);
  }
}

class NoteCitationData extends DataClass
    implements Insertable<NoteCitationData> {
  final int id;
  final String title;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const NoteCitationData(
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

  NoteCitationCompanion toCompanion(bool nullToAbsent) {
    return NoteCitationCompanion(
      id: Value(id),
      title: Value(title),
      createdAt: Value(createdAt),
      modifiedAt: Value(modifiedAt),
    );
  }

  factory NoteCitationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteCitationData(
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

  NoteCitationData copyWith(
          {int? id,
          String? title,
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      NoteCitationData(
        id: id ?? this.id,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
  NoteCitationData copyWithCompanion(NoteCitationCompanion data) {
    return NoteCitationData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      modifiedAt:
          data.modifiedAt.present ? data.modifiedAt.value : this.modifiedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteCitationData(')
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
      (other is NoteCitationData &&
          other.id == this.id &&
          other.title == this.title &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class NoteCitationCompanion extends UpdateCompanion<NoteCitationData> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const NoteCitationCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  NoteCitationCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime createdAt,
    required DateTime modifiedAt,
  })  : title = Value(title),
        createdAt = Value(createdAt),
        modifiedAt = Value(modifiedAt);
  static Insertable<NoteCitationData> custom({
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

  NoteCitationCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return NoteCitationCompanion(
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
    return (StringBuffer('NoteCitationCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt, ')
          ..write('modifiedAt: $modifiedAt')
          ..write(')'))
        .toString();
  }
}

class Note extends Table with TableInfo<Note, NoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Note(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<Uint8List> media = GeneratedColumn<Uint8List>(
      'media', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  late final GeneratedColumn<int> citationId = GeneratedColumn<int>(
      'citation_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES note_citation (id)'));
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteData(
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
  Note createAlias(String alias) {
    return Note(attachedDatabase, alias);
  }
}

class NoteData extends DataClass implements Insertable<NoteData> {
  final int id;
  final String? content;
  final Uint8List? media;
  final int? citationId;
  final DateTime createdAt;
  final DateTime modifiedAt;
  const NoteData(
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

  NoteCompanion toCompanion(bool nullToAbsent) {
    return NoteCompanion(
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

  factory NoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteData(
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

  NoteData copyWith(
          {int? id,
          Value<String?> content = const Value.absent(),
          Value<Uint8List?> media = const Value.absent(),
          Value<int?> citationId = const Value.absent(),
          DateTime? createdAt,
          DateTime? modifiedAt}) =>
      NoteData(
        id: id ?? this.id,
        content: content.present ? content.value : this.content,
        media: media.present ? media.value : this.media,
        citationId: citationId.present ? citationId.value : this.citationId,
        createdAt: createdAt ?? this.createdAt,
        modifiedAt: modifiedAt ?? this.modifiedAt,
      );
  NoteData copyWithCompanion(NoteCompanion data) {
    return NoteData(
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
    return (StringBuffer('NoteData(')
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
      (other is NoteData &&
          other.id == this.id &&
          other.content == this.content &&
          $driftBlobEquality.equals(other.media, this.media) &&
          other.citationId == this.citationId &&
          other.createdAt == this.createdAt &&
          other.modifiedAt == this.modifiedAt);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<int> id;
  final Value<String?> content;
  final Value<Uint8List?> media;
  final Value<int?> citationId;
  final Value<DateTime> createdAt;
  final Value<DateTime> modifiedAt;
  const NoteCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.media = const Value.absent(),
    this.citationId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.modifiedAt = const Value.absent(),
  });
  NoteCompanion.insert({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.media = const Value.absent(),
    this.citationId = const Value.absent(),
    required DateTime createdAt,
    required DateTime modifiedAt,
  })  : createdAt = Value(createdAt),
        modifiedAt = Value(modifiedAt);
  static Insertable<NoteData> custom({
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

  NoteCompanion copyWith(
      {Value<int>? id,
      Value<String?>? content,
      Value<Uint8List?>? media,
      Value<int?>? citationId,
      Value<DateTime>? createdAt,
      Value<DateTime>? modifiedAt}) {
    return NoteCompanion(
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
    return (StringBuffer('NoteCompanion(')
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

class CollectionNote extends Table
    with TableInfo<CollectionNote, CollectionNoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CollectionNote(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
      'note_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES note (id)'));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionNoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionNoteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      noteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}note_id'])!,
      collectionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}collection_id'])!,
    );
  }

  @override
  CollectionNote createAlias(String alias) {
    return CollectionNote(attachedDatabase, alias);
  }
}

class CollectionNoteData extends DataClass
    implements Insertable<CollectionNoteData> {
  final int id;
  final int noteId;
  final int collectionId;
  const CollectionNoteData(
      {required this.id, required this.noteId, required this.collectionId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['note_id'] = Variable<int>(noteId);
    map['collection_id'] = Variable<int>(collectionId);
    return map;
  }

  CollectionNoteCompanion toCompanion(bool nullToAbsent) {
    return CollectionNoteCompanion(
      id: Value(id),
      noteId: Value(noteId),
      collectionId: Value(collectionId),
    );
  }

  factory CollectionNoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionNoteData(
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

  CollectionNoteData copyWith({int? id, int? noteId, int? collectionId}) =>
      CollectionNoteData(
        id: id ?? this.id,
        noteId: noteId ?? this.noteId,
        collectionId: collectionId ?? this.collectionId,
      );
  CollectionNoteData copyWithCompanion(CollectionNoteCompanion data) {
    return CollectionNoteData(
      id: data.id.present ? data.id.value : this.id,
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      collectionId: data.collectionId.present
          ? data.collectionId.value
          : this.collectionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionNoteData(')
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
      (other is CollectionNoteData &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.collectionId == this.collectionId);
}

class CollectionNoteCompanion extends UpdateCompanion<CollectionNoteData> {
  final Value<int> id;
  final Value<int> noteId;
  final Value<int> collectionId;
  const CollectionNoteCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.collectionId = const Value.absent(),
  });
  CollectionNoteCompanion.insert({
    this.id = const Value.absent(),
    required int noteId,
    required int collectionId,
  })  : noteId = Value(noteId),
        collectionId = Value(collectionId);
  static Insertable<CollectionNoteData> custom({
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

  CollectionNoteCompanion copyWith(
      {Value<int>? id, Value<int>? noteId, Value<int>? collectionId}) {
    return CollectionNoteCompanion(
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
    return (StringBuffer('CollectionNoteCompanion(')
          ..write('id: $id, ')
          ..write('noteId: $noteId, ')
          ..write('collectionId: $collectionId')
          ..write(')'))
        .toString();
  }
}

class History extends Table with TableInfo<History, HistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  History(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
      'note_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES note (id)'));
  late final GeneratedColumn<int> collectionId = GeneratedColumn<int>(
      'collection_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES collection (id)'));
  late final GeneratedColumn<int> historyType = GeneratedColumn<int>(
      'history_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistoryData(
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
  History createAlias(String alias) {
    return History(attachedDatabase, alias);
  }
}

class HistoryData extends DataClass implements Insertable<HistoryData> {
  final int id;
  final int? noteId;
  final int? collectionId;
  final int historyType;
  final String? content;
  final DateTime createdAt;
  const HistoryData(
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

  HistoryCompanion toCompanion(bool nullToAbsent) {
    return HistoryCompanion(
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

  factory HistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistoryData(
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

  HistoryData copyWith(
          {int? id,
          Value<int?> noteId = const Value.absent(),
          Value<int?> collectionId = const Value.absent(),
          int? historyType,
          Value<String?> content = const Value.absent(),
          DateTime? createdAt}) =>
      HistoryData(
        id: id ?? this.id,
        noteId: noteId.present ? noteId.value : this.noteId,
        collectionId:
            collectionId.present ? collectionId.value : this.collectionId,
        historyType: historyType ?? this.historyType,
        content: content.present ? content.value : this.content,
        createdAt: createdAt ?? this.createdAt,
      );
  HistoryData copyWithCompanion(HistoryCompanion data) {
    return HistoryData(
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
    return (StringBuffer('HistoryData(')
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
      (other is HistoryData &&
          other.id == this.id &&
          other.noteId == this.noteId &&
          other.collectionId == this.collectionId &&
          other.historyType == this.historyType &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class HistoryCompanion extends UpdateCompanion<HistoryData> {
  final Value<int> id;
  final Value<int?> noteId;
  final Value<int?> collectionId;
  final Value<int> historyType;
  final Value<String?> content;
  final Value<DateTime> createdAt;
  const HistoryCompanion({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.collectionId = const Value.absent(),
    this.historyType = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HistoryCompanion.insert({
    this.id = const Value.absent(),
    this.noteId = const Value.absent(),
    this.collectionId = const Value.absent(),
    required int historyType,
    this.content = const Value.absent(),
    required DateTime createdAt,
  })  : historyType = Value(historyType),
        createdAt = Value(createdAt);
  static Insertable<HistoryData> custom({
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

  HistoryCompanion copyWith(
      {Value<int>? id,
      Value<int?>? noteId,
      Value<int?>? collectionId,
      Value<int>? historyType,
      Value<String?>? content,
      Value<DateTime>? createdAt}) {
    return HistoryCompanion(
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
    return (StringBuffer('HistoryCompanion(')
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

class DatabaseAtV1 extends GeneratedDatabase {
  DatabaseAtV1(QueryExecutor e) : super(e);
  late final CollectionMedia collectionMedia = CollectionMedia(this);
  late final Collection collection = Collection(this);
  late final NoteCitation noteCitation = NoteCitation(this);
  late final Note note = Note(this);
  late final CollectionNote collectionNote = CollectionNote(this);
  late final History history = History(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        collectionMedia,
        collection,
        noteCitation,
        note,
        collectionNote,
        history
      ];
  @override
  int get schemaVersion => 1;
}
