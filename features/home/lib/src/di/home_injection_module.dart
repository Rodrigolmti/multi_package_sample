import 'dart:async';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:home/src/router/app_home_navigator.dart';

class HomeInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    injector
        // PRESENTATION
        .registerFactory<HomeNavigator>(() => AppHomeNavigator());
  }
}
