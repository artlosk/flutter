// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final fieldFinderPhone = find.byValueKey('fieldPhone');
    final fieldFinderBtnSubmit = find.text('Отправить');
    final notifyText = find.text('Добро пожаловать');
    final errorTextEmail = find.text('Поле email заполнено не корректно');
    final errorTextEmailEmpty = find.text('Введите email');
    final errorTextPhoneEmpty = find.text('Введите телефон');

    test('Test field empty Email', () async {
      await driver.tap(fieldFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('');
    });

    test('Test field empty Phone', () async {
      await driver.tap(fieldFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('');
    });

    test('Test tap submit', () async {
      await driver.tap(fieldFinderBtnSubmit);
    });

    test('Test Error empty messages', () async {
      expect(await driver.getText(errorTextEmailEmpty), 'Введите email');
      expect(await driver.getText(errorTextPhoneEmpty), 'Введите телефон');
    });

    test('Test field Email', () async {
      await driver.tap(fieldFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test');
      await driver.waitFor(find.text('test@test'));
    });

    test('Test tap submit', () async {
      await driver.tap(fieldFinderBtnSubmit);
    });

    test('Test Error', () async {
      expect(await driver.getText(errorTextEmail), 'Поле email заполнено не корректно');
    });

    test('Test field Email', () async {
      await driver.tap(fieldFinderEmail);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.ru');
      await driver.waitFor(find.text('test@test.ru'));
    });

    test('Test field Phone', () async {
      await driver.tap(fieldFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('89265004030');
      await driver.waitFor(find.text('89265004030'));
    });

    test('Test tap submit', () async {
      await driver.tap(fieldFinderBtnSubmit);
    });

    test('Test Notify success', () async {
      expect(await driver.getText(notifyText), 'Добро пожаловать');
    });

  });

  group('Switch to registration', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final btnSwitch = find.byValueKey('btnSwitch');

    test('Tap button', () async {
        await driver.tap(btnSwitch);
        expect(await driver.getText(find.text('Регистрация')), 'Регистрация');
    });

  });

  group('Register form tests empty fields', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final fieldFinderFirstname = find.byValueKey('fieldFirstname');
    final textFinderFirstname = find.text('Введите имя');

    final fieldFinderLastname = find.byValueKey('fieldLastname');
    final textFinderLastname = find.text('Введите фамилию');

    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final textFinderEmail = find.text('Заполните поле email');

    final fieldFinderPhone = find.byValueKey('fieldPhone');
    final textFinderPhone = find.text('Заполните поле телефон');

    final textBtnSubmit = find.text('Отправить');

    test('Test field empty Firstname', () async {
      await driver.tap(fieldFinderFirstname);
      await driver.waitFor(find.text(''));
      await driver.enterText('');
    });

    test('Test field empty Lastname', () async {
      await driver.tap(fieldFinderLastname);
      await driver.waitFor(find.text(''));
      await driver.enterText('');
    });

    test('Test field empty Email', () async {
      await driver.tap(fieldFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('');
    });

    test('Test field empty Phone', () async {
      await driver.tap(fieldFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('');
    });

    test('Test tap submit', () async {
      await driver.tap(textBtnSubmit);
    });

    test('Test Error empty messages', () async {
      expect(await driver.getText(textFinderFirstname), 'Введите имя');
      expect(await driver.getText(textFinderLastname), 'Введите фамилию');
      expect(await driver.getText(textFinderEmail), 'Заполните поле email');
      expect(await driver.getText(textFinderPhone), 'Заполните поле телефон');
    });

  });

  group('Register form tests incorrect fields', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final fieldFinderFirstname = find.byValueKey('fieldFirstname');

    final fieldFinderLastname = find.byValueKey('fieldLastname');

    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final textFinderEmail = find.text('Емейл не корректный');

    final fieldFinderPhone = find.byValueKey('fieldPhone');

    final textBtnSubmit = find.text('Отправить');
    final successText = find.text('Вы успешно зарегистрировались');

    test('Test field Firstname', () async {
      await driver.tap(fieldFinderFirstname);
      await driver.waitFor(find.text(''));
      await driver.enterText('Ivan');
      await driver.waitFor(find.text('Ivan'));
    });

    test('Test field Lastname', () async {
      await driver.tap(fieldFinderLastname);
      await driver.waitFor(find.text(''));
      await driver.enterText('Ivanov');
      await driver.waitFor(find.text('Ivanov'));
    });

    test('Test field incorrect Email', () async {
      await driver.tap(fieldFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('aaaa@aaaa');
      await driver.waitFor(find.text('aaaa@aaaa'));
    });

    test('Test field Phone', () async {
      await driver.tap(fieldFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('89265004030');
    });

    test('Test tap submit', () async {
      await driver.tap(textBtnSubmit);
    });

    test('Test Error messages', () async {
      expect(await driver.getText(textFinderEmail), 'Емейл не корректный');
    });

    // test('Test Form not send', () async {
    //   expect(await driver.getText(successText), false);
    // });

  });

  group('Register form tests correct fields', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final fieldFinderFirstname = find.byValueKey('fieldFirstname');
    final fieldFinderLastname = find.byValueKey('fieldLastname');
    final fieldFinderEmail = find.byValueKey('fieldEmail');
    final fieldFinderPhone = find.byValueKey('fieldPhone');
    final textBtnSubmit = find.text('Отправить');
    final successText = find.text('Вы успешно зарегистрировались');

    test('Test field Firstname', () async {
      await driver.tap(fieldFinderFirstname);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.enterText('Ivan');
      await driver.waitFor(find.text('Ivan'));
    });

    test('Test field Lastname', () async {
      await driver.tap(fieldFinderLastname);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.enterText('Ivanov');
      await driver.waitFor(find.text('Ivanov'));
    });

    test('Test field Email', () async {
      await driver.tap(fieldFinderEmail);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.enterText('aaaa@aaaa.ru');
      await driver.waitFor(find.text('aaaa@aaaa.ru'));
    });

    test('Test field Phone', () async {
      await driver.tap(fieldFinderPhone);
      await driver.enterText('');
      await driver.waitFor(find.text(''));
      await driver.enterText('89265004030');
    });

    test('Test tap submit', () async {
      await driver.tap(textBtnSubmit);
    });

    test('Test Error messages', () async {
      expect(await driver.getText(successText), 'Вы успешно зарегистрировались');
    });
  });
}
