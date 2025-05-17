import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/providers/user_notifier_provider.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  late TextEditingController _userController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    log("UserScreen dispose");
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('User Input')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: _userController,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(userNotifierProvider.notifier)
                          .update(_userController.text);
                      _userController.clear();
                    },
                    child: const Text('Add User'),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: Text("User: $user")),
          ],
        ),
      ),
    );
  }
}
