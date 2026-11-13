
import 'package:flutter_test/flutter_test.dart';
import 'package:first_flutter_app/main.dart';


void main() {
  testWidgets(
    'Rajang River Cruise App Test',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const RajangRiverCruiseApp(),
      );

      expect(
        find.text('Sibu River Cruise & Heritage'),
        findsOneWidget,
      );

      expect(
        find.text('Rajang River Express Cruise'),
        findsOneWidget,
      );

      expect(
        find.text('Sibu Waterfront, Sarawak'),
        findsOneWidget,
      );
    },
  );
}

