// ignore_for_file: avoid_print

import 'package:core/core.dart';

class AppAnalyticsReceiver implements AnalyticsLogger {
  /// Inject here the instance of Firebase for example and log your events

  @override
  void logEvent(String name, [Map<String, String?>? params]) {
    print(name);
  }
}
