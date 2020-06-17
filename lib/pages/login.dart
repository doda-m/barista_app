import 'brewCoffee.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {

  final formKey = new GlobalKey<FormState>();

  String _userid;
  String _password;

  void _gotohomepage() {
    Navigator.of(context).pushReplacementNamed('/fill');
  }

  void ValidationAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            settings: const RouteSettings(name: 'fill'),
            builder: (context) {
              return BrewCoffeePage();
            }
        ),
      );
    }
    else {
      print('wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new Center(
        child: new Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'User ID',
                  ),
                  validator: (value) => value.isEmpty ? 'User Id can\'t be empty' : null,
                  onSaved: (value) => _userid = value,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                  onSaved: (value) => _password = value,
                ),
                const SizedBox(height: 24.0),
                new Center(
                  child: RaisedButton(
                    child: Text('Login'),
                    onPressed: _gotohomepage,
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
