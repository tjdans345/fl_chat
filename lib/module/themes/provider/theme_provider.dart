import 'package:fl_chat/module/themes/dark_model.dart';
import 'package:fl_chat/module/themes/light_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeType { light, dark }



// final themeTypeProvider = StateProvider<ThemeType>((ref) => ThemeType.light);
final themeTypeProvider = StateNotifierProvider<ThemeTypeNotifier, ThemeType>((ref) {
  return ThemeTypeNotifier(ThemeType.light);
});

class ThemeTypeNotifier extends StateNotifier<ThemeType> {
  ThemeTypeNotifier(super.state);

  void toggleThemeMode() {
    state = (state != ThemeType.light) ? ThemeType.light : ThemeType.dark;
  }
}

final themeState = Provider<ThemeData>((ref) {
  final ThemeType theme = ref.watch(themeTypeProvider);
  switch (theme) {
    case ThemeType.light:
      return lightMode;
    case ThemeType.dark:
      return darkMode;
  }
});
