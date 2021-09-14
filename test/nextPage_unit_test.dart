// most of time uses for test the few functions or we can say few methods.

import 'package:test/test.dart';

main() {
  test("one should be one", () {
    // arrange-initialization
    int expectedNumber = 1;

    //act-execution

    //assert-observation
    expect(expectedNumber, 1);
  });
}
