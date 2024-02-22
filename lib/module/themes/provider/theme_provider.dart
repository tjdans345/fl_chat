import 'package:fl_chat/module/themes/dark_model.dart';
import 'package:fl_chat/module/themes/light_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeType { light, dark }

// final themeTypeProvider = StateProvider<ThemeType>((ref) => ThemeType.light);
final themeTypeProvider = StateNotifierProvider<ThemeTypeNotifier, ThemeState>((ref) {
  return ThemeTypeNotifier(ThemeState(themeType: ThemeType.light, themeData: lightMode));
});

class ThemeTypeNotifier extends StateNotifier<ThemeState> {
  ThemeTypeNotifier(super._state);

  void toggleThemeMode() {
    if(state.themeType != ThemeType.light) {
      state = state.copyWith(themeType: ThemeType.light, themeData: lightMode);
    } else {
      state = state.copyWith(themeType: ThemeType.dark, themeData: darkMode);
    }
  }
}

@immutable
class ThemeState {
  final ThemeType themeType;
  final ThemeData themeData;
  const ThemeState({required this.themeType, required this.themeData});

  ThemeState copyWith({ThemeType? themeType, ThemeData? themeData}) {
    return ThemeState(themeType: themeType ?? this.themeType, themeData: themeData ?? this.themeData);
  }
}

// final themeState = Provider<ThemeData>((ref) {
//   final ThemeType theme = ref.watch(themeTypeProvider);
//   switch (theme) {
//     case ThemeType.light:
//       return lightMode;
//     case ThemeType.dark:
//       return darkMode;
//   }
// });
