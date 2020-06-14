import 'pages/member.dart';
import 'pages/brewcoffee.dart';
import 'pages/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MemberPage(),
      routes: <String, WidgetBuilder> {
        '/member': (BuildContext context) => new MemberPage(),
        '/login': (BuildContext context) => new LoginPage(),
        '/fill': (BuildContext context) => new BrewCoffeePage()
      },
    );
  }
}
