import 'package:flutter/material.dart';
import 'package:barista_app/background/ctlAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RenameAccountPage extends StatelessWidget {
  final String oldName;
  RenameAccountPage({Key key, this.oldName}): super(key: key);
  static ControlMemberDatabase _ctrMemberDb;
  static String _newName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rename Your Account'),
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
                  'Enter your new account name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.orangeAccent,
                      ),
                      labelText: 'New Account Name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orangeAccent,
                          )
                      ),
                    ),
                    maxLength: 16,
                    maxLengthEnforced: false,
                    maxLines: 1,
                    onChanged: (value) => _newName = value,
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: RaisedButton(
                    child: Text('Rename',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        )
                    ),
                    color: Colors.orangeAccent,
                    onPressed: () {
                      if (_ctrMemberDb.renameMember(oldName, _newName)) {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.of(context).pushReplacementNamed('/member');
                      }
                      else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('This name has already used'),
                            titleTextStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15,
                            ),
                          )
                        );
                      }
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
