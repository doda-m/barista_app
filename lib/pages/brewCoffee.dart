import 'package:flutter/material.dart';
import 'package:barista_app/background/ctlAccount.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrewCoffeePage extends StatefulWidget {
  final String usernamePage;
  BrewCoffeePage({Key key, this.usernamePage}): super(key: key);

  @override
  _BrewCoffeeState createState() => _BrewCoffeeState(usernamePage);
}

class _BrewCoffeeState extends State<BrewCoffeePage> {
  final String username;
  _BrewCoffeeState(this.username);
  static ControlMemberDatabase _ctrMemberDb;
  int _counter;

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
        _ctrMemberDb.setCounter(username, _counter);
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _ctrMemberDb.setCounter(username, _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPage'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot <SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            _ctrMemberDb = ControlMemberDatabase(snapshot.data);
//            debugPrint(username);
            _counter = _ctrMemberDb.readCounter(username);
          }
          else {
            return CircularProgressIndicator();
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Total:',
                ),
                Text(
                  '$_counter',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                ),
                SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: RaisedButton(
                      child: Text('BREW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          )
                      ),
                      color: Colors.orangeAccent,
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Colors.orange,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      onPressed: _incrementCounter
                  ),
                ),
                SizedBox(
                  width: 120.0,
                  height: 50.0,
                  child: RaisedButton(
                      child: Text('cancel',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 22,
                          )
                      ),
                      color: Colors.white60,
                      onPressed: _decrementCounter
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}
