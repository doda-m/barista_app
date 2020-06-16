import 'package:barista_app/background/ctlAccount.dart';
import 'package:barista_app/pages/deleteAccount.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingAccountPage extends StatelessWidget with RouteAware{
  final String username;
  final ControlMemberDatabase ctrMemberDb;
  SettingAccountPage({Key key, this.username, this.ctrMemberDb}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Account'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 300,
              height: 70,
              child: RaisedButton(
                child: Text('Rename',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),),
                color: Colors.orangeAccent,
                onPressed: () {
                  null;
                },
              )
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: RaisedButton(
                child: Text('Delete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),),
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DeleteAccountPage(
                            username: username,
                          )
                      )
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}