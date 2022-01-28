import 'dart:async';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:login/src/router/app_login_navigator.dart';

class LoginInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    injector
        // PRESENTATION
        .registerFactory<LoginNavigator>(() => AppLoginNavigator());
  }
}
