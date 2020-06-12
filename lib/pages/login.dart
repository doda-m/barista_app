import 'home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Navigator'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Login'),
                RaisedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        settings: const RouteSettings(
                          name: '/flutter'
                        ),
                        builder: (context) {
                          return MyHomePage();
                        }
                      ),
//                  child: new Text("Welcome to Home"),
                  )
                )
              ]
          ),
        ),
      ),
    );
  }
}
