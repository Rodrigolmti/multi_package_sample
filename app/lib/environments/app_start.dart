import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:multi_package_sample/app/my_app.dart';
import 'package:multi_package_sample/di/app_component.dart';
import 'package:multi_package_sample/resolvers/app_resolver.dart';
import 'package:multi_package_sample/resolvers/library_resolver.dart';
import 'package:splash/go_splash.dart';

abstract class AppStart {
  final BuildConfig buildConfig;

  /// The order of initialization matters, make sure that the deps of you
  /// package were initialized before him, otherwhise you will end up with
  /// a exception from gitIt container.
  final resolvers = <FeatureResolver>[
    LibraryResolver(),

    // Features
    SplashResolver(),
    HomeResolver(),
    LoginResolver(),

    // App
    AppResolver(),
  ];

  AppStart(this.buildConfig);

  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    final routerModules = <RouterModule>[];

    final delegates = <LocalizationsDelegate>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
    final injections = <InjectionModule>[];

    for (final resolver in resolvers) {
      if (resolver.routerModule != null) {
        routerModules.add(resolver.routerModule!);
      }

      if (resolver.localeDelegate != null) {
        delegates.add(resolver.localeDelegate!);
      }

      if (resolver.injectionModule != null) {
        injections.add(resolver.injectionModule!);
      }
    }

    await AppInjectionComponent.instance.registerModules(
      config: buildConfig,
      modules: injections,
    );

    await runZonedGuarded<Future<void>>(
      () async {
        runApp(
          MyApp(
            routes: routerModules,
            localeDelegates: delegates,
          ),
        );
      },
      (_, __) {},
    );
  }
}
