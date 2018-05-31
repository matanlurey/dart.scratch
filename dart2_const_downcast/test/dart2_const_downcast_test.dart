import 'package:test/test.dart';

class Provider {
  const Provider();
}

class Module {
  final List<Provider> providers;
  const Module(this.providers);
}

const aGoodModule = const Module(const [
  const Provider(),
]);

const listOfThings = const [
  const [],
  const Provider(),
];

const aBadModule = const Module(listOfThings);

void main() {
  test('$aBadModule should be invalid', () {
    expect(aBadModule.providers, const isInstanceOf<List<Provider>>());
  });
}
