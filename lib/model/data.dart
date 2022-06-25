import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider(
  (ref) => 'Gratitude Questions',
);

final questionsProvider = Provider(
  ((ref) => questions),
);

final questions = [
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

final counterProvider = StateProvider<Counter>(
  (ref) => Counter(),
);

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  int _count = 0;
  int get count => _count;
  set count(int val) {
    if (val >= 0) {
      _count = val;
    } else {
      _count = _count;
    }
  }

  void reset() => _count = 0;

  void increment() => _count++;

  void decrement() {
    if (_count >= 0) {
      _count--;
    }
  }
}
