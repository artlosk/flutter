import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:state_redux/actions/tab_action.dart';
import 'package:state_redux/models/tab_item.dart';
import 'package:state_redux/states/common_state.dart';

class BottomNavigateContainer extends StatelessWidget {
  BottomNavigateContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CommonState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return BottomNavigationBar(
          currentIndex: vm.activeTab,
          onTap: vm.onTabSelected,
          items: [
            for (final item in vm.tabs)
              BottomNavigationBarItem(
                label: item.title,
                icon: item.icon,
              ),
          ],
        );
      },
    );
  }
}

class _ViewModel {
  final List<TabItem> tabs;
  final bool loading;
  final int activeTab;
  final Function(int) onTabSelected;

  _ViewModel({
    required this.tabs,
    required this.loading,
    required this.activeTab,
    required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<CommonState> store) {
    return _ViewModel(
      tabs: store.state.tabs,
      loading: store.state.isLoading,
      activeTab: store.state.activeTab,
      onTabSelected: (index) {
        store.dispatch(UpdateTabAction((index)));
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          activeTab == other.activeTab;

  @override
  int get hashCode => activeTab.hashCode;
}
