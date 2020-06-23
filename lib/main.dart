import 'package:barista_app/pages/deleteAccount.dart';
import 'package:barista_app/pages/renameAccount.dart';
import 'package:barista_app/pages/settingAccount.dart';

import 'pages/member.dart';
import 'pages/brewCoffee.dart';
import 'pages/login.dart';
import 'package:flutter/material.dart';
import 'pages/settingAccount.dart';
import 'pages/deleteAccount.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MATLAB-BARISTA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MemberPage(),
      routes: <String, WidgetBuilder> {
        '/member': (BuildContext context) => new MemberPage(),
        '/settingAccount': (BuildContext context) => new SettingAccountPage(),
        '/deleteAccount': (BuildContext context) => new DeleteAccountPage(),
        '/renameAccount': (BuildContext context) => new RenameAccountPage(),
        '/login': (BuildContext context) => new LoginPage(),
        '/brewCoffee': (BuildContext context) => new BrewCoffeePage()
      },
      navigatorObservers: <NavigatorObserver>[routeObserver],
    );
  }
}
