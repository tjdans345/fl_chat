
class GenericBuilder<T> {
  Map<String, dynamic> _properties = {};

  GenericBuilder<T> setProperty(String key, dynamic value) {
    _properties[key] = value;
    return this;
  }

  T build(Function(Map<String, dynamic> properties) buildFunction) {
    return buildFunction(_properties);
  }
}