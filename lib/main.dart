import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/questions.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  final String title = 'Feelgood Questions';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> questions = ref.watch(questionsProvider);
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
  final _random = Random();

  void _incrementCounter() {
    setState(
      () {
        if (_counter < widget.questions.length - 1) {
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
              '#$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              widget.questions[_random.nextInt(widget.questions.length)],
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.navigate_next_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
