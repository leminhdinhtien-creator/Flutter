// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_example/main.dart';

void main() {
  testWidgets('Displays the profile page and local avatar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final avatarImage = tester.widget<Image>(
      find.descendant(
        of: find.byKey(const Key('profile-avatar')),
        matching: find.byType(Image),
      ),
    );

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('Đình Tiến'), findsOneWidget);
    expect(find.text('Lead Mobile Engineer'), findsOneWidget);
    expect(find.text('Skills & Expertise'), findsOneWidget);
    expect(find.text('Featured Projects'), findsOneWidget);
    expect(
      (avatarImage.image as AssetImage).assetName,
      'images/david-laid.png',
    );

    final assetNames = tester
        .widgetList<Image>(find.byType(Image))
        .map((image) => (image.image as AssetImage).assetName);
    expect(assetNames, contains('images/david-laid2.jpg'));
    expect(assetNames, contains('images/david-laid3.webp'));
  });
}
