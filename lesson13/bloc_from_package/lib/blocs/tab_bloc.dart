import 'dart:async';

import 'package:bloc_from_package/actions/abstract_action.dart';
import 'package:bloc_from_package/actions/tab_action.dart';
import 'package:bloc_from_package/states/tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBloc extends Bloc<Action, TabState> {
  TabBloc() : super(TabState());

  @override
  Stream<TabState> mapEventToState(Action event) async* {
    if (event is UpdateTabAction) {
      yield state.copyWith(activeTabIndex: event.newTab);
    }
  }
}
