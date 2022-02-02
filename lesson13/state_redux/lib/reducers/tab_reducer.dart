import 'package:redux/redux.dart';
import 'package:state_redux/actions/tab_action.dart';
import 'package:state_redux/models/tab_item.dart';

final tabsIndexReducer = combineReducers<int>([
  TypedReducer<int, UpdateTabAction>(_activeTabReducer),
]);

int _activeTabReducer(int activeTab, UpdateTabAction action) {
  return action.newTab;
}

final tabsReducer = combineReducers<List<TabItem>>([
  TypedReducer<List<TabItem>, TabBarsLoadedAction>(_setLoadedTabs),
]);

List<TabItem> _setLoadedTabs(List<TabItem> tabs, TabBarsLoadedAction action) {
  return action.tabs;
}
