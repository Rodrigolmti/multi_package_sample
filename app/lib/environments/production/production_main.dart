import 'dart:async';

import 'package:multi_package_sample/environments/app_start.dart';
import 'package:multi_package_sample/environments/production/production_build_config.dart';

class ProductionApp extends AppStart {
  ProductionApp() : super(ProductionBuildConfig());
}

Future<void> main() => ProductionApp().startApp();
