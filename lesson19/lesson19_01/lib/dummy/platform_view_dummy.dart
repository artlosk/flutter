import 'package:flutter/material.dart';

class PlatformViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 200,
      child: Text('Platform is not supported'),
    );
  }
}
