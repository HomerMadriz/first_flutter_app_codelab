// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:startup_namer/main.dart';

void main() {
  testWidgets('Codelab smoke test', (tester) async {
    await tester.pumpWidget(MyApp());

    final textWidgets = tester.widgetList<Text>(find.byType(Text));
    expect(textWidgets.length, greaterThan(2));

    expect(textWidgets.last.data, 'Startup Name Generator');

    final wordPairRegExp = RegExp(r'^[A-Z]\w*[A-Z]\w*$');
    final isWordPair = predicate<String>((s) => wordPairRegExp.hasMatch(s));
    for (final widget in textWidgets.take(textWidgets.length - 1)) {
      expect(widget.data, isWordPair);
    }
  });
}
