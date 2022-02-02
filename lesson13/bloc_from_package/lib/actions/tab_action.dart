import 'package:bloc_from_package/actions/abstract_action.dart';

class UpdateTabAction extends Action {
  final int newTab;

  UpdateTabAction(this.newTab);
}
