import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerStatefulWidget {
  const CounterScreen({super.key});

  @override
  ConsumerState<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends ConsumerState<CounterScreen> {
  int _counter = 0;
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
                  child: Column(
                    children: [
                      Text(
                        'You have pushed the button this many times:',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w400, // 更細
                          height: 1.4,
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '$_counter',
                        style: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w700, // 適中
                          color: theme.primaryColor,
                          fontSize: 54,
                          letterSpacing: 4.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      FloatingActionButton(
                        heroTag: 'decrement',
                        onPressed: () {
                          setState(() {
                            _counter--;
                          });
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
                  const SizedBox(width: 56),
                  Column(
                    children: [
                      FloatingActionButton(
                        heroTag: 'increment',
                        onPressed: () {
                          setState(() {
                            _counter++;
                          });
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
