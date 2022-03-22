import 'package:lesson19_01/service.dart';
import 'package:lesson19_01/web/web_interop.dart';

class PlatformServiceImpl implements PlatformService {
  final _manager = InteropManager();

  @override
  Future<String> getValue() async {
    return _manager.getValueFromJs();
  }

  @override
  Stream<String> getStream() => _manager.buttonClicked;
}