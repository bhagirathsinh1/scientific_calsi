import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("ScrollTestWidget", () {
    testWidgets("should not scroll with less item ",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Container(),
      ));
    });
  });
}
