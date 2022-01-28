import 'package:flutter/material.dart';
import 'package:home/src/localization/home_localization.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeLocalization _intl;

  @override
  Widget build(BuildContext context) {
    _intl = HomeLocalization.of(context);

    return Scaffold(
      body: Center(
        child: Text(_intl.tr('home_screen.title')),
      ),
    );
  }
}
