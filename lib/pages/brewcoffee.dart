import 'package:flutter/material.dart';

class BrewCoffeePage extends StatefulWidget {
  @override
  _BrewCoffeeState createState() => _BrewCoffeeState();
}

class _BrewCoffeeState extends State<BrewCoffeePage> {
  int _counter = 0;

  void _gotologinpage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPage'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
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
      ),
    );
  }
}
