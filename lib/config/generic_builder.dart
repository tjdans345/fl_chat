
import 'dart:convert';

import 'package:fl_chat/exception/custom_exception.dart';

class GenericBuilder<T> {
  final T _instance;

  GenericBuilder(this._instance);

  GenericBuilder<T> setField(dynamic Function(T) fieldSetter) {
    fieldSetter(_instance);
    return this;
  }

  T build() {
    return _instance;
  }
}