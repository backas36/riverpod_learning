import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/counter_async_notifier_provider.dart';

//> https://riverpod.dev/docs/providers/state_provider
class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final counter = ref.watch(counterStateProvider);
    //final counter = ref.watch(counterNotifierProvider);
    final counterAsync = ref.watch(counterAsyncNotifierProvider);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA), // 柔和背景色
      appBar: AppBar(
        title: Text(
          'Counter Screen',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600, // 較細
            letterSpacing: 2.0,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        backgroundColor: theme.primaryColor,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Counter',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600, // 較細
                  color: theme.primaryColorDark,
                  fontSize: 36,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 48,
                  ),
                  child: counterAsync.when(
                    data: (data) {
                      return Column(
                        children: [
                          Text(
                            'You have pushed the button this many times:',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[600],
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                              letterSpacing: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '$data',
                            style: theme.textTheme.displayMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: theme.primaryColor,
                              fontSize: 54,
                              letterSpacing: 4.0,
                            ),
                          ),
                        ],
                      );
                    },
                    error:
                        (error, stack) => Container(
                          height: 120,
                          alignment: Alignment.center,
                          child: Text(error.toString()),
                        ),
                    loading:
                        () => Container(
                          height: 120,
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        FloatingActionButton(
                          heroTag: 'decrement',
                          onPressed: () {
                            //ref.read(counterStateProvider.notifier).state--;
                            ref
                                .read(counterAsyncNotifierProvider.notifier)
                                .decrement();
                          },
                          backgroundColor: Colors.redAccent,
                          elevation: 4,
                          child: const Icon(Icons.remove, size: 32),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Decrease',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // 較細
                            color: Colors.redAccent,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        FloatingActionButton(
                          heroTag: 'increment',
                          onPressed: () {
                            //ref.read(counterStateProvider.notifier).state++;
                            ref
                                .read(counterAsyncNotifierProvider.notifier)
                                .increment();
                          },
                          backgroundColor: Colors.green,
                          elevation: 4,
                          child: const Icon(Icons.add, size: 32),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Increase',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // 較細
                            color: Colors.green,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        FloatingActionButton(
                          heroTag: 'reset',
                          onPressed: () {
                            ref
                                .read(counterAsyncNotifierProvider.notifier)
                                .reset();
                          },
                          backgroundColor: Colors.amber,
                          elevation: 4,
                          child: const Icon(Icons.refresh, size: 32),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // 較細
                            color: Colors.amber,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        FloatingActionButton(
                          heroTag: 'error',
                          onPressed: () {
                            ref
                                .read(counterAsyncNotifierProvider.notifier)
                                .beError();
                          },
                          backgroundColor: Colors.blueAccent,
                          elevation: 4,
                          child: const Icon(Icons.error, size: 32),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Error',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // 較細
                            color: Colors.blueAccent,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/user');
                },
                child: const Text('Go to User Input'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
