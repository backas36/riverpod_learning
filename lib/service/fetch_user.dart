import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_learning/repository/user_repository.dart';

import '../model/user.dart';

//final fetchUserProvider = Provider<FetchUser>((ref) {
//  final userRepository = ref.watch(userRepositoryProvider);
//  return FetchUser(userRepository);
//});

part 'fetch_user.g.dart';

@riverpod
FetchUser fetchUser(Ref ref) {
  return FetchUser(ref.watch(userRepositoryProvider));
}

class FetchUser {
  final UserRepository userRepository;

  FetchUser(this.userRepository);

  Future<List<User>> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 3));
    return await userRepository.fetchUsers();
  }
}
