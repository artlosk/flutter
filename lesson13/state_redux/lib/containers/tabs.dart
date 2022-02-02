import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_redux/models/tab_item.dart';
import 'package:state_redux/states/common_state.dart';

class Tabs extends StatelessWidget {
  final ViewModelBuilder<List<TabItem>> builder;

  Tabs({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CommonState, List<TabItem>>(
      distinct: true,
      converter: (Store<CommonState> store) => store.state.tabs,
      builder: builder,
    );
  }
}
