// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/foundation.dart' as _i17;
import 'package:flutter/material.dart' as _i18;
import 'package:flutter_komorebi/src/features/collections/presentation/page/collections_list_page.dart'
    as _i2;
import 'package:flutter_komorebi/src/features/collections/presentation/page/create_page.dart'
    as _i4;
import 'package:flutter_komorebi/src/features/connection/presentation/roam_page.dart'
    as _i13;
import 'package:flutter_komorebi/src/features/history/presentation/page/history_list_page.dart'
    as _i6;
import 'package:flutter_komorebi/src/features/home/domain/entity_type.dart'
    as _i19;
import 'package:flutter_komorebi/src/features/home/presentation/page/collection_list_page.dart'
    as _i1;
import 'package:flutter_komorebi/src/features/home/presentation/page/home_page.dart'
    as _i7;
import 'package:flutter_komorebi/src/features/home/presentation/page/main_tab_page.dart'
    as _i9;
import 'package:flutter_komorebi/src/features/notes/presentation/page/note_detail_page.dart'
    as _i10;
import 'package:flutter_komorebi/src/features/notes/presentation/page/note_list_page.dart'
    as _i11;
import 'package:flutter_komorebi/src/features/sample/connection_diagram_page.dart'
    as _i3;
import 'package:flutter_komorebi/src/features/sample/grid_scale_test_page.dart'
    as _i5;
import 'package:flutter_komorebi/src/features/sample/image_clipboard.dart'
    as _i8;
import 'package:flutter_komorebi/src/features/sample/recents_page.dart' as _i12;
import 'package:flutter_komorebi/src/features/sample/sample_page.dart' as _i14;
import 'package:flutter_komorebi/src/features/search/presentation/search_page.dart'
    as _i15;

/// generated route for
/// [_i1.CollectionListPage]
class CollectionListRoute extends _i16.PageRouteInfo<CollectionListRouteArgs> {
  CollectionListRoute({
    _i17.Key? key,
    required int collectionId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CollectionListRoute.name,
          args: CollectionListRouteArgs(key: key, collectionId: collectionId),
          initialChildren: children,
        );

  static const String name = 'CollectionListRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionListRouteArgs>();
      return _i1.CollectionListPage(
        key: args.key,
        collectionId: args.collectionId,
      );
    },
  );
}

class CollectionListRouteArgs {
  const CollectionListRouteArgs({this.key, required this.collectionId});

  final _i17.Key? key;

  final int collectionId;

  @override
  String toString() {
    return 'CollectionListRouteArgs{key: $key, collectionId: $collectionId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CollectionListRouteArgs) return false;
    return key == other.key && collectionId == other.collectionId;
  }

  @override
  int get hashCode => key.hashCode ^ collectionId.hashCode;
}

/// generated route for
/// [_i2.CollectionsListPage]
class CollectionsListRoute
    extends _i16.PageRouteInfo<CollectionsListRouteArgs> {
  CollectionsListRoute({
    _i18.Key? key,
    int? collectionId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CollectionsListRoute.name,
          args: CollectionsListRouteArgs(key: key, collectionId: collectionId),
          initialChildren: children,
        );

  static const String name = 'CollectionsListRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionsListRouteArgs>(
        orElse: () => const CollectionsListRouteArgs(),
      );
      return _i2.CollectionsListPage(
        key: args.key,
        collectionId: args.collectionId,
      );
    },
  );
}

class CollectionsListRouteArgs {
  const CollectionsListRouteArgs({this.key, this.collectionId});

  final _i18.Key? key;

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
/// [_i3.ConnectionDiagramPage]
class ConnectionDiagramRoute extends _i16.PageRouteInfo<void> {
  const ConnectionDiagramRoute({List<_i16.PageRouteInfo>? children})
      : super(ConnectionDiagramRoute.name, initialChildren: children);

  static const String name = 'ConnectionDiagramRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.ConnectionDiagramPage();
    },
  );
}

/// generated route for
/// [_i4.CreatePage]
class CreateRoute extends _i16.PageRouteInfo<CreateRouteArgs> {
  CreateRoute({
    _i18.Key? key,
    required _i19.EntityType entityType,
    int? collectionId,
    int? noteId,
    List<_i16.PageRouteInfo>? children,
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

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateRouteArgs>();
      return _i4.CreatePage(
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

  final _i18.Key? key;

  final _i19.EntityType entityType;

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
/// [_i5.GridScaleTestPage]
class GridScaleTestRoute extends _i16.PageRouteInfo<GridScaleTestRouteArgs> {
  GridScaleTestRoute({
    _i18.Key? key,
    required bool isCollectionGrid,
    int? collectionId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          GridScaleTestRoute.name,
          args: GridScaleTestRouteArgs(
            key: key,
            isCollectionGrid: isCollectionGrid,
            collectionId: collectionId,
          ),
          initialChildren: children,
        );

  static const String name = 'GridScaleTestRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GridScaleTestRouteArgs>();
      return _i5.GridScaleTestPage(
        key: args.key,
        isCollectionGrid: args.isCollectionGrid,
        collectionId: args.collectionId,
      );
    },
  );
}

class GridScaleTestRouteArgs {
  const GridScaleTestRouteArgs({
    this.key,
    required this.isCollectionGrid,
    this.collectionId,
  });

  final _i18.Key? key;

  final bool isCollectionGrid;

  final int? collectionId;

  @override
  String toString() {
    return 'GridScaleTestRouteArgs{key: $key, isCollectionGrid: $isCollectionGrid, collectionId: $collectionId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GridScaleTestRouteArgs) return false;
    return key == other.key &&
        isCollectionGrid == other.isCollectionGrid &&
        collectionId == other.collectionId;
  }

  @override
  int get hashCode =>
      key.hashCode ^ isCollectionGrid.hashCode ^ collectionId.hashCode;
}

/// generated route for
/// [_i6.HistoryListPage]
class HistoryListRoute extends _i16.PageRouteInfo<void> {
  const HistoryListRoute({List<_i16.PageRouteInfo>? children})
      : super(HistoryListRoute.name, initialChildren: children);

  static const String name = 'HistoryListRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.HistoryListPage();
    },
  );
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomePage();
    },
  );
}

/// generated route for
/// [_i8.ImageClipboardSamplePage]
class ImageClipboardSampleRoute
    extends _i16.PageRouteInfo<ImageClipboardSampleRouteArgs> {
  ImageClipboardSampleRoute({
    _i18.Key? key,
    required bool isDebug,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ImageClipboardSampleRoute.name,
          args: ImageClipboardSampleRouteArgs(key: key, isDebug: isDebug),
          initialChildren: children,
        );

  static const String name = 'ImageClipboardSampleRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ImageClipboardSampleRouteArgs>();
      return _i8.ImageClipboardSamplePage(key: args.key, isDebug: args.isDebug);
    },
  );
}

class ImageClipboardSampleRouteArgs {
  const ImageClipboardSampleRouteArgs({this.key, required this.isDebug});

  final _i18.Key? key;

  final bool isDebug;

  @override
  String toString() {
    return 'ImageClipboardSampleRouteArgs{key: $key, isDebug: $isDebug}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ImageClipboardSampleRouteArgs) return false;
    return key == other.key && isDebug == other.isDebug;
  }

  @override
  int get hashCode => key.hashCode ^ isDebug.hashCode;
}

/// generated route for
/// [_i9.MainTabPage]
class MainTabRoute extends _i16.PageRouteInfo<void> {
  const MainTabRoute({List<_i16.PageRouteInfo>? children})
      : super(MainTabRoute.name, initialChildren: children);

  static const String name = 'MainTabRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.MainTabPage();
    },
  );
}

/// generated route for
/// [_i10.NoteDetailPage]
class NoteDetailRoute extends _i16.PageRouteInfo<NoteDetailRouteArgs> {
  NoteDetailRoute({
    _i18.Key? key,
    required int noteId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          NoteDetailRoute.name,
          args: NoteDetailRouteArgs(key: key, noteId: noteId),
          initialChildren: children,
        );

  static const String name = 'NoteDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteDetailRouteArgs>();
      return _i10.NoteDetailPage(key: args.key, noteId: args.noteId);
    },
  );
}

class NoteDetailRouteArgs {
  const NoteDetailRouteArgs({this.key, required this.noteId});

  final _i18.Key? key;

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
/// [_i11.NoteListPage]
class NoteListRoute extends _i16.PageRouteInfo<NoteListRouteArgs> {
  NoteListRoute({
    _i18.Key? key,
    required int collectionId,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          NoteListRoute.name,
          args: NoteListRouteArgs(key: key, collectionId: collectionId),
          initialChildren: children,
        );

  static const String name = 'NoteListRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteListRouteArgs>();
      return _i11.NoteListPage(key: args.key, collectionId: args.collectionId);
    },
  );
}

class NoteListRouteArgs {
  const NoteListRouteArgs({this.key, required this.collectionId});

  final _i18.Key? key;

  final int collectionId;

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
/// [_i12.RecentsPage]
class RecentsRoute extends _i16.PageRouteInfo<void> {
  const RecentsRoute({List<_i16.PageRouteInfo>? children})
      : super(RecentsRoute.name, initialChildren: children);

  static const String name = 'RecentsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.RecentsPage();
    },
  );
}

/// generated route for
/// [_i13.RoamPage]
class RoamRoute extends _i16.PageRouteInfo<void> {
  const RoamRoute({List<_i16.PageRouteInfo>? children})
      : super(RoamRoute.name, initialChildren: children);

  static const String name = 'RoamRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.RoamPage();
    },
  );
}

/// generated route for
/// [_i14.SamplePage]
class SampleRoute extends _i16.PageRouteInfo<void> {
  const SampleRoute({List<_i16.PageRouteInfo>? children})
      : super(SampleRoute.name, initialChildren: children);

  static const String name = 'SampleRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.SamplePage();
    },
  );
}

/// generated route for
/// [_i15.SearchPage]
class SearchRoute extends _i16.PageRouteInfo<void> {
  const SearchRoute({List<_i16.PageRouteInfo>? children})
      : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.SearchPage();
    },
  );
}
