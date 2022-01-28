import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class AppSignInNavigator with AppNavigator implements SplashNavigator {
  @override
  void navigateToSplash(BuildContext context) =>
      navigateTo(context, SplashRoutes.root);
}
