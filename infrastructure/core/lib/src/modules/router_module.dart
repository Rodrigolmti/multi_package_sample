import 'package:flutter/material.dart';

class RouteMissingArgsFailure implements Exception {}

T getArgsOrThrow<T>(Object? arguments) {
  if (arguments == null) {
    throw RouteMissingArgsFailure();
  }

  return arguments as T;
}

T? tryToGetArgsOrIgnore<T>(Object? arguments) {
  if (arguments != null) {
    return arguments as T;
  }

  return null;
}

abstract class RouterModule {
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings);
}
