import 'package:core/core.dart';
import 'package:home/src/localization/home_localization.dart';

final homeLocalizationDelegate = HomeLocalizationDelegate(
  getPathFunction: (locale) =>
      getTransalationFilePath(packageName: 'home', locale: locale),
  supportedLocales: appSupportedLanguages,
);
