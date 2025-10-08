import 'package:flutter/material.dart';

class Timerpomodoro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Pomodoro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(), 
          ],
        ),
      ),
    );
  }
}
