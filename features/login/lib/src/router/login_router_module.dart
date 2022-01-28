import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:login/src/ui/login_screen.dart';

class LoginRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute>{
        LoginRoutes.root: MaterialPageRoute(
          builder: (_) => LoginScreen(),
          settings: settings,
        ),
      };
}
