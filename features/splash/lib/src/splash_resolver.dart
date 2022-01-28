import 'package:core/core.dart';
import 'package:splash/src/di/splash_injection.dart';
import 'package:splash/src/router/splash_router_module.dart';

class SplashResolver extends FeatureResolver {
  @override
  InjectionModule? get injectionModule => SplashInjectionModule();

  @override
  RouterModule? get routerModule => SplashRouterModule();
}
