import 'package:barista_app/background/ctlAccount.dart';
import 'package:barista_app/pages/brewCoffee.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:barista_app/pages/SettingAccount.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<MemberPage> with RouteAware {

  Set _memberSet;
  String _username;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ControlMemberDatabase ctrMemberDb;
    return Scaffold(
      appBar: AppBar(
        title: Text('Member'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot <SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            ctrMemberDb = ControlMemberDatabase(snapshot.data);
            _memberSet = ctrMemberDb.readMemberSet();
          }
          else {
            return CircularProgressIndicator();
          }
          return _memberListView(context);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => _pushDialog(ctrMemberDb),
        ),
        tooltip: 'add account',
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.person_add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orangeAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Member'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setting'),
          )
        ],
        onTap: (index) {
          switch(index) {
            case 0: {
              break;
            }
            case 1: {
              Navigator.of(context).pushNamed('/login');
              break;
            }
          }
        },
        currentIndex: _currentIndex = 0,
      ),
    );
  }

  Widget _memberListView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2.0,
                      color: Colors.grey
                  )
              )
          ),
          child: ListTile(
            title: Text('${index + 1}. ${_memberSet.elementAt(index).toString()}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontFamily: 'FuturaRound',
                fontWeight: FontWeight.w600,
              ),),
            onTap: () {
              Navigator.push(
                  this.context,
                  MaterialPageRoute(
                      builder: (context) => BrewCoffeePage(
                        usernamePage: _memberSet.elementAt(index).toString(),
                      )
                  )
              );
            },
            onLongPress: () {
              setState(() {
                Navigator.push(
                    this.context,
                    MaterialPageRoute(
                      builder: (context) => SettingAccountPage(
                        username: _memberSet.elementAt(index).toString(),
                      ),
                    )
                );
              });
            },
          ),
        );
      },
      itemCount: _memberSet.length ?? 0,
    );
  }

  AlertDialog _pushDialog(ControlMemberDatabase _controlMemberDatabese) {
    return AlertDialog(
      title: Text('Enter your account name'),
      content: Container(
        child: TextFormField(
          cursorColor: Colors.grey,
          autofocus: true,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.orangeAccent,
            ),
            labelText: 'Account Name',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orangeAccent,
                )
            ),
          ),
          maxLength: 16,
          maxLengthEnforced: false,
          maxLines: 1,
          onChanged: (value){_username = value;},
        ),
      ),
      actions: [
        FlatButton(
          child: Text('OK', style: TextStyle(color: Colors.orangeAccent,),),
          onPressed: () {
            setState(() {
              _controlMemberDatabese.addMember(_username);
            });
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}