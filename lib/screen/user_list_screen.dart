import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/view_model/user_view_model.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("UserListScreen build");
    final usersViewModel = ref.watch(userViewModelProvider);
    log(usersViewModel.toString());
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
