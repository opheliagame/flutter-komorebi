// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_komorebi/src/drift/database.dart' as _i7;
import 'package:flutter_komorebi/src/features/collections/presentation/collections_list_page.dart'
    as _i1;
import 'package:flutter_komorebi/src/features/collections/presentation/create_page.dart'
    as _i2;
import 'package:flutter_komorebi/src/features/home/presentation/home_list_page.dart'
    as _i3;
import 'package:flutter_komorebi/src/features/home/presentation/home_page.dart'
    as _i4;

/// generated route for
/// [_i1.CollectionsListPage]
class CollectionsListRoute extends _i5.PageRouteInfo<CollectionsListRouteArgs> {
  CollectionsListRoute({
    _i6.Key? key,
    _i7.Collection? collection,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         CollectionsListRoute.name,
         args: CollectionsListRouteArgs(key: key, collection: collection),
         initialChildren: children,
       );

  static const String name = 'CollectionsListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionsListRouteArgs>(
        orElse: () => const CollectionsListRouteArgs(),
      );
      return _i1.CollectionsListPage(
        key: args.key,
        collection: args.collection,
      );
    },
  );
}

class CollectionsListRouteArgs {
  const CollectionsListRouteArgs({this.key, this.collection});

  final _i6.Key? key;

  final _i7.Collection? collection;

  @override
  String toString() {
    return 'CollectionsListRouteArgs{key: $key, collection: $collection}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CollectionsListRouteArgs) return false;
    return key == other.key && collection == other.collection;
  }

  @override
  int get hashCode => key.hashCode ^ collection.hashCode;
}

/// generated route for
/// [_i2.CreatePage]
class CreateRoute extends _i5.PageRouteInfo<CreateRouteArgs> {
  CreateRoute({
    _i6.Key? key,
    required int? collectionId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         CreateRoute.name,
         args: CreateRouteArgs(key: key, collectionId: collectionId),
         initialChildren: children,
       );

  static const String name = 'CreateRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateRouteArgs>();
      return _i2.CreatePage(key: args.key, collectionId: args.collectionId);
    },
  );
}

class CreateRouteArgs {
  const CreateRouteArgs({this.key, required this.collectionId});

  final _i6.Key? key;

  final int? collectionId;

  @override
  String toString() {
    return 'CreateRouteArgs{key: $key, collectionId: $collectionId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateRouteArgs) return false;
    return key == other.key && collectionId == other.collectionId;
  }

  @override
  int get hashCode => key.hashCode ^ collectionId.hashCode;
}

/// generated route for
/// [_i3.HomeListPage]
class HomeListRoute extends _i5.PageRouteInfo<HomeListRouteArgs> {
  HomeListRoute({
    _i6.Key? key,
    _i7.Collection? collection,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         HomeListRoute.name,
         args: HomeListRouteArgs(key: key, collection: collection),
         initialChildren: children,
       );

  static const String name = 'HomeListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeListRouteArgs>(
        orElse: () => const HomeListRouteArgs(),
      );
      return _i3.HomeListPage(key: args.key, collection: args.collection);
    },
  );
}

class HomeListRouteArgs {
  const HomeListRouteArgs({this.key, this.collection});

  final _i6.Key? key;

  final _i7.Collection? collection;

  @override
  String toString() {
    return 'HomeListRouteArgs{key: $key, collection: $collection}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeListRouteArgs) return false;
    return key == other.key && collection == other.collection;
  }

  @override
  int get hashCode => key.hashCode ^ collection.hashCode;
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}
