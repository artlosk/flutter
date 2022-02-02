import 'package:bloc_custom/actions/abstract_action.dart';

class UpdateTabAction extends Action {
  final int newTab;

  UpdateTabAction(this.newTab);
}
