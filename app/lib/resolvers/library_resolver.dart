import 'package:core/core.dart';
import 'package:multi_package_sample/di/module/app_library_module.dart';

class LibraryResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => AppLibraryModule();
}
