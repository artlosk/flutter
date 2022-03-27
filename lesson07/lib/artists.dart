import 'package:flutter/material.dart';
import 'drawer.dart';
import 'router_app.dart';
import 'fetch_file.dart';

class ArtistsPage extends StatefulWidget {
  static String routeName = '/artists';
  ArtistsPage({Key key}) : super(key: key);

  @override
  _ArtistsPageState createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
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
            return Scaffold(
              appBar: AppBar(
                title: Text('Artists'),
              ),
              body: Container(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return GestureDetector(
                            child: Card(
                              margin: const EdgeInsets.all(15),
                              child: Container(
                                color: Colors.blue[100 * (index % 9 + 1)],
                                height: 80,
                                alignment: Alignment.center,
                                child: Text(
                                  snapshot.data[index]['name'],
                                  style: const TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                            onTap: () {
                              RouterApp.router.navigateTo(context,
                                  '/album-info/${snapshot.data[index]['link']}');
                            },
                          );
                        },
                        childCount: snapshot.data.length,
                      ),
                    ),
                  ],
                ),
              ),
              drawer: MyDrawer.generateDrawer(context),
            );
          default:
            return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
