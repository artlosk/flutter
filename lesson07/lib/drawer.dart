import 'package:flutter/material.dart';
import 'router_app.dart';

class MyDrawer {

  static String _currentSelected = '/';

  static final List<Map<String, dynamic>> _menuDrawer = [
    {
      'name': 'Home',
      'icon': Icons.home,
      'route': '/'
    },
    {
      'name': 'Artists',
      'icon': Icons.disc_full,
      'route': '/artists'
    }
  ];

  static Drawer generateDrawer(BuildContext context) {

    return Drawer(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 150,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Collection music'),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network('https://picsum.photos/500/800',
                          fit: BoxFit.fill),
                      Opacity(
                        opacity: .7,
                        child: Container(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    for(final element in _menuDrawer)
                    ListTile(
                      title: Text(element['name']),
                      leading: Icon(element['icon']),
                      trailing: Icon(Icons.arrow_forward),
                      textColor: _currentSelected == element['route'] ? Colors.deepPurple : Colors.black,
                      iconColor: _currentSelected == element['route'] ? Colors.deepPurple : Colors.black,
                      onTap: () {
                        _currentSelected = element['route'];
                        print(_currentSelected);
                        RouterApp.router.navigateTo(context, element['route']);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}