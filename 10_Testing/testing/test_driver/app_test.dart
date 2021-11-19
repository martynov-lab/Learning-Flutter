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

    final filedFinderEmail = find.byValueKey('fieldLoginEmail');
    final filedFinderPhone = find.byValueKey('fieldLoginPhone');
    final filedFinderButtom = find.text('Отправить');
    final success = find.text('Добро пожаловать');
    final buttomSwitchForm = find.byValueKey('buttomSwitchForm');

    test('Test email field', () async {
      final String _text = 'test@test.com';
      await driver.tap(filedFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText(_text);
      await driver.waitFor(find.text(_text));
    });
    test('Test phone field', () async {
      final String _text = '88003000600';
      await driver.tap(filedFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText(_text);
      await driver.waitFor(find.text(_text));
    });
    test('Test buttom submit', () async {
      await driver.tap(filedFinderButtom);
    });
    test('Test success', () async {
      expect(await driver.getText(success), 'Добро пожаловать');
    });
    test('Test buttom switch form', () async {
      await driver.tap(buttomSwitchForm);
    });
  });

  group('Rigister form tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final filedFinderFirstName = find.byValueKey('fieldRegisterFirstName');
    final filedFinderLastName = find.byValueKey('fieldRegisterLastName');
    final filedFinderEmail = find.byValueKey('fieldRegisterEmail');
    final filedFinderPhone = find.byValueKey('fieldRegisterPhone');
    final filedFinderButtom = find.text('Отправить');
    final success = find.text('Вы успешно зарегистрировались');

    test('Test first name field', () async {
      final String _text = 'Andrey';
      await driver.tap(filedFinderFirstName);
      await driver.waitFor(find.text(''));
      await driver.enterText(_text);
      await driver.waitFor(find.text(_text));
    });
    test('Test last name field', () async {
      final String _text = 'Martynov';
      await driver.tap(filedFinderLastName);
      await driver.waitFor(find.text(''));
      await driver.enterText(_text);
      await driver.waitFor(find.text(_text));
    });
    test('Test phone field', () async {
      final String _text = '88003000600';
      await driver.tap(filedFinderPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText(_text);
      await driver.waitFor(find.text(_text));
    });
    test('Test email field', () async {
      final String _text = 'test@test.com';
      await driver.tap(filedFinderEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText(_text);
      await driver.waitFor(find.text(_text));
    });
    test('Test buttom submit', () async {
      await driver.tap(filedFinderButtom);
    });
    test('Test success', () async {
      expect(await driver.getText(success), 'Вы успешно зарегистрировались');
    });
  });
}
