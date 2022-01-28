import 'dart:collection';
import 'dart:convert';

import 'package:flat/flat.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// Base class to create a Locale Delegate
class BaseLocalization {
  final Locale locale;

  final String Function(Locale locale) appPathFunction;

  final Map<String, dynamic> _strings = HashMap();

  final bool debugLogs;

  BaseLocalization({
    required this.locale,
    required this.appPathFunction,
    this.debugLogs = false,
  });

  static BaseLocalization of(BuildContext context) =>
      Localizations.of<BaseLocalization>(context, BaseLocalization)!;

  /// Initialize the locale-specific strings.
  /// It searchs for a string file in the
  /// provided appPathFunction and set them into the Intl.defaultLocale.
  Future<void> load() async {
    try {
      _print('Loading locale: $locale');
      final data = await rootBundle.loadString(appPathFunction(locale));
      final Map<String, dynamic> strings = json.decode(data);
      final flattenedStrings = flatten(strings);
      _strings.addAll(flattenedStrings);
      _print('Loaded ${_strings.keys.length} keys');

      final localeName = locale.countryCode?.isEmpty == null
          ? locale.languageCode
          : locale.toString();
      final canonicalLocaleName = Intl.canonicalizedLocale(localeName);
      Intl.defaultLocale = canonicalLocaleName;
    } catch (exception, stacktrace) {
      // ignore: avoid_print
      print(exception);
      // ignore: avoid_print
      print(stacktrace);
    }
  }

  /// Translate a given key to the current locale.
  /// You may also use the values and pluralCount
  /// to add more parameters to the translation.
  String tr(
    String key, {
    Map<String, String>? values,
    num? pluralCount,
  }) {
    String? message;
    if (pluralCount != null) {
      message = _loadPluralizedMessage(key, pluralCount);
    } else {
      message = _loadMessage(key);
    }

    if (message == null) {
      // ignore: avoid_print
      print('WARN [LOCALIZATION]: Could not find valid localization '
          'string for key $key, $locale');
      return key;
    }

    if (values != null) {
      return _formatReturnMessage(message, values);
    }

    return message;
  }

  String? _loadMessage(String key) {
    final value = _strings[key];

    if (value == null || (value is! String)) {
      return null;
    }

    return value;
  }

  String _loadPluralizedMessage(String key, num howMany) {
    final other = _loadMessage('$key.other');
    if (other == null) {
      throw Exception(
          '[LOCALIZATION]: When using [pluralCount], `$key.other` is required');
    }
    return Intl.plural(
      howMany,
      zero: _loadMessage('$key.zero'),
      one: _loadMessage('$key.one'),
      two: _loadMessage('$key.two'),
      few: _loadMessage('$key.few'),
      many: _loadMessage('$key.many'),
      other: other,
      locale: locale.toLanguageTag(),
    );
  }

  String _formatReturnMessage(String value, Map<String, String> arguments) {
    arguments.forEach(
      (formatKey, formatValue) =>
          // ignore: parameter_assignments
          value = value.replaceAll('{$formatKey}', formatValue),
    );
    return value;
  }

  void _print(Object obj) {
    if (debugLogs) {
      // ignore: avoid_print
      print(obj);
    }
  }
}
