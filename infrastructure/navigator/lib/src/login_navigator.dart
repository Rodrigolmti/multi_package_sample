import 'package:flutter/material.dart';

class LoginRoutes {
  LoginRoutes._();

  static const String root = '/login';
}

abstract class LoginNavigator {
  void navigateToRoot(BuildContext context);
}
