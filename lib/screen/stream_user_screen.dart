import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';
import '../providers/stream_user_provider.dart';

class StreamUserScreen extends ConsumerStatefulWidget {
  const StreamUserScreen({super.key});

  @override
  ConsumerState<StreamUserScreen> createState() => _StreamUserScreenState();
}

class _StreamUserScreenState extends ConsumerState<StreamUserScreen> {
  List<User> usersList = [];
  @override
  Widget build(BuildContext context) {
    final users = ref.watch(streamUserProvider);
    //final users = ref.watch(userStreamProvider);
    return Scaffold(
      body: users.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          usersList.addAll(data);
          return ListView.builder(
            itemCount: usersList.length,
            itemBuilder: (context, index) {
              final user = usersList[index];
              return ListTile(
                title: Text(user.username),
                subtitle: Text(user.email),
              );
            },
          );
        },
        error: (error, stack) => Center(child: Text(error.toString())),
      ),
    );
  }
}
