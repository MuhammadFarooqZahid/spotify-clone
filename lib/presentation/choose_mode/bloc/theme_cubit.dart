import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode mode) => emit(mode);
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeIndex = json['theme_mode'] as int?;
    if (themeIndex == null) return null;

    return ThemeMode.values[themeIndex];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {'theme_mode': state.index};
  }
}
