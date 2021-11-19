import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';

void main() {
  group('Login form group tests', () {
    final fieldEmail = find.byKey(Key('fieldLoginEmail'));
    final fieldPhone = find.byKey(Key('fieldLoginPhone'));
    final buttonSubmit = find.text('Отправить');
    final successMessage = find.text('Добро пожаловать');
    testWidgets('Login form tests', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );
      String _email = 'test@test.com';
      String _numberPhone = '88003000500';
      String _successText = 'Добро пожаловать';

      expect(fieldEmail, findsOneWidget);
      expect(fieldPhone, findsOneWidget);
      expect(buttonSubmit, findsOneWidget);
      expect(successMessage, findsNothing);

      await tester.enterText(fieldEmail, _email);
      expect(find.text(_email), findsOneWidget);

      await tester.enterText(fieldPhone, _numberPhone);
      expect(find.text(_numberPhone), findsOneWidget);

      await tester.tap(buttonSubmit);
      await tester.pump();
      expect(find.text(_successText), findsOneWidget);
    });
    testWidgets('Login form error email', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );
      String _email = 'test@test';
      String _errorTextEmail = 'Поле email заполнено не корректно';
      expect(fieldEmail, findsOneWidget);
      await tester.enterText(fieldEmail, _email);
      expect(find.text(_email), findsOneWidget);

      await tester.tap(buttonSubmit);
      await tester.pump();
      expect(find.text(_errorTextEmail), findsOneWidget);
    });
    testWidgets('Login form error phone', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );
      String _numberPhone = 'kjhkhdsf';
      String _errorNumberPhone = 'Введите телефон';
      expect(fieldPhone, findsOneWidget);
      await tester.enterText(fieldPhone, _numberPhone);

      await tester.tap(buttonSubmit);
      await tester.pump();
      expect(find.text(_errorNumberPhone), findsOneWidget);
    });
  });
  group('Register form group tests', () {
    final fieldFirstName = find.byKey(Key('fieldRegisterFirstName'));
    final fieldLastName = find.byKey(Key('fieldRegisterLastName'));
    final fieldPhone = find.byKey(Key('fieldRegisterPhone'));
    final fieldEmail = find.byKey(Key('fieldRegisterEmail'));
    final buttonSubmit = find.text('Отправить');
    final buttomSwitchForm = find.byKey(Key('buttomSwitchForm'));
    final successMessage = find.text('Вы успешно зарегистрировались');
    testWidgets('Register form tests', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );
      String _firstName = 'Andrey';
      String _lastName = 'Martynov';
      String _email = 'test@test.com';
      String _numberPhone = '88003000500';
      String _successText = 'Вы успешно зарегистрировались';

      await tester.tap(buttomSwitchForm);
      await tester.pump();

      expect(fieldFirstName, findsOneWidget);
      expect(fieldLastName, findsOneWidget);
      expect(fieldPhone, findsOneWidget);
      expect(fieldEmail, findsOneWidget);
      expect(buttonSubmit, findsOneWidget);
      expect(successMessage, findsNothing);

      await tester.enterText(fieldFirstName, _firstName);
      expect(find.text(_firstName), findsOneWidget);

      await tester.enterText(fieldLastName, _lastName);
      expect(find.text(_lastName), findsOneWidget);

      await tester.enterText(fieldPhone, _numberPhone);
      expect(find.text(_numberPhone), findsOneWidget);

      await tester.enterText(fieldEmail, _email);
      expect(find.text(_email), findsOneWidget);

      await tester.tap(buttonSubmit);
      await tester.pump();
      expect(find.text(_successText), findsOneWidget);
    });
    testWidgets('Register form error email', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );
      String _email = '5456516';
      String _errorTextEmail = 'Емейл не корректный';

      await tester.tap(buttomSwitchForm);
      await tester.pump();

      expect(fieldEmail, findsOneWidget);
      await tester.enterText(fieldEmail, _email);
      expect(find.text(_email), findsOneWidget);

      await tester.tap(buttonSubmit);
      await tester.pump();
      expect(find.text(_errorTextEmail), findsOneWidget);
    });
    testWidgets('Register form error phone', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );

      String _numberPhone = 'test@test.com';
      String _errorNumberPhone = 'Заполните поле телефон';

      await tester.tap(buttomSwitchForm);
      await tester.pump();

      expect(fieldPhone, findsOneWidget);
      await tester.enterText(fieldPhone, _numberPhone);

      await tester.tap(buttonSubmit);
      await tester.pump();
      expect(find.text(_errorNumberPhone), findsOneWidget);
    });
  });
}
