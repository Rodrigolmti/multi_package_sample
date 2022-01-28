import 'package:common_dependencies/common_dependencies.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:splash/src/ui/cubit/splash_cubit.dart';
import 'package:splash/src/ui/cubit/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final LoginNavigator _loginNavigator = AppInjector.I.get();
  final HomeNavigator _homeNavigator = AppInjector.I.get();

  final SplashCubit _cubit = AppInjector.I.get();

  @override
  Widget build(BuildContext context) => BlocConsumer<SplashCubit, SplashState>(
        bloc: _cubit,
        listener: (_, state) {
          if (state.isUserAuthenticated) {
            _homeNavigator.navigateToRoot(context);
          } else {
            _loginNavigator.navigateToRoot(context);
          }
        },
        builder: (_, state) => Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.all(24),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
}
