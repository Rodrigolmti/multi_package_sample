import 'package:core/core.dart';
import 'package:login/src/localization/login_localization.dart';

final loginLocalizationDelegate = LoginLocalizationDelegate(
  getPathFunction: (locale) =>
      getTransalationFilePath(packageName: 'login', locale: locale),
  supportedLocales: appSupportedLanguages,
);
