import 'package:core/src/modules/injection_module.dart';
import 'package:core/src/modules/router_module.dart';
import 'package:flutter/material.dart';

abstract class FeatureResolver {
  RouterModule? get routerModule => null;

  LocalizationsDelegate? get localeDelegate => null;

  InjectionModule? get injectionModule => null;
}
