import 'package:flutter/material.dart';
import 'package:barista_app/background/ctlAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteAccountPage extends StatefulWidget {
  final String username;
  DeleteAccountPage({Key key, this.username}): super(key: key);

  @override
  _DeleteAccountState createState() => _DeleteAccountState(username);
}

class _DeleteAccountState extends State<DeleteAccountPage> {
  final String usernameState;
  _DeleteAccountState(this.usernameState);
  ControlMemberDatabase ctrMemberDb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Your Account'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot <SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            ctrMemberDb = ControlMemberDatabase(snapshot.data);
          }
          else {
            return CircularProgressIndicator();
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Do you really delete your account?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 70.0,
                  child: RaisedButton(
                    child: Text('Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        )
                    ),
                    color: Colors.redAccent,
                    onPressed: () {
                      setState(() {
                        ctrMemberDb.deleteMember(usernameState);
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.of(context).pushReplacementNamed('/member');
                      });
                    },
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
