import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_mobx/observables/common_observable.dart';
import 'package:state_mobx/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CommonState(),
        )
      ],
      child: MaterialApp(
        title: 'State with mobx',
        home: Observer(
          builder: (context) {
            final state = Provider.of<CommonState>(context);
            if (!state.isLoaded) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Загружаем данные'),
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
