import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final String title = 'Gratitude Questions';
  final List<String> questions = [
    "What is something that made you laugh?",
    "What are you grateful for about the current season?",
    "What smell are you grateful for?",
    "What is something that made you smile?",
    "What sound are you grateful for?",
    "What about your career or work are you grateful for?",
    "What freedoms are you grateful for?",
    "What one thing are you grateful for about yourself?",
    "What in nature are you grateful for?",
    "What song or music are you grateful for?",
    "Who inspires you?",
    "What opportunity are you grateful for?",
    "What about your upbringing are you grateful for?",
    "Who is a friend that you are grateful for?",
    "What makes you happy to be alive?",
    "What place are you grateful for?",
    "What is something that always cheers you up?",
    "What memory are you grateful for?",
    "Did somebody help you on this day? If so, who. How did they help you?",
    "What small thing are you grateful for?",
    "What is something about your body or your health that you are grateful for?",
    "What hobbies are you grateful for?",
    "What made you feel happy today?",
    "What are you grateful for about your family?",
    "What is the most beautiful thing you saw today?",
    "What is something that makes your life easier?",
    "What is something to be grateful for in this room?",
    "What book are you grateful for? ",
    "Who is somebody that helped you?",
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: title,
        questions: questions,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.questions})
      : super(key: key);
  final String title;
  final List<String> questions;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(
      () {
        if (_counter < widget.questions.length) {
          _counter++;
        } else {
          _counter = 0;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.questions[_counter],
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
