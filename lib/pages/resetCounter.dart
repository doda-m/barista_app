import 'package:flutter/material.dart';
import 'package:barista_app/background/ctlAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetCounterPage extends StatelessWidget {
  static ControlMemberDatabase _ctrMemberDb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Counter'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot <SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            _ctrMemberDb = ControlMemberDatabase(snapshot.data);
          }
          else {
            return CircularProgressIndicator();
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Do you really reset all counters?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 70.0,
                  child: RaisedButton(
                    child: Text('Reset All',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        )
                    ),
                    color: Colors.redAccent,
                    onPressed: () {
                      _ctrMemberDb.resetCounter();
                      Navigator.of(context).pop();
//                      Navigator.of(context).pushReplacementNamed('/member');
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
