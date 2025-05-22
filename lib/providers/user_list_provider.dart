import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user.dart';

// 使用 riverpod
//final userListProvider = Provider.autoDispose.family<User, int>((ref, id) {
//  const users = [
//    User(id: 1, username: 'John', age: 20, email: 'john@example.com'),
//    User(id: 2, username: 'Jane', age: 21, email: 'jane@example.com'),
//    User(id: 3, username: 'Jim', age: 22, email: 'jim@example.com'),
//    User(id: 4, username: 'Jill', age: 23, email: 'jill@example.com'),
//    User(id: 5, username: 'Jack', age: 24, email: 'jack@example.com'),
//  ];

//  final user = users.firstWhere((user) => user.id == id);
//  return user;
//});

// 使用 @riverpod generator
part 'user_list_provider.g.dart';

@riverpod
User userList(ref, int id, int age, {String? username}) {
  const users = [
    User(id: 1, username: 'John', age: 20, email: 'john@example.com'),
    User(id: 2, username: 'Jane', age: 21, email: 'jane@example.com'),
    User(id: 3, username: 'Jim', age: 22, email: 'jim@example.com'),
    User(id: 4, username: 'Jill', age: 23, email: 'jill@example.com'),
    User(id: 5, username: 'Jack', age: 24, email: 'jack@example.com'),
  ];

  final user = users.firstWhere((user) => user.id == id);
  return user;
}
