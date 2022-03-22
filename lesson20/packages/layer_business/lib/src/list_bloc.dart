import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:layer_data/layer_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layer_model/layer_model.dart';

part 'list_bloc.freezed.dart';

@Injectable()
class ListBloc {
  final UserService userService;
  final StreamController<ListBlocEvent> _eventController = StreamController();
  final StreamController<ListBlocState> _stateController =
  StreamController.broadcast();

  Stream<ListBlocState> get state => _stateController.stream;

  ListBloc({required this.userService}) {
    _eventController.stream.listen((event) {
      event.map<void>(
          init: (_) async {
            _stateController.add(
              const ListBlocState.loading(),
            );
            _stateController.add(
              ListBlocState.loaded(
                userData: await userService.getListUser('assets/users.json'),
                //userData: await userService.getListUserViaDio(),
              ),
            );
          },
      );
    });
  }

  void add(ListBlocEvent event) {
    if (_eventController.isClosed) return;
    _eventController.add(event);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}

@freezed
class ListBlocState with _$ListBlocState {
  const factory ListBlocState.loading() = ListLoadingState;

  const factory ListBlocState.loaded({required List<UserData> userData}) =
  ListLoadedState;
}

@freezed
class ListBlocEvent with _$ListBlocEvent {
  const factory ListBlocEvent.init() = _ListInitEvent;
}
