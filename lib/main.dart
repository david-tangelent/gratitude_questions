import 'package:flutter/material.dart';
// import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'model/data.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String title = 'Feelgood Questions';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  // final _random = Random();

  void _incrementCounter() {
    final count = ref.watch(counterProvider).count;
    final length = ref.watch(questionsProvider).length;
    setState(() {
      if (count < length - 1) {
        ref.watch(counterProvider).increment();
      } else {
        ref.watch(counterProvider).reset();
      }
    });
  }

  void _resetCounter() {
    setState(() {
      ref.read(counterProvider).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = ref.watch(questionsProvider);
    final title = ref.watch(titleProvider);
    final count = ref.watch(counterProvider).count;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '#${ref.read(counterProvider).count}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              questions[count],
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Next Question',
              child: const Icon(Icons.navigate_next_sharp),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Start Again',
        onPressed: _resetCounter,
        child: const Icon(Icons.restart_alt_rounded),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
