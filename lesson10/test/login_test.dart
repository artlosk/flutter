import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';

void main() {
  testWidgets('Login Form for empty fields', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(
            home: LoginView()
        )
    );

    expect(find.byKey(Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(Key('fieldPhone')), findsOneWidget);
    expect(find.text('Отправить'), findsOneWidget);
    expect(find.text('Добро пожаловать'), findsNothing);

    await tester.enterText(find.byKey(Key('fieldEmail')), '');
    await tester.enterText(find.byKey(Key('fieldPhone')), '');
    await tester.tap(find.text('Отправить'));
    await tester.pump();
    expect(find.text('Введите email'), findsOneWidget);
    expect(find.text('Введите телефон'), findsOneWidget);
    expect(find.text('Добро пожаловать'), findsNothing);

  });

  testWidgets('Login Form for incorrect Email', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(
            home: LoginView()
        )
    );

    expect(find.byKey(Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(Key('fieldPhone')), findsOneWidget);
    expect(find.text('Отправить'), findsOneWidget);
    expect(find.text('Добро пожаловать'), findsNothing);

    await tester.enterText(find.byKey(Key('fieldEmail')), 'test@test');
    await tester.enterText(find.byKey(Key('fieldPhone')), '89265004030');
    await tester.tap(find.text('Отправить'));
    await tester.pump();
    expect(find.text('Поле email заполнено не корректно'), findsOneWidget);
    expect(find.text('Добро пожаловать'), findsNothing);

  });

  testWidgets('Login test widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginView()
      )
    );

    expect(find.byKey(Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(Key('fieldPhone')), findsOneWidget);
    expect(find.text('Отправить'), findsOneWidget);
    expect(find.text('Добро пожаловать'), findsNothing);

    await tester.enterText(find.byKey(Key('fieldEmail')), 'test@test.ru');
    expect(find.text('test@test.ru'), findsOneWidget);
    await tester.enterText(find.byKey(Key('fieldPhone')), '89265004030');
    expect(find.text('89265004030'), findsOneWidget);
    await tester.tap(find.text('Отправить'));
    await tester.pump();
    expect(find.text('Добро пожаловать'), findsOneWidget);

  });
}