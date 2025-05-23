import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user.dart';

part 'async_user_provider.g.dart';

@riverpod
Future<List<User>> fetchUsers(Ref ref) async {
  await Future.delayed(const Duration(seconds: 2));
  const users = [
    User(
      id: 1,
      username: 'From fetchUsersJohn',
      age: 20,
      email: 'john@example.com',
    ),
    User(id: 2, username: 'Jane', age: 21, email: 'jane@example.com'),
    User(id: 3, username: 'Jim', age: 22, email: 'jim@example.com'),
    User(id: 4, username: 'Jill', age: 23, email: 'jill@example.com'),
    User(id: 5, username: 'Jack', age: 24, email: 'jack@example.com'),
    User(id: 6, username: 'Jill', age: 23, email: 'jill@example.com'),
    User(id: 7, username: 'Jack', age: 24, email: 'jack@example.com'),
    User(id: 8, username: 'Jill', age: 23, email: 'jill@example.com'),
    User(id: 9, username: 'Jack', age: 24, email: 'jack@example.com'),
    User(id: 10, username: 'Jill', age: 23, email: 'jill@example.com'),
  ];
  return users;
}

final asyncUserProvider = FutureProvider<List<User>>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  const users = [
    User(
      id: 1,
      username: 'From asyncUserProvider John',
      age: 20,
      email: 'john@example.com',
    ),
    User(id: 2, username: 'Jane', age: 21, email: 'jane@example.com'),
    User(id: 3, username: 'Jim', age: 22, email: 'jim@example.com'),
    User(id: 4, username: 'Jill', age: 23, email: 'jill@example.com'),
    User(id: 5, username: 'Jack', age: 24, email: 'jack@example.com'),
    User(id: 6, username: 'Jill', age: 23, email: 'jill@example.com'),
    User(id: 7, username: 'Jack', age: 24, email: 'jack@example.com'),
    User(id: 8, username: 'Jill', age: 23, email: 'jill@example.com'),
    User(id: 9, username: 'Jack', age: 24, email: 'jack@example.com'),
    User(id: 10, username: 'Jill', age: 23, email: 'jill@example.com'),
  ];
  return users;
  //return Future.error('Error from asyncUserProvider');
});
