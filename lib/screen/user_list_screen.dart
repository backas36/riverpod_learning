import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/view_model/user_view_model.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  @override
  void initState() {
    super.initState();
    log("UserListScreen initState");
    // addPostFrameCallback is called after the build method is called
    // 使用 addPostFrameCallback 可以確保 fetchUsers() 在 widget 完全建立後，下一幀開始前執行，避免不必要的重建。
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(userViewModelProvider.notifier).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    log("UserListScreen build");
    final usersViewModel = ref.watch(userViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('User List Screen')),
      body:
          usersViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: usersViewModel.users.length,
                itemBuilder: (context, index) {
                  final user = usersViewModel.users[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(user.username),
                      subtitle: Text(
                        'ID: ${user.id}, Age: ${user.age}, Email: ${user.email}',
                      ),
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_user');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
