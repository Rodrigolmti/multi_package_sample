import 'package:multi_package_sample/environments/app_start.dart';
import 'package:multi_package_sample/environments/staging/staging_build_config.dart';

class StagingApp extends AppStart {
  StagingApp() : super(StagingBuildConfig());
}

Future<void> main() => StagingApp().startApp();
