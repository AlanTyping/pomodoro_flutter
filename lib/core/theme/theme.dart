import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'text_theme_util.dart';

class PomodoroTheme {
  final TextTheme textTheme;

  const PomodoroTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff750006),
      surfaceTint: Color(0xffb91c1c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa0000c),
      onPrimaryContainer: Color(0xffffa89e),
      secondary: Color(0xff9f3f37),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffff897d),
      onSecondaryContainer: Color(0xff76211c),
      tertiary: Color(0xff4f3000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6e4400),
      onTertiaryContainer: Color(0xffefb369),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff271816),
      onSurfaceVariant: Color(0xff5b403d),
      outline: Color(0xff8f6f6c),
      outlineVariant: Color(0xffe4beb9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3e2c2a),
      inversePrimary: Color(0xffffb4ab),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff410002),
      primaryFixedDim: Color(0xffffb4ab),
      onPrimaryFixedVariant: Color(0xff93000a),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff410002),
      secondaryFixedDim: Color(0xffffb4ab),
      onSecondaryFixedVariant: Color(0xff802822),
      tertiaryFixed: Color(0xffffddb8),
      onTertiaryFixed: Color(0xff2a1700),
      tertiaryFixedDim: Color(0xfff8bb71),
      onTertiaryFixedVariant: Color(0xff653e00),
      surfaceDim: Color(0xfff1d3d0),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xffffe9e6),
      surfaceContainerHigh: Color(0xffffe2de),
      surfaceContainerHighest: Color(0xfff9dcd8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff740006),
      surfaceTint: Color(0xffb91c1c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa0000c),
      onPrimaryContainer: Color(0xffffe6e3),
      secondary: Color(0xff691713),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb24d44),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4f2f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6e4400),
      onTertiaryContainer: Color(0xffffe7cf),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff1c0d0c),
      onSurfaceVariant: Color(0xff49302d),
      outline: Color(0xff684b48),
      outlineVariant: Color(0xff856662),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3e2c2a),
      inversePrimary: Color(0xffffb4ab),
      primaryFixed: Color(0xffcf2d28),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffab0e13),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffb24d44),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff93362e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff936321),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff774b08),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcc0bd),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0ee),
      surfaceContainer: Color(0xffffe2de),
      surfaceContainerHigh: Color(0xfff4d6d3),
      surfaceContainerHighest: Color(0xffe8cbc8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff600004),
      surfaceTint: Color(0xffb91c1c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff98000b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5b0c0a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff832b24),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff412600),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff684000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f7),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff3e2623),
      outlineVariant: Color(0xff5e423f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3e2c2a),
      inversePrimary: Color(0xffffb4ab),
      primaryFixed: Color(0xff98000b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6d0005),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff832b24),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff641410),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff684000),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4a2c00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffceb3af),
      surfaceBright: Color(0xfffff8f7),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffedea),
      surfaceContainer: Color(0xfff9dcd8),
      surfaceContainerHigh: Color(0xffebceca),
      surfaceContainerHighest: Color(0xffdcc0bd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4ab),
      surfaceTint: Color(0xffffb4ab),
      onPrimary: Color(0xff690005),
      primaryContainer: Color(0xffa0000c),
      onPrimaryContainer: Color(0xffffa89e),
      secondary: Color(0xffffb4ab),
      onSecondary: Color(0xff61110e),
      secondaryContainer: Color(0xff802822),
      onSecondaryContainer: Color(0xffff9a8e),
      tertiary: Color(0xfff8bb71),
      onTertiary: Color(0xff472a00),
      tertiaryContainer: Color(0xff6e4400),
      onTertiaryContainer: Color(0xffefb369),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1e100e),
      onSurface: Color(0xfff9dcd8),
      onSurfaceVariant: Color(0xffe4beb9),
      outline: Color(0xffab8985),
      outlineVariant: Color(0xff5b403d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff9dcd8),
      inversePrimary: Color(0xffb91c1c),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff410002),
      primaryFixedDim: Color(0xffffb4ab),
      onPrimaryFixedVariant: Color(0xff93000a),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff410002),
      secondaryFixedDim: Color(0xffffb4ab),
      onSecondaryFixedVariant: Color(0xff802822),
      tertiaryFixed: Color(0xffffddb8),
      onTertiaryFixed: Color(0xff2a1700),
      tertiaryFixedDim: Color(0xfff8bb71),
      onTertiaryFixedVariant: Color(0xff653e00),
      surfaceDim: Color(0xff1e100e),
      surfaceBright: Color(0xff473532),
      surfaceContainerLowest: Color(0xff180a09),
      surfaceContainerLow: Color(0xff271816),
      surfaceContainer: Color(0xff2c1c1a),
      surfaceContainerHigh: Color(0xff372624),
      surfaceContainerHighest: Color(0xff43302e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2cc),
      surfaceTint: Color(0xffffb4ab),
      onPrimary: Color(0xff540003),
      primaryContainer: Color(0xffff5449),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd2cc),
      onSecondary: Color(0xff520505),
      secondaryContainer: Color(0xffdf7064),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd5a6),
      onTertiary: Color(0xff382000),
      tertiaryContainer: Color(0xffbc8641),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1e100e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffbd3ce),
      outline: Color(0xffcea9a5),
      outlineVariant: Color(0xffaa8884),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff9dcd8),
      inversePrimary: Color(0xff95000a),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff2d0001),
      primaryFixedDim: Color(0xffffb4ab),
      onPrimaryFixedVariant: Color(0xff740006),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff2d0001),
      secondaryFixedDim: Color(0xffffb4ab),
      onSecondaryFixedVariant: Color(0xff691713),
      tertiaryFixed: Color(0xffffddb8),
      onTertiaryFixed: Color(0xff1c0e00),
      tertiaryFixedDim: Color(0xfff8bb71),
      onTertiaryFixedVariant: Color(0xff4f2f00),
      surfaceDim: Color(0xff1e100e),
      surfaceBright: Color(0xff53403d),
      surfaceContainerLowest: Color(0xff100504),
      surfaceContainerLow: Color(0xff291a18),
      surfaceContainer: Color(0xff352422),
      surfaceContainerHigh: Color(0xff402e2c),
      surfaceContainerHighest: Color(0xff4c3937),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece9),
      surfaceTint: Color(0xffffb4ab),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffaea5),
      onPrimaryContainer: Color(0xff220001),
      secondary: Color(0xffffece9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffaea5),
      onSecondaryContainer: Color(0xff220001),
      tertiary: Color(0xffffeddc),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff3b76d),
      onTertiaryContainer: Color(0xff140900),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1e100e),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffece9),
      outlineVariant: Color(0xffe0bab5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff9dcd8),
      inversePrimary: Color(0xff95000a),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb4ab),
      onPrimaryFixedVariant: Color(0xff2d0001),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb4ab),
      onSecondaryFixedVariant: Color(0xff2d0001),
      tertiaryFixed: Color(0xffffddb8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff8bb71),
      onTertiaryFixedVariant: Color(0xff1c0e00),
      surfaceDim: Color(0xff1e100e),
      surfaceBright: Color(0xff604b49),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff2c1c1a),
      surfaceContainer: Color(0xff3e2c2a),
      surfaceContainerHigh: Color(0xff4a3735),
      surfaceContainerHighest: Color(0xff564240),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
