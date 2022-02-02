import 'package:state_redux/containers/active_tab.dart';
import 'package:state_redux/containers/home_container.dart';
import 'package:flutter/material.dart';
import 'package:state_redux/containers/tabs.dart';
import 'package:state_redux/models/tab_item.dart';

class HomeScreen extends StatefulWidget {
  final void Function() onInit;

  HomeScreen({
    required this.onInit,
    Key? key,
  });

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Tabs(
      builder: (BuildContext context, List<TabItem> tabs) {
        return ActiveTab(builder: (BuildContext context, int activeTab) {
          return HomeContainer();
        });
      },
    );
  }
}
