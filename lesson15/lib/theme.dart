import 'package:app_theme/palette.dart';
import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();
ThemeData _themeDark = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  textTheme: _textLight(_themeLight.textTheme),
);
TextTheme _textLight(TextTheme base) {
  return base.copyWith();
}

ThemeData themeDark = _themeDark.copyWith(
  appBarTheme: _appBarDark(_themeDark.appBarTheme),
  textTheme: _textDark(_themeDark.textTheme),
  bottomNavigationBarTheme:
      _bottomNavigationBarDark(_themeDark.bottomNavigationBarTheme),
  buttonTheme: _buttonThemeDark(_themeDark.buttonTheme),
  inputDecorationTheme:
      _inputDecorationThemeDark(_themeDark.inputDecorationTheme),
  cardTheme: _cardThemeDark(_themeDark.cardTheme),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Palette.kToDark,
  ),
  chipTheme: _chipThemeDark(_themeDark.chipTheme),
  dialogTheme: _dialogThemeDark(_themeDark.dialogTheme),
  primaryColorLight: Colors.deepOrange.shade200,
  primaryColorDark: Colors.deepOrange.shade200,
);

DialogTheme _dialogThemeDark(DialogTheme base) {
  return base.copyWith(backgroundColor: Colors.grey.shade500);
}

ChipThemeData _chipThemeDark(ChipThemeData base) {
  return base.copyWith(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    selectedColor: Colors.deepOrange.shade100,
    labelStyle: TextStyle(color: Colors.white),
    shadowColor: Colors.black,
    elevation: 5,
    disabledColor: Colors.black38,
    backgroundColor: Colors.black54,
    checkmarkColor: Colors.deepOrange.shade100,
    //showCheckmark - не работает в ThemeData
  );
}

CardTheme _cardThemeDark(CardTheme base) {
  return base.copyWith(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    color: Colors.deepOrange.shade100,
    shadowColor: Colors.black,
    elevation: 10,
    margin: EdgeInsets.all(10),
  );
}

InputDecorationTheme _inputDecorationThemeDark(InputDecorationTheme base) {
  return base.copyWith(
    suffixIconColor: Colors.deepOrange.shade100,
    focusColor: Colors.deepOrange.shade100,
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.deepOrange.shade100),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.deepOrange.shade100),
    ),
    labelStyle: TextStyle(color: Colors.black54),
    floatingLabelStyle: TextStyle(color: Colors.deepOrange.shade100)
  );
}

AppBarTheme _appBarDark(AppBarTheme base) {
  return base.copyWith(
    color: Colors.black54,
    titleTextStyle: TextStyle(
        color: Colors.deepOrange.shade100,
        fontSize: 20,
        fontWeight: FontWeight.w500),
    actionsIconTheme: IconThemeData(color: Colors.deepOrange.shade100),
  );
}

BottomNavigationBarThemeData _bottomNavigationBarDark(
    BottomNavigationBarThemeData base) {
  return base.copyWith(
    backgroundColor: Colors.black54,
    selectedItemColor: Colors.deepOrange.shade100,
    unselectedItemColor: Colors.black54,
  );
}

TextTheme _textDark(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1.copyWith(color: Colors.black54),
    headline2: base.headline2.copyWith(color: Colors.black54),
    headline3: base.headline3.copyWith(color: Colors.black54),
    headline4: base.headline4.copyWith(color: Colors.black54, fontSize: 22),
    headline5: base.headline5.copyWith(color: Colors.black54),
    headline6: base.headline6.copyWith(color: Colors.black54),
    bodyText1: base.bodyText1.copyWith(color: Colors.black54),
    bodyText2: base.bodyText2.copyWith(color: Colors.black54),
  );
}

ButtonThemeData _buttonThemeDark(ButtonThemeData base) {
  return base.copyWith(
    buttonColor: Colors.deepOrange.shade100,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    ),
  );
}
