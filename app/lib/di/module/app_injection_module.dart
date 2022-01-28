import 'dart:async';

import 'package:core/core.dart';
import 'package:multi_package_sample/analytics/app_analytics_receiver.dart';

class AppInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    injector
      ..registerSingleton<AnalyticsLogger>(AppAnalyticsReceiver())
      ..registerSingleton<BuildConfig>(buildConfig);
  }
}
