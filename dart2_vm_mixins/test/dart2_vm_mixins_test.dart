import 'dart:collection';

import 'package:test/test.dart';

void main() {
  test('should work', () {
    new DynamicFieldValue()..values.addAll(['Hello', 'World']);
  });
}

// Relevant parts of class PbList in dart-lang/protobuf.
class PbList<E> extends ListBase<E> {
  final List<E> _wrappedList = [];

  @override
  int get length => _wrappedList.length;

  @override
  set length(int length) => _wrappedList.length = length;

  @override
  E operator [](int index) => _wrappedList[index];

  @override
  operator []=(int index, E value) => _wrappedList[index] = value;
}

// User-defined mixin for protocol buffer messages.
class DynamicFieldMixin extends MapBase<String, dynamic> {
  static dynamic _readField() => new PbList<String>();

  // Not really how it is implemented. Just an example.
  //
  // In reality it calls "readField(1)", reading a PbList<String> from a protocol buffer.
  @override
  List get values => _readField();

  @override
  operator [](Object key) => throw new UnimplementedError();

  @override
  operator []=(String key, value) => throw new UnimplementedError();

  @override
  void clear() => throw new UnimplementedError();

  @override
  Iterable<String> get keys => throw new UnimplementedError();

  @override
  remove(Object key) => throw new UnimplementedError();
}

// Protocal buffer object with the mixin applied.
class DynamicFieldValue extends DynamicFieldMixin {}
