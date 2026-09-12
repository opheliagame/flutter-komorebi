import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter_komorebi/src/design_system/app_color.dart';
import 'package:flutter_komorebi/src/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = useMemoized(() => AppRouter());

    final seedColor = ref.watch(appColorSchemeSeedProvider);

    final isApplePlatform =
        defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS;

    if (isApplePlatform) {
      return CupertinoApp.router(
        title: S.of(context)?.app_name ?? 'Kiritori',
        theme: CupertinoThemeData(
          // Design system rule: no shadows, no blurs, no glass styling.
          primaryColor: seedColor,
          barBackgroundColor: CupertinoColors.systemBackground,
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
        ),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        locale: const Locale('en'),
        routerConfig: appRouter.config(),
      );
    }

    return MaterialApp.router(
      title: S.of(context)?.app_name,
      theme: ThemeData(
        // Design system rule: no shadows, no blurs, no glass styling.
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          dynamicSchemeVariant: DynamicSchemeVariant.expressive,
        ),
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
      ),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      locale: const Locale('en'),
      routerConfig: appRouter.config(),
    );
  }
}
