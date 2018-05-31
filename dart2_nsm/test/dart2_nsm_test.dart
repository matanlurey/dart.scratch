import 'package:test/test.dart';

void main() {
  test('$HasNoSuchMethod should work with "foo"', () {
    expect(new HasNoSuchMethod().foo('Hello'), 'Hello');
  });

  test('$HasNoSuchMethod should work with "bar" if dynamic', () {
    expect((new HasNoSuchMethod() as dynamic).bar('Hello'), 'Hello');
  });
}

abstract class HasMethodFoo {
  String foo(String message);
}

class HasNoSuchMethod implements HasMethodFoo {
  @override
  noSuchMethod(Invocation invocation) {
    return invocation.positionalArguments.first;
  }
}
