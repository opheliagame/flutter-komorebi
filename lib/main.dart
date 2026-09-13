import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_komorebi/src/core/l10n/generated/app_localizations.dart';
import 'package:flutter_komorebi/src/design_system/skins/app_skin.dart';
import 'package:flutter_komorebi/src/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final skin = await AppSkinLoader.loadFromAsset('assets/skins/komorebi.json');

  runApp(
    ProviderScope(
      overrides: [appSkinProvider.overrideWith((ref) => skin)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = useMemoized(() => AppRouter());

    final skin = ref.watch(appSkinProvider);

    final isApplePlatform =
        defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS;

    if (isApplePlatform) {
      return CupertinoApp.router(
        title: S.of(context)?.app_name ?? 'Kiritori',
        theme: skin.cupertinoTheme(),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        locale: const Locale('en'),
        routerConfig: appRouter.config(),
      );
    }

    return MaterialApp.router(
      title: S.of(context)?.app_name,
      theme: skin.materialTheme(),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      locale: const Locale('en'),
      routerConfig: appRouter.config(),
    );
  }
}
