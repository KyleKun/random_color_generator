import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_color_generator/features/random_color/random_color_screen.dart';

void main() {
  group('RandomColorScreen', () {
    testWidgets('Should render greeting text', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RandomColorScreen()));

      expect(find.byType(RandomColorScreen), findsOneWidget);
      expect(find.text('Hello there'), findsOneWidget);
    });

    testWidgets('Should have a tappable GestureDetector',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RandomColorScreen()));

      // Perform the tap gesture
      final gestureDetectorFinder = find.byType(GestureDetector);
      await tester.tap(gestureDetectorFinder);
      await tester.pumpAndSettle();

      expect(gestureDetectorFinder, findsOneWidget);
    });
  });
}
