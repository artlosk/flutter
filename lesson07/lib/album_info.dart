import 'package:albums_route/fetch_file.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class AlbumInfo extends StatefulWidget {
  static var routeName = '/album-info';
  final link;

  AlbumInfo({Key key, this.link}) : super(key: key);

  @override
  _AlbumInfoState createState() => _AlbumInfoState();
}

class _AlbumInfoState extends State<AlbumInfo> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ReadJsonData('assets/artists.json'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            for (final element in snapshot.data) {
              if (element['link'] == widget.link[0]) {
                return Scaffold(
                    appBar: AppBar(
                      title: Text(element['name']),
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    body: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(element['about']),
                    ),
                    drawer: MyDrawer.generateDrawer(context),
                );
              }
            }
            return Scaffold();
          default:
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
