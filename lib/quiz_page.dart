import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  double _hoursSlept = 0;
  double _painLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hours Slept: ${_hoursSlept.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _hoursSlept,
              min: 0,
              max: 12,
              divisions: 12,
              onChanged: (value) {
                setState(() {
                  _hoursSlept = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Pain Level: ${_painLevel.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _painLevel,
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _painLevel = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Additional Comments:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your comments here',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Handle quiz submission
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}