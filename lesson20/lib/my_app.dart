import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:layer_business/layer_business.dart';
import 'package:provider/provider.dart';

import '../stream_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final ListBloc _listBloc;
  late final InfoBloc _infoBloc;

  late TabController _tabController;
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

    _listBloc = GetIt.I.get<ListBloc>();
    _listBloc.add(const ListBlocEvent.init());
    _infoBloc = GetIt.I.get<InfoBloc>();
    _infoBloc.add(const InfoBlocEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ListBloc>(create: (_) => _listBloc),
        Provider<InfoBloc>(create: (_) => _infoBloc),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(),
          body: StreamView(tab: _currentTabIndex,),
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
        ),
      ),
    );
  }

  @override
  void dispose() {
    _listBloc.dispose();
    _infoBloc.dispose();
    super.dispose();
  }
}

class TabItem {
  String title;
  Icon icon;

  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(title: "All List", icon: Icon(Icons.group)),
  TabItem(title: "Only activist", icon: Icon(Icons.accessibility))
];
