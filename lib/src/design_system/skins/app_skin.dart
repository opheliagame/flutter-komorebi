import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_komorebi/src/core/domain/history_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appSkinProvider = StateProvider<AppSkin>((ref) => AppSkin.defaultSkin);

class AppSkin {
  const AppSkin({
    required this.name,
    required this.colorScheme,
    required this.semanticColors,
    required this.availableImages,
  });

  factory AppSkin.fromJson(Map<String, dynamic> json) {
    final colorSchemeJson = json['colorScheme'];
    final semanticColorsJson = json['semanticColors'];
    final availableImagesJson = json['availableImages'];
    if (colorSchemeJson is! Map) {
      throw const FormatException('A skin must define colorScheme.');
    }
    if (semanticColorsJson is! Map) {
      throw const FormatException('A skin must define semanticColors.');
    }
    if (availableImagesJson is! List) {
      throw const FormatException('A skin must define availableImages.');
    }

    return AppSkin(
      name: _requiredString(json, 'name'),
      colorScheme: _parseColorScheme(colorSchemeJson),
      semanticColors: {
        for (final entry in semanticColorsJson.entries)
          _requiredStringValue(entry.key, 'semanticColors key'): _parseColor(
            entry.value,
            'semanticColors.${entry.key}',
          ),
      },
      availableImages: [
        for (final image in availableImagesJson) SkinImageGuide.fromJson(image),
      ],
    );
  }

  static const defaultSkin = AppSkin(
    name: 'Komorebi',
    colorScheme: ColorScheme.light(
      primary: Colors.deepOrange,
      onPrimary: Colors.white,
      secondary: Colors.deepOrangeAccent,
      onSecondary: Colors.white,
    ),
    semanticColors: {
      'neutral': Colors.white,
      'informational': Color(0xFFBBDEFB),
      'destructive': Color(0xFFFFCDD2),
      'success': Color(0xFFC8E6C9),
    },
    availableImages: [
      SkinImageGuide(
        id: 'collection-floral-1',
        assetPath: 'assets/skins/images/1.png',
        format: SkinImageFormat.png,
        description: 'Botanical flower visual guide.',
      ),
      SkinImageGuide(
        id: 'collection-floral-2',
        assetPath: 'assets/skins/images/2.png',
        format: SkinImageFormat.png,
        description: 'Botanical leaf and flower visual guide.',
      ),
      SkinImageGuide(
        id: 'collection-floral-3',
        assetPath: 'assets/skins/images/3.png',
        format: SkinImageFormat.png,
        description: 'Botanical vine visual guide.',
      ),
      SkinImageGuide(
        id: 'collection-floral-4',
        assetPath: 'assets/skins/images/4.png',
        format: SkinImageFormat.png,
        description: 'Botanical branch visual guide.',
      ),
    ],
  );

  final String name;
  final ColorScheme colorScheme;
  final Map<String, Color> semanticColors;
  final List<SkinImageGuide> availableImages;

  Color get primaryColor => colorScheme.primary;

  AppSkin copyWith({Color? primaryColor}) {
    return AppSkin(
      name: name,
      colorScheme: colorScheme.copyWith(primary: primaryColor),
      semanticColors: semanticColors,
      availableImages: availableImages,
    );
  }

  ThemeData materialTheme() {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
        highlightElevation: 0,
        splashColor: Colors.transparent,
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      dialogTheme: const DialogThemeData(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  CupertinoThemeData cupertinoTheme() {
    return CupertinoThemeData(
      primaryColor: primaryColor,
      barBackgroundColor: CupertinoColors.systemBackground,
      scaffoldBackgroundColor: CupertinoColors.systemBackground,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'colorScheme': _colorSchemeToJson(colorScheme),
      'semanticColors': {
        for (final entry in semanticColors.entries) entry.key: entry.value.hex,
      },
      'availableImages': [
        for (final image in availableImages) image.toJson(),
      ],
    };
  }

  Color historyColor(String historyType) {
    final semanticColor = switch (historyType) {
      'addNote' ||
      'updateNote' ||
      'addCollection' ||
      'updateCollection' =>
        semanticColors['informational'],
      'deleteNote' ||
      'deleteCollection' ||
      'removeConnection' =>
        semanticColors['destructive'],
      'addConnection' => semanticColors['success'],
      _ => semanticColors['neutral'],
    };
    return semanticColor ?? semanticColors['neutral'] ?? Colors.transparent;
  }
}

class SkinImageGuide {
  const SkinImageGuide({
    required this.id,
    required this.assetPath,
    required this.format,
    required this.description,
  });

  factory SkinImageGuide.fromJson(Object? value) {
    if (value is! Map) {
      throw const FormatException('Each available image must be an object.');
    }
    return SkinImageGuide(
      id: _requiredStringValue(value['id'], 'availableImages.id'),
      assetPath: _requiredStringValue(
        value['assetPath'],
        'availableImages.assetPath',
      ),
      format: SkinImageFormat.fromJson(value['format']),
      description: _requiredStringValue(
        value['description'],
        'availableImages.description',
      ),
    );
  }

  final String id;
  final String assetPath;
  final SkinImageFormat format;
  final String description;

  Map<String, String> toJson() => {
        'id': id,
        'assetPath': assetPath,
        'format': format.value,
        'description': description,
      };
}

enum SkinImageFormat {
  svg('svg'),
  png('png'),
  jpeg('jpeg');

  const SkinImageFormat(this.value);

  final String value;

  static SkinImageFormat fromJson(Object? value) {
    return SkinImageFormat.values.firstWhere(
      (format) => format.value == value,
      orElse: () => throw FormatException(
        'availableImages.format must be one of: ${values.map((format) => format.value).join(', ')}.',
      ),
    );
  }
}

class AppSkinLoader {
  const AppSkinLoader._();

  static Future<AppSkin> loadFromAsset(String assetPath) async {
    final source = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(source);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('A skin JSON file must contain an object.');
    }
    return AppSkin.fromJson(decoded);
  }
}

String _requiredString(Map<String, dynamic> json, String key) {
  return _requiredStringValue(json[key], key);
}

String _requiredStringValue(Object? value, String key) {
  if (value is! String || value.isEmpty) {
    throw FormatException('$key must be a non-empty string.');
  }
  return value;
}

Color _parseColor(Object? value, String key) {
  final valueString = _requiredStringValue(value, key).replaceFirst('#', '');
  final hex = valueString.length == 6 ? 'FF$valueString' : valueString;
  if (hex.length != 8) {
    throw FormatException('$key must be an RRGGBB or AARRGGBB hex color.');
  }

  final valueInt = int.tryParse(hex, radix: 16);
  if (valueInt == null) {
    throw FormatException('$key must be a valid hex color.');
  }
  return Color(valueInt);
}

ColorScheme _parseColorScheme(Map<dynamic, dynamic> json) {
  Color color(String name) => _parseColor(json[name], 'colorScheme.$name');
  final brightness = _requiredStringValue(
    json['brightness'],
    'colorScheme.brightness',
  );
  if (brightness != 'light' && brightness != 'dark') {
    throw const FormatException(
      'colorScheme.brightness must be "light" or "dark".',
    );
  }

  return ColorScheme(
    brightness: brightness == 'dark' ? Brightness.dark : Brightness.light,
    primary: color('primary'),
    onPrimary: color('onPrimary'),
    primaryContainer: color('primaryContainer'),
    onPrimaryContainer: color('onPrimaryContainer'),
    secondary: color('secondary'),
    onSecondary: color('onSecondary'),
    secondaryContainer: color('secondaryContainer'),
    onSecondaryContainer: color('onSecondaryContainer'),
    tertiary: color('tertiary'),
    onTertiary: color('onTertiary'),
    tertiaryContainer: color('tertiaryContainer'),
    onTertiaryContainer: color('onTertiaryContainer'),
    error: color('error'),
    onError: color('onError'),
    errorContainer: color('errorContainer'),
    onErrorContainer: color('onErrorContainer'),
    surface: color('surface'),
    onSurface: color('onSurface'),
    onSurfaceVariant: color('onSurfaceVariant'),
    outline: color('outline'),
    outlineVariant: color('outlineVariant'),
    shadow: color('shadow'),
    scrim: color('scrim'),
    inverseSurface: color('inverseSurface'),
    onInverseSurface: color('onInverseSurface'),
    inversePrimary: color('inversePrimary'),
  );
}

Map<String, dynamic> _colorSchemeToJson(ColorScheme scheme) {
  return {
    'brightness': scheme.brightness == Brightness.dark ? 'dark' : 'light',
    'primary': scheme.primary.hex,
    'onPrimary': scheme.onPrimary.hex,
    'primaryContainer': scheme.primaryContainer.hex,
    'onPrimaryContainer': scheme.onPrimaryContainer.hex,
    'secondary': scheme.secondary.hex,
    'onSecondary': scheme.onSecondary.hex,
    'secondaryContainer': scheme.secondaryContainer.hex,
    'onSecondaryContainer': scheme.onSecondaryContainer.hex,
    'tertiary': scheme.tertiary.hex,
    'onTertiary': scheme.onTertiary.hex,
    'tertiaryContainer': scheme.tertiaryContainer.hex,
    'onTertiaryContainer': scheme.onTertiaryContainer.hex,
    'error': scheme.error.hex,
    'onError': scheme.onError.hex,
    'errorContainer': scheme.errorContainer.hex,
    'onErrorContainer': scheme.onErrorContainer.hex,
    'surface': scheme.surface.hex,
    'onSurface': scheme.onSurface.hex,
    'onSurfaceVariant': scheme.onSurfaceVariant.hex,
    'outline': scheme.outline.hex,
    'outlineVariant': scheme.outlineVariant.hex,
    'shadow': scheme.shadow.hex,
    'scrim': scheme.scrim.hex,
    'inverseSurface': scheme.inverseSurface.hex,
    'onInverseSurface': scheme.onInverseSurface.hex,
    'inversePrimary': scheme.inversePrimary.hex,
  };
}

extension AppSkinHistoryColorExtension on HistoryExpandedEntity {
  Color tileBackgroundColor(AppSkin skin) =>
      skin.historyColor(historyType.name);
}

extension ColorExtension on Color {
  String get hex => toARGB32().toRadixString(16).padLeft(8, '0').toUpperCase();
}
