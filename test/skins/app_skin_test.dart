import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/skins/app_skin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses and serializes a skin JSON definition', () {
    final skin = AppSkin.fromJson({
      'name': 'Test skin',
      'colorScheme': {
        'brightness': 'light',
        'primary': '#123456',
        'onPrimary': '#FFFFFF',
        'primaryContainer': '#123456',
        'onPrimaryContainer': '#FFFFFF',
        'secondary': '#123456',
        'onSecondary': '#FFFFFF',
        'secondaryContainer': '#123456',
        'onSecondaryContainer': '#FFFFFF',
        'tertiary': '#123456',
        'onTertiary': '#FFFFFF',
        'tertiaryContainer': '#123456',
        'onTertiaryContainer': '#FFFFFF',
        'error': '#123456',
        'onError': '#FFFFFF',
        'errorContainer': '#123456',
        'onErrorContainer': '#FFFFFF',
        'surface': '#FFFFFF',
        'onSurface': '#123456',
        'onSurfaceVariant': '#123456',
        'outline': '#123456',
        'outlineVariant': '#123456',
        'shadow': '#000000',
        'scrim': '#000000',
        'inverseSurface': '#123456',
        'onInverseSurface': '#FFFFFF',
        'inversePrimary': '#123456',
      },
      'semanticColors': {'informational': '#80112233'},
      'availableImages': [
        {
          'id': 'collection-floral-1',
          'assetPath': 'assets/skins/images/1.png',
          'format': 'png',
          'description': 'Floral guide',
        },
      ],
    });

    expect(skin.name, 'Test skin');
    expect(skin.primaryColor, const Color(0xFF123456));
    expect(skin.historyColor('addNote'), const Color(0x80112233));
    expect(skin.availableImages.single.id, 'collection-floral-1');
    expect(skin.availableImages.single.format, SkinImageFormat.png);
    expect(
      (skin.toJson()['colorScheme'] as Map<String, dynamic>)['primary'],
      'FF123456',
    );
    expect(skin.collectionImage(0)?.id, 'collection-floral-1');
    expect(skin.collectionImage(1)?.id, 'collection-floral-1');
  });

  test('collectionImage cycles across available images by id', () {
    const skin = AppSkin.defaultSkin;
    expect(skin.availableImages.length, 4);
    expect(skin.collectionImage(0)?.id, 'collection-floral-1');
    expect(skin.collectionImage(1)?.id, 'collection-floral-2');
    expect(skin.collectionImage(2)?.id, 'collection-floral-3');
    expect(skin.collectionImage(3)?.id, 'collection-floral-4');
    expect(skin.collectionImage(4)?.id, 'collection-floral-1');
  });

  test('rejects malformed color values', () {
    expect(
      () => AppSkin.fromJson({
        'name': 'Test skin',
        'colorScheme': {
          'brightness': 'light',
          'primary': 'not-a-color',
        },
        'semanticColors': <String, String>{},
      }),
      throwsFormatException,
    );
  });
}
