import 'dart:async';

import 'package:core/core.dart';

/// This is just a wrapper class that iterate throught the injection modules
/// and add each dependency into the injection container.
class AppInjectionComponent {
  AppInjectionComponent._();

  static AppInjectionComponent instance = AppInjectionComponent._();

  Future<void> registerModules({
    required List<InjectionModule> modules,
    required BuildConfig config,
  }) async {
    for (final module in modules) {
      await module.registerDependencies(
        injector: AppInjector.I,
        buildConfig: config,
      );
    }
  }
}
