import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'admin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  Future<AuthResult> _signIn(String email, String password) async {
    AuthResult result;
    try {
      result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print("User id is ${result.user.uid}");
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminPage()
        )
      );
    }
    catch(e) {
      print('error: $e');
      showDialog(
          context: context,
          builder: (BuildContext context) => _pushDialog(),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
        backgroundColor: Colors.orangeAccent,
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
                  controller: emailInputController,
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                  validator: (value) => value.isEmpty ? 'User Id can\'t be empty' : null,
                ),
                const SizedBox(height: 24.0),
                new TextFormField(
                  controller: passwordInputController,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
                ),
                const SizedBox(height: 24.0),
                new Center(
                  child: RaisedButton(
                    child: Text('Login'),
                    onPressed: () {
                      var email = emailInputController.text;
                      var password = passwordInputController.text;
                      return _signIn(email, password);
//                          .then((AuthResult result) => print(result.user))
//                          .catchError((e) => print(e));
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  AlertDialog _pushDialog() {
    return AlertDialog(
      title: Text('Email address or Password was wrong.'),
      actions: [
        FlatButton(
          child: Text('OK', style: TextStyle(color: Colors.orangeAccent,),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
