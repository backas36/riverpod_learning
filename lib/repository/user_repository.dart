import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

class UserRepository {
  Future<List<User>> fetchUsers() async {
    return const [
      User(id: 1, username: 'John', age: 20, email: 'john@example.com'),
      User(id: 2, username: 'Jane', age: 21, email: 'jane@example.com'),
      User(id: 3, username: 'Jim', age: 22, email: 'jim@example.com'),
      User(id: 4, username: 'Jill', age: 23, email: 'jill@example.com'),
      User(id: 5, username: 'Jack', age: 24, email: 'jack@example.com'),
    ];
  }
}
