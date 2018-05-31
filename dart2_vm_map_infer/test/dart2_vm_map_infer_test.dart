import 'package:test/test.dart';

void main() {
  test('shoudl work', () {
    var map = getMap({
      'startInStop': {
        'id': 2,
      },
    });
    print(map.runtimeType);
    print(map['startInStop'].runtimeType);
  });
}

dynamic getMap(Map map) => map;

