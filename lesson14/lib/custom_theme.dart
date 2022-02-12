import 'package:flutter/material.dart';
import 'package:lesson14/themes.dart';

class _CustomTheme extends InheritedWidget {
  final CustomThemeState data;

  const _CustomTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_CustomTheme oldWidget) {
    return true;
  }
}

class CustomTheme extends StatefulWidget {
  final Widget child;
  final MyThemeKeys initialThemeKey;

  const CustomTheme({
    Key? key,
    required this.initialThemeKey,
    required this.child,
  }) : super(key: key);

  @override
  CustomThemeState createState() => CustomThemeState();

  static ThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<_CustomTheme>();
    assert(result != null, 'No theme found in context');
    return result!.data.theme;
  }

  static CustomThemeState instanceOf(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<_CustomTheme>();
    assert(result != null, 'No theme found in context');
    return result!.data;
  }
}

class CustomThemeState extends State<CustomTheme> {
  late ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  void initState() {
    _theme = MyThemes.getThemeFromKey(widget.initialThemeKey);
    super.initState();
  }

  void changeTheme(MyThemeKeys themeKey) {
    setState(() {
      _theme = MyThemes.getThemeFromKey(themeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CustomTheme(
      data: this,
      child: widget.child,
    );
  }
}