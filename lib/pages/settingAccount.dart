import 'package:barista_app/pages/deleteAccount.dart';
import 'package:barista_app/pages/renameAccount.dart';
import 'package:flutter/material.dart';

class SettingAccountPage extends StatelessWidget with RouteAware{
  final String username;
  SettingAccountPage({Key key, this.username}): super(key: key);

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RenameAccountPage(
                            oldName: username
                        )
                    ),
                  );
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
                    ),
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