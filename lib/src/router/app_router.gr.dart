// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:flutter_komorebi/src/features/collections/presentation/page/collections_list_page.dart'
    as _i1;
import 'package:flutter_komorebi/src/features/collections/presentation/page/create_page.dart'
    as _i2;
import 'package:flutter_komorebi/src/features/connection/presentation/roam_page.dart'
    as _i9;
import 'package:flutter_komorebi/src/features/history/presentation/page/history_list_page.dart'
    as _i4;
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart'
    as _i14;
import 'package:flutter_komorebi/src/features/home/presentation/page/home_list_page.dart'
    as _i5;
import 'package:flutter_komorebi/src/features/home/presentation/page/home_page.dart'
    as _i6;
import 'package:flutter_komorebi/src/features/notes/presentation/page/note_detail_page.dart'
    as _i7;
import 'package:flutter_komorebi/src/features/notes/presentation/page/note_list_page.dart'
    as _i8;
import 'package:flutter_komorebi/src/features/sample/grid_scale_test_page.dart'
    as _i3;
import 'package:flutter_komorebi/src/features/sample/sample_page.dart' as _i10;
import 'package:flutter_komorebi/src/features/search/presentation/search_page.dart'
    as _i11;

/// generated route for
/// [_i1.CollectionsListPage]
class CollectionsListRoute
    extends _i12.PageRouteInfo<CollectionsListRouteArgs> {
  CollectionsListRoute({
    _i13.Key? key,
    int? collectionId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CollectionsListRoute.name,
          args: CollectionsListRouteArgs(key: key, collectionId: collectionId),
          initialChildren: children,
        );

  static const String name = 'CollectionsListRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionsListRouteArgs>(
        orElse: () => const CollectionsListRouteArgs(),
      );
      return _i1.CollectionsListPage(
        key: args.key,
        collectionId: args.collectionId,
      );
    },
  );
}

class CollectionsListRouteArgs {
  const CollectionsListRouteArgs({this.key, this.collectionId});

  final _i13.Key? key;

  final int? collectionId;

  @override
  String toString() {
    return 'CollectionsListRouteArgs{key: $key, collectionId: $collectionId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CollectionsListRouteArgs) return false;
    return key == other.key && collectionId == other.collectionId;
  }

  @override
  int get hashCode => key.hashCode ^ collectionId.hashCode;
}

/// generated route for
/// [_i2.CreatePage]
class CreateRoute extends _i12.PageRouteInfo<CreateRouteArgs> {
  CreateRoute({
    _i13.Key? key,
    required _i14.EntityType entityType,
    int? collectionId,
    int? noteId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CreateRoute.name,
          args: CreateRouteArgs(
            key: key,
            entityType: entityType,
            collectionId: collectionId,
            noteId: noteId,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateRouteArgs>();
      return _i2.CreatePage(
        key: args.key,
        entityType: args.entityType,
        collectionId: args.collectionId,
        noteId: args.noteId,
      );
    },
  );
}

class CreateRouteArgs {
  const CreateRouteArgs({
    this.key,
    required this.entityType,
    this.collectionId,
    this.noteId,
  });

  final _i13.Key? key;

  final _i14.EntityType entityType;

  final int? collectionId;

  final int? noteId;

  @override
  String toString() {
    return 'CreateRouteArgs{key: $key, entityType: $entityType, collectionId: $collectionId, noteId: $noteId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateRouteArgs) return false;
    return key == other.key &&
        entityType == other.entityType &&
        collectionId == other.collectionId &&
        noteId == other.noteId;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      entityType.hashCode ^
      collectionId.hashCode ^
      noteId.hashCode;
}

/// generated route for
/// [_i3.GridScaleTestPage]
class GridScaleTestRoute extends _i12.PageRouteInfo<void> {
  const GridScaleTestRoute({List<_i12.PageRouteInfo>? children})
      : super(GridScaleTestRoute.name, initialChildren: children);

  static const String name = 'GridScaleTestRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.GridScaleTestPage();
    },
  );
}

/// generated route for
/// [_i4.HistoryListPage]
class HistoryListRoute extends _i12.PageRouteInfo<void> {
  const HistoryListRoute({List<_i12.PageRouteInfo>? children})
      : super(HistoryListRoute.name, initialChildren: children);

  static const String name = 'HistoryListRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.HistoryListPage();
    },
  );
}

/// generated route for
/// [_i5.HomeListPage]
class HomeListRoute extends _i12.PageRouteInfo<HomeListRouteArgs> {
  HomeListRoute({
    _i13.Key? key,
    int? collectionId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomeListRoute.name,
          args: HomeListRouteArgs(key: key, collectionId: collectionId),
          initialChildren: children,
        );

  static const String name = 'HomeListRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeListRouteArgs>(
        orElse: () => const HomeListRouteArgs(),
      );
      return _i5.HomeListPage(key: args.key, collectionId: args.collectionId);
    },
  );
}

class HomeListRouteArgs {
  const HomeListRouteArgs({this.key, this.collectionId});

  final _i13.Key? key;

  final int? collectionId;

  @override
  String toString() {
    return 'HomeListRouteArgs{key: $key, collectionId: $collectionId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeListRouteArgs) return false;
    return key == other.key && collectionId == other.collectionId;
  }

  @override
  int get hashCode => key.hashCode ^ collectionId.hashCode;
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomePage();
    },
  );
}

/// generated route for
/// [_i7.NoteDetailPage]
class NoteDetailRoute extends _i12.PageRouteInfo<NoteDetailRouteArgs> {
  NoteDetailRoute({
    _i13.Key? key,
    required int noteId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          NoteDetailRoute.name,
          args: NoteDetailRouteArgs(key: key, noteId: noteId),
          initialChildren: children,
        );

  static const String name = 'NoteDetailRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteDetailRouteArgs>();
      return _i7.NoteDetailPage(key: args.key, noteId: args.noteId);
    },
  );
}

class NoteDetailRouteArgs {
  const NoteDetailRouteArgs({this.key, required this.noteId});

  final _i13.Key? key;

  final int noteId;

  @override
  String toString() {
    return 'NoteDetailRouteArgs{key: $key, noteId: $noteId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NoteDetailRouteArgs) return false;
    return key == other.key && noteId == other.noteId;
  }

  @override
  int get hashCode => key.hashCode ^ noteId.hashCode;
}

/// generated route for
/// [_i8.NoteListPage]
class NoteListRoute extends _i12.PageRouteInfo<NoteListRouteArgs> {
  NoteListRoute({
    _i13.Key? key,
    int? collectionId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          NoteListRoute.name,
          args: NoteListRouteArgs(key: key, collectionId: collectionId),
          initialChildren: children,
        );

  static const String name = 'NoteListRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteListRouteArgs>(
        orElse: () => const NoteListRouteArgs(),
      );
      return _i8.NoteListPage(key: args.key, collectionId: args.collectionId);
    },
  );
}

class NoteListRouteArgs {
  const NoteListRouteArgs({this.key, this.collectionId});

  final _i13.Key? key;

  final int? collectionId;

  @override
  String toString() {
    return 'NoteListRouteArgs{key: $key, collectionId: $collectionId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NoteListRouteArgs) return false;
    return key == other.key && collectionId == other.collectionId;
  }

  @override
  int get hashCode => key.hashCode ^ collectionId.hashCode;
}

/// generated route for
/// [_i9.RoamPage]
class RoamRoute extends _i12.PageRouteInfo<void> {
  const RoamRoute({List<_i12.PageRouteInfo>? children})
      : super(RoamRoute.name, initialChildren: children);

  static const String name = 'RoamRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.RoamPage();
    },
  );
}

/// generated route for
/// [_i10.SamplePage]
class SampleRoute extends _i12.PageRouteInfo<void> {
  const SampleRoute({List<_i12.PageRouteInfo>? children})
      : super(SampleRoute.name, initialChildren: children);

  static const String name = 'SampleRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.SamplePage();
    },
  );
}

/// generated route for
/// [_i11.SearchPage]
class SearchRoute extends _i12.PageRouteInfo<void> {
  const SearchRoute({List<_i12.PageRouteInfo>? children})
      : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SearchPage();
    },
  );
}
