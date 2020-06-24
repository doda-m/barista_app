import 'package:flutter/material.dart';
import 'resetCounter.dart';

class AdminPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Setting'),
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
                    child: Text('null',
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
                  child: Text('Reset Counter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),),
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetCounterPage()
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