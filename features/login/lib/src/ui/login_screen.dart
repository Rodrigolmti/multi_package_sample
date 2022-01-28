import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';

import 'package:flutter/material.dart';
import 'package:login/src/analytics/login_analytics_logger.dart';
import 'package:login/src/localization/login_localization.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AnalyticsLogger _analyticsLogger = AppInjector.I.get();
  final HomeNavigator _homeNavigator = AppInjector.I.get();

  late LoginLocalization _intl;

  @override
  Widget build(BuildContext context) {
    _intl = LoginLocalization.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Spacer(),
          Text(_intl.tr('login_screen.title')),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _analyticsLogger.logEvent(LoginEvents.loginButtonClick);
                _homeNavigator.navigateToRoot(context);
              },
              child: Text(_intl.tr('login_screen.action')),
            ),
          ),
          const SizedBox(height: 16),
        ]),
      ),
    );
  }
}
