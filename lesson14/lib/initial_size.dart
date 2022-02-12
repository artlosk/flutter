import 'package:flutter/material.dart';
import 'package:lesson14/home_screen.dart';

class InitialSize extends StatelessWidget {
  const InitialSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen(globalSize: MediaQuery.of(context).size.width);
  }
}
