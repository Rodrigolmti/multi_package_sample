import 'dart:async';

import 'package:core/core.dart';
import 'package:splash/src/ui/cubit/splash_cubit.dart';

class SplashInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  }) async {
    //VIEW
    injector.registerFactory(
      () => SplashCubit(),
    );
  }
}
