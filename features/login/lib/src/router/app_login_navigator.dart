import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class AppLoginNavigator with AppNavigator implements LoginNavigator {
  @override
  void navigateToRoot(BuildContext context) => navigateTo(
        context,
        LoginRoutes.root,
        pushAndReplace: true,
        anchor: SplashRoutes.root,
      );
}
