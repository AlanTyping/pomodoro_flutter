import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'text_theme_util.dart';

class PomodoroTheme {
  final TextTheme textTheme;

  const PomodoroTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff790014),
      surfaceTint: Color(0xffb9192b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa4001f),
      onPrimaryContainer: Color(0xffffadaa),
      secondary: Color(0xff006b2b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff008738),
      onSecondaryContainer: Color(0xfff7fff2),
      tertiary: Color(0xff755a2c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdaa0),
      onTertiaryContainer: Color(0xff795e2f),
      error: Color(0xff55008b),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff7600be),
      onErrorContainer: Color(0xffdcadff),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff1e1b1b),
      onSurfaceVariant: Color(0xff4e4448),
      outline: Color(0xff807478),
      outlineVariant: Color(0xffd2c3c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f30),
      inversePrimary: Color(0xffffb3b0),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff410006),
      primaryFixedDim: Color(0xffffb3b0),
      onPrimaryFixedVariant: Color(0xff93001b),
      secondaryFixed: Color(0xff77fd91),
      onSecondaryFixed: Color(0xff002108),
      secondaryFixedDim: Color(0xff59e078),
      onSecondaryFixedVariant: Color(0xff00531f),
      tertiaryFixed: Color(0xffffdeab),
      onTertiaryFixed: Color(0xff271900),
      tertiaryFixedDim: Color(0xffe5c189),
      onTertiaryFixedVariant: Color(0xff5b4316),
      surfaceDim: Color(0xffe0d8d9),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf2f2),
      surfaceContainer: Color(0xfff4ecec),
      surfaceContainerHigh: Color(0xffeee6e7),
      surfaceContainerHighest: Color(0xffe8e1e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff730013),
      surfaceTint: Color(0xffb9192b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa4001f),
      onPrimaryContainer: Color(0xffffebea),
      secondary: Color(0xff004016),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff007e34),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff483207),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff856939),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff540089),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff7600be),
      onErrorContainer: Color(0xfff8e6ff),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff131011),
      onSurfaceVariant: Color(0xff3d3438),
      outline: Color(0xff5b5054),
      outlineVariant: Color(0xff766a6e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f30),
      inversePrimary: Color(0xffffb3b0),
      primaryFixed: Color(0xffcf2c38),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffab0923),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff007e34),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006327),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff856939),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6a5123),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffccc5c5),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaf2f2),
      surfaceContainer: Color(0xffeee6e7),
      surfaceContainerHigh: Color(0xffe2dbdb),
      surfaceContainerHighest: Color(0xffd7d0d0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff60000e),
      surfaceTint: Color(0xffb9192b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff97001c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003411),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005521),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d2800),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5d4519),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff460073),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff6f00b3),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff332a2e),
      outlineVariant: Color(0xff51464b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff332f30),
      inversePrimary: Color(0xffffb3b0),
      primaryFixed: Color(0xff97001c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6c0011),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005521),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003c15),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5d4519),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff442f04),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbeb7b7),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7efef),
      surfaceContainer: Color(0xffe8e1e1),
      surfaceContainerHigh: Color(0xffdad3d3),
      surfaceContainerHighest: Color(0xffccc5c5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb3b0),
      surfaceTint: Color(0xffffb3b0),
      onPrimary: Color(0xff680010),
      primaryContainer: Color(0xffa4001f),
      onPrimaryContainer: Color(0xffffadaa),
      secondary: Color(0xff59e078),
      onSecondary: Color(0xff003913),
      secondaryContainer: Color(0xff00a747),
      onSecondaryContainer: Color(0xff003110),
      tertiary: Color(0xfffffbff),
      onTertiary: Color(0xff422c02),
      tertiaryContainer: Color(0xffffdaa0),
      onTertiaryContainer: Color(0xff795e2f),
      error: Color(0xffe0b6ff),
      onError: Color(0xff4c007c),
      errorContainer: Color(0xff7600be),
      onErrorContainer: Color(0xffdcadff),
      surface: Color(0xff151313),
      onSurface: Color(0xffe8e1e1),
      onSurfaceVariant: Color(0xffd2c3c8),
      outline: Color(0xff9b8d92),
      outlineVariant: Color(0xff4e4448),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e1e1),
      inversePrimary: Color(0xffb9192b),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff410006),
      primaryFixedDim: Color(0xffffb3b0),
      onPrimaryFixedVariant: Color(0xff93001b),
      secondaryFixed: Color(0xff77fd91),
      onSecondaryFixed: Color(0xff002108),
      secondaryFixedDim: Color(0xff59e078),
      onSecondaryFixedVariant: Color(0xff00531f),
      tertiaryFixed: Color(0xffffdeab),
      onTertiaryFixed: Color(0xff271900),
      tertiaryFixedDim: Color(0xffe5c189),
      onTertiaryFixedVariant: Color(0xff5b4316),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff3c3839),
      surfaceContainerLowest: Color(0xff100e0e),
      surfaceContainerLow: Color(0xff1e1b1b),
      surfaceContainer: Color(0xff221f1f),
      surfaceContainerHigh: Color(0xff2c292a),
      surfaceContainerHighest: Color(0xff373434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd2cf),
      surfaceTint: Color(0xffffb3b0),
      onPrimary: Color(0xff54000b),
      primaryContainer: Color(0xffff5359),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff71f78b),
      onSecondary: Color(0xff002d0e),
      secondaryContainer: Color(0xff00a747),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffbff),
      onTertiary: Color(0xff422c02),
      tertiaryContainer: Color(0xffffdaa0),
      onTertiaryContainer: Color(0xff5a4216),
      error: Color(0xffeed2ff),
      onError: Color(0xff3c0065),
      errorContainer: Color(0xffbc69ff),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe8d8dd),
      outline: Color(0xffbdaeb3),
      outlineVariant: Color(0xff9a8d92),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e1e1),
      inversePrimary: Color(0xff95001b),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff2d0003),
      primaryFixedDim: Color(0xffffb3b0),
      onPrimaryFixedVariant: Color(0xff730013),
      secondaryFixed: Color(0xff77fd91),
      onSecondaryFixed: Color(0xff001504),
      secondaryFixedDim: Color(0xff59e078),
      onSecondaryFixedVariant: Color(0xff004016),
      tertiaryFixed: Color(0xffffdeab),
      onTertiaryFixed: Color(0xff1a0f00),
      tertiaryFixedDim: Color(0xffe5c189),
      onTertiaryFixedVariant: Color(0xff483207),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff474344),
      surfaceContainerLowest: Color(0xff090707),
      surfaceContainerLow: Color(0xff201d1d),
      surfaceContainer: Color(0xff2a2727),
      surfaceContainerHigh: Color(0xff353232),
      surfaceContainerHighest: Color(0xff403d3d),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffecea),
      surfaceTint: Color(0xffffb3b0),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffadaa),
      onPrimaryContainer: Color(0xff220002),
      secondary: Color(0xffc2ffc4),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff55dc74),
      onSecondaryContainer: Color(0xff000f02),
      tertiary: Color(0xfffffbff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffdaa0),
      onTertiaryContainer: Color(0xff372400),
      error: Color(0xfffaebff),
      onError: Color(0xff000000),
      errorContainer: Color(0xffdeb1ff),
      onErrorContainer: Color(0xff16002a),
      surface: Color(0xff151313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffcecf1),
      outlineVariant: Color(0xffcebfc4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e1e1),
      inversePrimary: Color(0xff95001b),
      primaryFixed: Color(0xffffdad8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb3b0),
      onPrimaryFixedVariant: Color(0xff2d0003),
      secondaryFixed: Color(0xff77fd91),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff59e078),
      onSecondaryFixedVariant: Color(0xff001504),
      tertiaryFixed: Color(0xffffdeab),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffe5c189),
      onTertiaryFixedVariant: Color(0xff1a0f00),
      surfaceDim: Color(0xff151313),
      surfaceBright: Color(0xff534f4f),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff221f1f),
      surfaceContainer: Color(0xff332f30),
      surfaceContainerHigh: Color(0xff3e3a3b),
      surfaceContainerHighest: Color(0xff4a4646),
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
    scaffoldBackgroundColor: colorScheme.surface,
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
