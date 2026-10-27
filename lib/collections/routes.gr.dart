// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:spotube_demo/models/track.dart' as _i8;
import 'package:spotube_demo/pages/favorites_page.dart' as _i1;
import 'package:spotube_demo/pages/home_page.dart' as _i2;
import 'package:spotube_demo/pages/root_page.dart' as _i3;
import 'package:spotube_demo/pages/search_page.dart' as _i4;
import 'package:spotube_demo/pages/track_detail_page.dart' as _i5;

/// generated route for
/// [_i1.FavoritesPage]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute({List<_i6.PageRouteInfo>? children})
    : super(FavoritesRoute.name, initialChildren: children);

  static const String name = 'FavoritesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.FavoritesPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.RootPage]
class RootRoute extends _i6.PageRouteInfo<void> {
  const RootRoute({List<_i6.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.RootPage();
    },
  );
}

/// generated route for
/// [_i4.SearchPage]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute({List<_i6.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SearchPage();
    },
  );
}

/// generated route for
/// [_i5.TrackDetailPage]
class TrackDetailRoute extends _i6.PageRouteInfo<TrackDetailRouteArgs> {
  TrackDetailRoute({
    _i7.Key? key,
    required _i8.Track track,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         TrackDetailRoute.name,
         args: TrackDetailRouteArgs(key: key, track: track),
         initialChildren: children,
       );

  static const String name = 'TrackDetailRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TrackDetailRouteArgs>();
      return _i5.TrackDetailPage(key: args.key, track: args.track);
    },
  );
}

class TrackDetailRouteArgs {
  const TrackDetailRouteArgs({this.key, required this.track});

  final _i7.Key? key;

  final _i8.Track track;

  @override
  String toString() {
    return 'TrackDetailRouteArgs{key: $key, track: $track}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TrackDetailRouteArgs) return false;
    return key == other.key && track == other.track;
  }

  @override
  int get hashCode => key.hashCode ^ track.hashCode;
}
