import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class SJa extends S {
  SJa([String locale = 'ja']) : super(locale);

  @override
  String get app_name => '木漏れ日';
}

/// The translations for Japanese, as used in Japan (`ja_JP`).
class SJaJp extends SJa {
  SJaJp(): super('ja_JP');

  @override
  String get app_name => '木漏れ日';
}
