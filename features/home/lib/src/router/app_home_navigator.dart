import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class AppHomeNavigator with AppNavigator implements HomeNavigator {
  @override
  void navigateToRoot(BuildContext context) => navigateTo(
        context,
        HomeRoutes.root,
        pushAndReplace: true,
        anchor: SplashRoutes.root,
      );
}
