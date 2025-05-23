import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../providers/async_user_provider.dart';

class FutureUserScreen extends ConsumerStatefulWidget {
  const FutureUserScreen({super.key});

  @override
  ConsumerState<FutureUserScreen> createState() => _FutureUserScreenState();
}

class _FutureUserScreenState extends ConsumerState<FutureUserScreen> {
  @override
  Widget build(BuildContext context) {
    //final users = ref.watch(fetchUsersProvider);
    final users = ref.watch(asyncUserProvider);
    return Scaffold(
      body: users.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data:
            (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final user = data[index];
                return ListTile(
                  title: Text(user.username),
                  subtitle: Text(user.email),
                );
              },
            ),
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }
}
