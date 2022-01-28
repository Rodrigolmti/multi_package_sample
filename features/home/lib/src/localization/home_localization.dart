import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class HomeLocalization extends BaseLocalization {
  HomeLocalization({
    required this.appLocale,
    required this.appPathFunction,
  }) : super(appPathFunction: appPathFunction, locale: appLocale);
  @override
  // ignore: overridden_fields
  final String Function(Locale locale) appPathFunction;
  final Locale appLocale;

  static HomeLocalization of(BuildContext context) =>
      Localizations.of<HomeLocalization>(context, HomeLocalization)!;
}

class HomeLocalizationDelegate extends LocalizationsDelegate<HomeLocalization> {
  HomeLocalizationDelegate({
    required this.supportedLocales,
    required this.getPathFunction,
    this.debugLogs = true,
  });

  final List<Locale> supportedLocales;

  final String Function(Locale locale) getPathFunction;

  late Locale locale;

  final bool debugLogs;

  @override
  bool isSupported(Locale locale) =>
      getSupportedLocaleForLanguageCode(supportedLocales, locale) != null;

  @override
  Future<HomeLocalization> load(Locale locale) async {
    this.locale = locale;
    final localization = HomeLocalization(
      appLocale: locale,
      appPathFunction: getPathFunction,
    );

    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(HomeLocalizationDelegate old) => old.locale != locale;
}
