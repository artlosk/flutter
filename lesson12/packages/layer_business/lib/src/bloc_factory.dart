import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:layer_data/layer_data.dart';

import 'bloc_factory.config.dart';

@InjectableInit()
void initializeBlocs() {
  initializeServices();
  $initGetIt(GetIt.I);
}
