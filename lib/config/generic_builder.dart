
class GenericBuilder<T> {
  Map<String, dynamic> _properties = {};

  GenericBuilder<T> setField(String fieldName, dynamic value) {
    _properties[fieldName] = value;
    return this;
  }

  T build() {
    return _properties as T;
  }
}