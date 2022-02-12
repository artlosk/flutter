import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomRenderWidget extends SingleChildRenderObjectWidget {

  final Color fontColor;
  final Color shadowColor;
  final double fontSize;
  final String text;

  const CustomRenderWidget({
    required this.fontColor,
    required this.shadowColor,
    required this.fontSize,
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomRenderWidget(fontColor: fontColor, shadowColor: shadowColor, fontSize: fontSize, text: text);
  }
}
class RenderCustomRenderWidget extends RenderProxyBox {
  RenderCustomRenderWidget({
    Color fontColor = Colors.black,
    Color shadowColor = Colors.black,
    String text = '',
    double fontSize = 14,
  }): _fontColor = fontColor, _shadowColor = shadowColor, _fontSize = fontSize, _text = text;

  final Color _fontColor;
  final Color _shadowColor;
  final double _fontSize;
  final String _text;

  @override
  void paint(PaintingContext context, Offset offset) {

    final paragraphStyle = ui.ParagraphStyle(
      fontSize: _fontSize,
      textAlign: TextAlign.center,
    );

    final textStyleMain = ui.TextStyle(
      color: _fontColor,
      fontSize: _fontSize,
      shadows: [BoxShadow(
        blurRadius: 6.0,
        color: _shadowColor,
        offset: Offset(2, 2)
      )]
    );

    final paragraphBuilderMain = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyleMain)
      ..addText(_text);
    final paragraphMain = paragraphBuilderMain.build();
    paragraphMain.layout(ui.ParagraphConstraints(width: size.width));
    context.canvas.drawParagraph(paragraphMain, offset);
  }
}

