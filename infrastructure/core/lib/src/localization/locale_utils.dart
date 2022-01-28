import 'package:flutter/material.dart';

String getTransalationFilePath({
  required Locale locale,
  String? packageName,
}) =>
    packageName != null
        ? 'packages/$packageName/assets/i18n/${locale.languageCode}-${locale.countryCode}.json'
        : 'assets/i18n/${locale.languageCode}-${locale.countryCode}.json';
