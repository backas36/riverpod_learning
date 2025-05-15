import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterAsyncNotifierProvider =
    AsyncNotifierProvider<CounterAsyncNotifier, int>(CounterAsyncNotifier.new);

class CounterAsyncNotifier extends AsyncNotifier<int> {
  static const initialValue = 8;
  @override
  FutureOr<int> build() async {
    final value = await Future.delayed(
      const Duration(seconds: 4),
      () => initialValue,
    );
    return value;
  }

  Future<void> increment() async {
    state = const AsyncLoading();
    final preValue = await Future.delayed(
      const Duration(seconds: 2),
      () => state.value ?? 0,
    );
    state = AsyncValue.data(preValue + 1);
  }

  Future<void> decrement() async {
    state = const AsyncLoading();
    final preValue = await Future.delayed(
      const Duration(seconds: 2),
      () => state.value ?? 0,
    );
    state = AsyncValue.data(preValue - 1);
  }

  Future<void> reset() async {
    state = const AsyncLoading();
    //state = await Future.delayed(
    //  const Duration(seconds: 2),
    //  () => AsyncValue.data(87),
    //);
    state = await AsyncValue.guard(() async {
      return Future.delayed(const Duration(seconds: 2), () => 888);
    });
  }

  Future<void> beError() async {
    state = const AsyncLoading();
    state = await Future.delayed(
      const Duration(seconds: 2),
      () => AsyncValue.error(Exception('Test Error!!!'), StackTrace.current),
    );
  }
}
