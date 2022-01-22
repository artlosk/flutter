import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:layer_data/layer_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layer_model/layer_model.dart';

part 'info_bloc.freezed.dart';

@Injectable()
class InfoBloc {
  final UserService userService;
  final StreamController<InfoBlocEvent> _eventController = StreamController();
  final StreamController<InfoBlocState> _stateController =
      StreamController.broadcast();

  Stream<InfoBlocState> get state => _stateController.stream;

  InfoBloc({required this.userService}) {
    _eventController.stream.listen((event) {
      event.map<void>(
        init: (_) async {
          _stateController.add(
            const InfoBlocState.loading(),
          );
        },
        getUser: (event) async => _stateController.add(
          InfoBlocState.loaded(
            userData: await userService.getUser(event.user),
          ),
        ),
      );
    });
  }

  void add(InfoBlocEvent event) {
    if (_eventController.isClosed) return;
    _eventController.add(event);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}

@freezed
class InfoBlocState with _$InfoBlocState {
  const factory InfoBlocState.loading() = InfoLoadingState;

  const factory InfoBlocState.loaded({required UserData userData}) =
      InfoLoadedState;
}

@freezed
class InfoBlocEvent with _$InfoBlocEvent {
  const factory InfoBlocEvent.init() = _InfoInitEvent;

  const factory InfoBlocEvent.getUser({required UserData user}) = _InfoBlocEvent;
}
