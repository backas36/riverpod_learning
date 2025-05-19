import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/view_model/user_view_model.dart';

import '../model/user.dart';

class UserDetailScreen02 extends StatelessWidget {
  const UserDetailScreen02({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // 如果要在 StatelessWidget 中使用 ref, 則需要用 Consumer 來 Wrap
        final users = ref.watch(
          userViewModelProvider.select((state) => state.users),
        );
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref
                    .read(userViewModelProvider.notifier)
                    .addUser(
                      User(
                        id: 1,
                        username: 'John Doe',
                        age: 20,
                        email: 'john.doe@example.com',
                      ),
                    );
              },
              child: const Text('Click Me!'),
            ),
          ],
        );
      },
    );
  }
}

// ConsumerWidget：
// - 適合用於不需要管理狀態的 widget，可以直接使用 ref 來監聽 provider。
// ConsumerStatefulWidget：
// - 適合用於需要管理狀態的 widget，可以在 State 中使用 ref 來監聽 provider。
class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ConsumerWidget 只能在這裡取得 ref, 如果是 ConsumerStatefulWidget 可以在 build 外面取得 ref
    final users = ref.watch(
      userViewModelProvider.select((state) => state.users),
    );

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _onPressed(ref);
          },
          child: const Text('Click Me!'),
        ),
      ],
    );
  }

  void _onPressed(WidgetRef ref) {
    log("I can use outside of build");
  }
}
