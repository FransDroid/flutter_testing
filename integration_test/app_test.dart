import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fluttertesting/main.dart' as app;
// TODO 5: Import the app that you want to test

void main() {
  group('App Test', (){
    // TODO 3: Add the IntegrationTestWidgetsFlutterBinding and  .ensureInitialized
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    // TODO 4: Create your test case
    testWidgets('full app test', (tester) async{
      // TODO 6: execute the app.main() function
      app.main();
      // TODO 7: wait until the app has settled
      await tester.pumpAndSettle();
      // TODO 8: create finders for email, password and login
      final emailFormField = find.byKey(const Key('email'));
      final passwordFormField = find.byKey(const Key('password'));
      final loginButton = find.byType(ElevatedButton).first;
      // TODO 9: Enter text for the email address and password then pump
      await tester.enterText(emailFormField, 'francsi@gmail.com');
      await tester.enterText(passwordFormField, '123456');
      await tester.pumpAndSettle();
      // TODO 10: Tap on the login button and wait till it settled
      await tester.tap(loginButton);
      await tester.pumpAndSettle();
      // TODO 11: Find the first checkbox in the screen
      final firstCheckBox = find.byType(Checkbox).first;
      // TODO 12: Check the semantics of the checkbox if is not checked
      expect(tester.getSemantics(firstCheckBox), matchesSemantics(
        hasTapAction: true,
        hasCheckedState: true,
        isChecked: false,
        hasEnabledState: true,
        isEnabled: true,
        isFocusable: true
      ),);
      // TODO 12: Tap on the checkbox and wait till it settled
        await tester.tap(firstCheckBox);
        await tester.pumpAndSettle();
      // TODO 13: Expect the result to be checked
      expect(tester.getSemantics(firstCheckBox), matchesSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true
      ),);
    });
  });
}
