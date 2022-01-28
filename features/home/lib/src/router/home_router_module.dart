import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/home_screen.dart';

class HomeRouterModule implements RouterModule {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) =>
      <String, MaterialPageRoute>{
        HomeRoutes.root: MaterialPageRoute(
          builder: (_) => HomeScreen(),
          settings: settings,
        ),
      };
}
