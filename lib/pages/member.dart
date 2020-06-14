import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<MemberPage> {

  List listItem = ["one","two","three"];
  String _username;

  AlertDialog _pushDialog() {
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
          child: Text('OK', style: TextStyle( color: Colors.orangeAccent, ), ),
          onPressed: () => Navigator.of(context).pop(_username),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('$index'),
              subtitle: Text(listItem[index].toString()),
              onTap: () => Navigator.of(context).pushNamed('/fill'),
              onLongPress: null,
            );
          },
          itemCount: listItem.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => _pushDialog(),
        ),
        tooltip: 'add account',
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}