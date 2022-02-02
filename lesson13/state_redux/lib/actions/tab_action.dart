import 'package:state_redux/actions/abstract_action.dart';
import 'package:state_redux/models/tab_item.dart';

abstract class TabAction extends Action {}

class UpdateTabAction extends TabAction {
  final int newTab;

  UpdateTabAction(this.newTab);
}

class LoadTabBarsAction extends TabAction {
  LoadTabBarsAction();
}

class TabBarsNotLoadedAction extends TabAction {}

class TabBarsLoadedAction extends TabAction {
  final List<TabItem> tabs;

  TabBarsLoadedAction(this.tabs);
}

class ChangeCartLabelAction extends Action {
  ChangeCartLabelAction();
}
