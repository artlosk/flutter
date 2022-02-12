import 'package:flutter/material.dart';
import 'package:lesson14/paints/cloud.dart';
import 'package:lesson14/paints/rain.dart';
import 'package:lesson14/paints/sun.dart';

import 'custom_render_widget.dart';

class WeatherIndicator extends StatelessWidget {
  final double opacity;
  final bool indicatorText;
  final double size;
  final String weatherText;

  const WeatherIndicator(
      {Key? key,
        this.opacity = 1,
        this.size = 100,
        this.indicatorText = false,
        this.weatherText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: CustomPaint(
            painter: Sun(opacity: opacity),
            child: SizedBox(
              height: size,
              width: size,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 0,
          child: CustomPaint(
            painter: Cloud(opacity: opacity),
            child: SizedBox(
              height: size,
              width: size,
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 0,
          child: CustomPaint(
            painter: Rain(opacity: opacity),
            child: SizedBox(
              height: size,
              width: size,
            ),
          ),
        ),
        Positioned(
          top: 360,
          width: MediaQuery.of(context).size.width,
          child: CustomRenderWidget(
            fontColor: Theme.of(context).canvasColor,
            shadowColor: Theme.of(context).shadowColor,
            fontSize: 30,
            text: weatherText,
          ),
        ),
        if (indicatorText)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Text(
                opacity.toStringAsFixed(2),
                style: const TextStyle(fontSize: 26),
              ),
            ),
          )
      ],
    );
  }
}
