import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class TabItem {
  String title;
  Icon icon;

  TabItem({this.title, this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: "Photo", icon: Icon(Icons.home)),
  TabItem(title: "Chat", icon: Icon(Icons.chat)),
  TabItem(title: "Albums", icon: Icon(Icons.album))
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController _controller;
  bool isVisible = true;
  TabController _tabController;
  int _currentTabIndex = 0;

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

  void closeBottomSheet() {
    if (_controller != null) {
      _controller.close();
      _controller = null;
      setState(() {
        isVisible = true;
      });
    }
  }

  void toggleBottomSheet() {
    isVisible = false;
    if (_controller == null) {
      _controller =
          scaffoldKey.currentState.showBottomSheet((context) => GestureDetector(
                child: Container(
                    color: Colors.purple,
                    height: 200,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 50.0, right: 10.0, bottom: 0),
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Icon(Icons.wallet_giftcard)))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Сумма')))),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text('200 руб'))))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 100)),
                              RaisedButton(
                                  onPressed: () {
                                    closeBottomSheet();
                                  },
                                  child: Text('Оплатить')),
                            ],
                          )
                        ]))),
                onVerticalDragUpdate: (d) {
                  closeBottomSheet();
                },
              ));
    } else {
      closeBottomSheet();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.person),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      drawer: Drawer(
          child: Column(
        children: [
          Expanded(
              flex: 1,
              child: DrawerHeader(
                  child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blueAccent,
                      child: Text('LA')))),
          Expanded(
              flex: 2,
              child: Column(children: [
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  title: Text('Images'),
                  leading: Icon(Icons.image),
                  trailing: Icon(Icons.arrow_forward),
                )
              ])),
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: 120,
                            child: RaisedButton(
                                onPressed: () {}, child: Text('Выход'))),
                        Container(
                            width: 120,
                            child: RaisedButton(
                                onPressed: () {}, child: Text('Регистрация'))),
                      ])))
        ],
      )),
      endDrawer: Drawer(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Container(
                width: 150,
                height: 150,
                child: DrawerHeader(
                    child: CircleAvatar(
                  backgroundColor: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  radius: 10.0,
                  backgroundImage: AssetImage('assets/images/user.png'),
                  // child: Image.asset(
                  //   'assets/images/user.png',
                  //   fit: BoxFit.fill,
                  // )
                ))),
            Container(
                child: Text('It\s your profile image',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.grey)))
          ]))),
      body: TabBarView(controller: _tabController, children: [
        for (final item in _tabBar)
          Container(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: Center(child: Text(item.title)))
      ]

          // Container(
          //   color: Colors.green,
          //   child: Center(child: Text('Photo'))
          // ),
          // Container(
          //     color: Colors.yellow,
          //     child: Center(child: Text('Chat'))
          // ),
          // Container(
          //     color: Colors.purple,
          //     child: Center(child: Text('Albums'))
          // ),
          //],
          ),
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
      floatingActionButton: Opacity(
          opacity: isVisible ? 1 : 0,
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                isVisible = false;
              });
              toggleBottomSheet();
            },
          )),
      // bottomNavigationBar: BottomAppBar(
      //     shape: CircularNotchedRectangle(),
      //     elevation: 20,
      //     notchMargin: 10,
      //     clipBehavior: Clip.antiAlias,
      //     child: Container(
      //         child: BottomNavigationBar(elevation: 8, items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Photo"),
      //       BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
      //       BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Albums")
      //     ]))),
    );
  }
}
