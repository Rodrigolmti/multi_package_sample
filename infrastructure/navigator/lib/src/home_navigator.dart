import 'package:flutter/material.dart';

class HomeRoutes {
  HomeRoutes._();

  static const String root = '/home';
}

abstract class HomeNavigator {
  void navigateToRoot(BuildContext context);
}
