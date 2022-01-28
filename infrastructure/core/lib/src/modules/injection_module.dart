import 'dart:async';

import 'package:core/src/build_config.dart';
import 'package:core/src/injection/injector.dart';

abstract class InjectionModule {
  FutureOr<void> registerDependencies({
    required Injector injector,
    required BuildConfig buildConfig,
  });
}
