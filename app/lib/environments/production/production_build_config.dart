import 'package:core/core.dart';

class ProductionBuildConfig extends BuildConfig {
  @override
  // ignore: overridden_fields
  Map<String, dynamic> configs = {
    'analyticsLogs': false,
  };
}
