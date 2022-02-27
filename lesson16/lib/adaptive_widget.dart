import 'package:flutter/material.dart';
import 'package:lesson16/platforms.dart';

class AdaptiveWidget extends StatelessWidget {
  final Widget? narrow;
  final Widget? wide;

  const AdaptiveWidget({Key? key, this.narrow, this.wide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 720 && wide != null) {
      return wide!;
    }

    if (width <= 720 && narrow != null) {
      return narrow!;
    }

    throw Exception('Not selected layout');
  }
}
