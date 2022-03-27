import 'package:albums_route/album_info.dart';

import 'main.dart';
import 'artists.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouterApp {
  static final FluroRouter router = FluroRouter();

  static Handler _homeHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MyHomePage();
  });

  static Handler _artistsHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ArtistsPage();
  });

  static Handler _albumInfoHandler =
  Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    if (params.containsKey('link')) {
      return AlbumInfo(link: params['link']);
    }
    return ArtistsPage();
  });

  static void setupRouter() {
    router.define(MyHomePage.routeName, handler: _homeHandler);
    router.define(ArtistsPage.routeName, handler: _artistsHandler);
    router.define('${AlbumInfo.routeName}/:link', handler: _albumInfoHandler);
  }
}
