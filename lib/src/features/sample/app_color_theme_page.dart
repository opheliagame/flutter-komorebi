import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_komorebi/src/design_system/app_color.dart';

@RoutePage()
class AppColorThemePage extends StatelessWidget {
  const AppColorThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final colors = <(String, Color, Color)>[
      ('primary', scheme.primary, scheme.onPrimary),
      ('onPrimary', scheme.onPrimary, scheme.primary),
      ('primaryContainer', scheme.primaryContainer, scheme.onPrimaryContainer),
      ('onPrimaryContainer', scheme.onPrimaryContainer, scheme.primaryContainer),
      ('primaryFixed', scheme.primaryFixed, scheme.onPrimaryFixed),
      ('primaryFixedDim', scheme.primaryFixedDim, scheme.onPrimaryFixed),
      ('onPrimaryFixed', scheme.onPrimaryFixed, scheme.primaryFixed),
      ('onPrimaryFixedVariant', scheme.onPrimaryFixedVariant, scheme.primaryFixed),
      ('secondary', scheme.secondary, scheme.onSecondary),
      ('onSecondary', scheme.onSecondary, scheme.secondary),
      ('secondaryContainer', scheme.secondaryContainer, scheme.onSecondaryContainer),
      ('onSecondaryContainer', scheme.onSecondaryContainer, scheme.secondaryContainer),
      ('secondaryFixed', scheme.secondaryFixed, scheme.onSecondaryFixed),
      ('secondaryFixedDim', scheme.secondaryFixedDim, scheme.onSecondaryFixed),
      ('onSecondaryFixed', scheme.onSecondaryFixed, scheme.secondaryFixed),
      ('onSecondaryFixedVariant', scheme.onSecondaryFixedVariant, scheme.secondaryFixed),
      ('tertiary', scheme.tertiary, scheme.onTertiary),
      ('onTertiary', scheme.onTertiary, scheme.tertiary),
      ('tertiaryContainer', scheme.tertiaryContainer, scheme.onTertiaryContainer),
      ('onTertiaryContainer', scheme.onTertiaryContainer, scheme.tertiaryContainer),
      ('tertiaryFixed', scheme.tertiaryFixed, scheme.onTertiaryFixed),
      ('tertiaryFixedDim', scheme.tertiaryFixedDim, scheme.onTertiaryFixed),
      ('onTertiaryFixed', scheme.onTertiaryFixed, scheme.tertiaryFixed),
      ('onTertiaryFixedVariant', scheme.onTertiaryFixedVariant, scheme.tertiaryFixed),
      ('error', scheme.error, scheme.onError),
      ('onError', scheme.onError, scheme.error),
      ('errorContainer', scheme.errorContainer, scheme.onErrorContainer),
      ('onErrorContainer', scheme.onErrorContainer, scheme.errorContainer),
      ('surface', scheme.surface, scheme.onSurface),
      ('onSurface', scheme.onSurface, scheme.surface),
      ('surfaceDim', scheme.surfaceDim, scheme.onSurface),
      ('surfaceBright', scheme.surfaceBright, scheme.onSurface),
      ('surfaceContainerLowest', scheme.surfaceContainerLowest, scheme.onSurface),
      ('surfaceContainerLow', scheme.surfaceContainerLow, scheme.onSurface),
      ('surfaceContainer', scheme.surfaceContainer, scheme.onSurface),
      ('surfaceContainerHigh', scheme.surfaceContainerHigh, scheme.onSurface),
      ('surfaceContainerHighest', scheme.surfaceContainerHighest, scheme.onSurface),
      ('onSurfaceVariant', scheme.onSurfaceVariant, scheme.surface),
      ('outline', scheme.outline, scheme.surface),
      ('outlineVariant', scheme.outlineVariant, scheme.surface),
      ('shadow', scheme.shadow, scheme.surface),
      ('scrim', scheme.scrim, scheme.surface),
      ('inverseSurface', scheme.inverseSurface, scheme.onInverseSurface),
      ('onInverseSurface', scheme.onInverseSurface, scheme.inverseSurface),
      ('inversePrimary', scheme.inversePrimary, scheme.primary),
      ('surfaceTint', scheme.surfaceTint, scheme.onSurface),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Color Theme')),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final (name, bg, fg) = colors[index];
          return _ColorTile(name: name, background: bg, foreground: fg);
        },
      ),
    );
  }
}

class _ColorTile extends StatelessWidget {
  const _ColorTile({
    required this.name,
    required this.background,
    required this.foreground,
  });

  final String name;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    /// color with opacity information
    final hex = background.hex;

    return Container(
      height: 56,
      color: background,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(color: foreground, fontWeight: FontWeight.w500),
          ),
          Text(
            hex,
            style: TextStyle(
              color: foreground,
              fontSize: 12,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}
