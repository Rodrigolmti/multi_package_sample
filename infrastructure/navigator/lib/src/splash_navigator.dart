import 'package:flutter/material.dart';

class SplashRoutes {
  SplashRoutes._();

  static const String root = '/';
}

abstract class SplashNavigator {
  void navigateToSplash(BuildContext context);
}
