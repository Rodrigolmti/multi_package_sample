import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:splash/src/ui/splash_screen.dart';

class SplashRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute>{
        SplashRoutes.root: MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        ),
      };
}
