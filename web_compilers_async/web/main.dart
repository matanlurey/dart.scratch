import 'dart:async';

import 'package:meta/dart2js.dart' as dart2js;

void main() {
  runZoned(() {
    new AsyncDoEvent().doEvent();
  }, zoneSpecification: new ZoneSpecification(
    scheduleMicrotask: (self, parent, zone, fn) {
      print('scheduleMicrotask()');
      return parent.scheduleMicrotask(zone, fn);
    },
  ));
}

abstract class HasEvent {
  void doEvent();
}

class AsyncDoEvent implements HasEvent {
  @dart2js.noInline
  void doEvent() async {
    print('doEvent()');
  }
}
