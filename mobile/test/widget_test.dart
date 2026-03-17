import 'package:flutter_test/flutter_test.dart';

import 'package:checkmark_mobile/main.dart';

void main() {
  testWidgets('App bootstrap renders splash title', (WidgetTester tester) async {
    await tester.pumpWidget(const CheckMarkBootstrap());
    expect(find.text('CheckMark'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
  });
}
