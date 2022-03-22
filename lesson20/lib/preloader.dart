import 'package:flutter/material.dart';

class Preloader extends StatelessWidget {
  const Preloader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Loading data'),
          Divider(),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
