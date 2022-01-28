import 'package:core/core.dart';

import 'package:multi_package_sample/di/module/app_injection_module.dart';

class AppResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => AppInjectionModule();
}
