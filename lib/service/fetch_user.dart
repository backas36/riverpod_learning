import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/repository/user_repository.dart';

import '../model/user.dart';

final fetchUserProvider = Provider<FetchUser>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return FetchUser(userRepository);
});

class FetchUser {
  final UserRepository userRepository;

  FetchUser(this.userRepository);

  Future<List<User>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 3));
    return await userRepository.fetchUsers();
  }
}
