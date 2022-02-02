import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_redux/states/common_state.dart';

class ActiveTab extends StatelessWidget {
  final ViewModelBuilder<int> builder;

  ActiveTab({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CommonState, int>(
      distinct: true,
      converter: (Store<CommonState> store) => store.state.activeTab,
      builder: builder,
    );
  }
}
