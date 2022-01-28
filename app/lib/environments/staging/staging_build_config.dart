import 'package:core/core.dart';

class StagingBuildConfig extends BuildConfig {
  @override
  // ignore: overridden_fields
  Map<String, dynamic> configs = {
    'analyticsLogs': true,
  };
}
