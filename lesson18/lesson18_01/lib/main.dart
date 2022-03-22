import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lesson18_01/camera.dart';
import 'package:lesson18_01/gallery.dart';
import 'package:lesson18_01/tab_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Camera widget'),
    );
  }
}

final List<TabItem> _tabBar = [
  TabItem(title: "Camera", icon: const Icon(Icons.camera)),
  TabItem(title: "Gallery", icon: const Icon(Icons.photo)),
];


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  List<XFile> gallery = [];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  Widget getBody( )  {
    if(_currentTabIndex == 0) {
      return Camera(gallery: gallery);
    } else {
      return Gallery(gallery: gallery);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _tabController.index = index;
              _currentTabIndex = index;
            });
          },
          currentIndex: _currentTabIndex,
          items: [
            for (final item in _tabBar)
              BottomNavigationBarItem(
                label: item.title,
                icon: item.icon,
              )
          ]),
    );
  }
}