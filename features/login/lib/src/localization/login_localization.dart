import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

class LoginLocalization extends BaseLocalization {
  LoginLocalization({
    required this.appLocale,
    required this.appPathFunction,
  }) : super(appPathFunction: appPathFunction, locale: appLocale);
  @override
  // ignore: overridden_fields
  final String Function(Locale locale) appPathFunction;
  final Locale appLocale;

  static LoginLocalization of(BuildContext context) =>
      Localizations.of<LoginLocalization>(context, LoginLocalization)!;
}

class LoginLocalizationDelegate
    extends LocalizationsDelegate<LoginLocalization> {
  LoginLocalizationDelegate({
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
  Future<LoginLocalization> load(Locale locale) async {
    this.locale = locale;
    final localization = LoginLocalization(
      appLocale: locale,
      appPathFunction: getPathFunction,
    );

    await localization.load();

    return localization;
  }

  @override
  bool shouldReload(LoginLocalizationDelegate old) => old.locale != locale;
}
