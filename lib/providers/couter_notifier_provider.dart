import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);

class CounterNotifier extends Notifier<int> {
  static const initialValue = 999;
  @override
  int build() {
    return initialValue;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = initialValue;
  }

  void decrement() {
    state--;
  }
}
