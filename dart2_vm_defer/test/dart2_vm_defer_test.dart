import 'package:dart2_vm_defer/deferred_lib.dart' deferred as deferred_lib;
import 'package:test/test.dart';

void main() {
  test('should throw on access to defererd library', () async {
    expect(() => deferred_lib.aNumber, throwsA(anything));
    await deferred_lib.loadLibrary();
    expect(deferred_lib.aNumber, 1234);
  });
}
