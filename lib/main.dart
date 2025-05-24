import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/screen/user_screen.dart';

import 'screen/add_user_screen.dart';
import 'screen/counter_screen.dart';
import 'screen/future_user_screen.dart';
import 'screen/start_up_screen.dart';
import 'screen/stream_user_screen.dart';
import 'screen/user_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: StartUpScreen(
        flavour: 'dev',
        builder: (context) {
          // 這裡可以直接 return 你想要的首頁 widget
          return const StreamUserScreen();
        },
      ),
      routes: {
        '/counter': (context) => const CounterScreen(),
        '/user': (context) => const UserScreen(),
        '/user_list': (context) => const UserListScreen(),
        '/add_user': (context) => const AddUserScreen(),
        '/future_user': (context) => const FutureUserScreen(),
        '/stream_user': (context) => const StreamUserScreen(),
      },
    );
  }
}
