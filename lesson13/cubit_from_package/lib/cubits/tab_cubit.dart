import 'package:cubit_from_package/states/tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabState());

  void updateTab(int newTab) {
    emit(state.copyWith(activeTabIndex: newTab));
  }
}
