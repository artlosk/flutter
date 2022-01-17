import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';

void main() {
  testWidgets('Register Form for empty fields', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(
            home: LoginView()
        )
    );

    await tester.tap(find.byKey(Key('btnSwitch')));
    await tester.pump();

    expect(find.byKey(Key('fieldFirstname')), findsOneWidget);
    expect(find.byKey(Key('fieldLastname')), findsOneWidget);
    expect(find.byKey(Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(Key('fieldPhone')), findsOneWidget);
    expect(find.text('Отправить'), findsOneWidget);
    expect(find.text('Вы успешно зарегистрировались'), findsNothing);

    await tester.enterText(find.byKey(Key('fieldFirstname')), '');
    await tester.enterText(find.byKey(Key('fieldLastname')), '');
    await tester.enterText(find.byKey(Key('fieldEmail')), '');
    await tester.enterText(find.byKey(Key('fieldPhone')), '');
    await tester.tap(find.text('Отправить'));
    await tester.pump();
    expect(find.text('Введите имя'), findsOneWidget);
    expect(find.text('Введите фамилию'), findsOneWidget);
    expect(find.text('Заполните поле email'), findsOneWidget);
    expect(find.text('Заполните поле телефон'), findsOneWidget);
    expect(find.text('Добро пожаловать'), findsNothing);

  });

  testWidgets('Register Form for incorrect email fields', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(
            home: LoginView()
        )
    );

    await tester.tap(find.byKey(Key('btnSwitch')));
    await tester.pump();

    expect(find.byKey(Key('fieldFirstname')), findsOneWidget);
    expect(find.byKey(Key('fieldLastname')), findsOneWidget);
    expect(find.byKey(Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(Key('fieldPhone')), findsOneWidget);
    expect(find.text('Отправить'), findsOneWidget);
    expect(find.text('Вы успешно зарегистрировались'), findsNothing);

    await tester.enterText(find.byKey(Key('fieldFirstname')), 'Ivan');
    await tester.enterText(find.byKey(Key('fieldLastname')), 'Ivanov');
    await tester.enterText(find.byKey(Key('fieldEmail')), 'test@test');
    await tester.enterText(find.byKey(Key('fieldPhone')), '89265004030');
    await tester.tap(find.text('Отправить'));
    await tester.pump();
    expect(find.text('Ivan'), findsOneWidget);
    expect(find.text('Ivanov'), findsOneWidget);
    expect(find.text('Емейл не корректный'), findsOneWidget);
    expect(find.text('89265004030'), findsOneWidget);
    expect(find.text('Вы успешно зарегистрировались'), findsNothing);

  });

  testWidgets('Register Form for correct fields', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(
            home: LoginView()
        )
    );

    await tester.tap(find.byKey(Key('btnSwitch')));
    await tester.pump();

    expect(find.byKey(Key('fieldFirstname')), findsOneWidget);
    expect(find.byKey(Key('fieldLastname')), findsOneWidget);
    expect(find.byKey(Key('fieldEmail')), findsOneWidget);
    expect(find.byKey(Key('fieldPhone')), findsOneWidget);
    expect(find.text('Отправить'), findsOneWidget);
    expect(find.text('Вы успешно зарегистрировались'), findsNothing);

    await tester.enterText(find.byKey(Key('fieldFirstname')), 'Ivan');
    await tester.enterText(find.byKey(Key('fieldLastname')), 'Ivanov');
    await tester.enterText(find.byKey(Key('fieldEmail')), 'test@test.ru');
    await tester.enterText(find.byKey(Key('fieldPhone')), '89265004030');
    await tester.tap(find.text('Отправить'));
    await tester.pump();
    expect(find.text('Ivan'), findsOneWidget);
    expect(find.text('Ivanov'), findsOneWidget);
    expect(find.text('test@test.ru'), findsOneWidget);
    expect(find.text('89265004030'), findsOneWidget);
    expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);

  });
}