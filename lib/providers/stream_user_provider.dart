import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user.dart';

part 'stream_user_provider.g.dart';

@riverpod
Stream<List<User>> userStream(Ref ref) async* {
  int count = 1;
  while (count < 21) {
    await Future.delayed(const Duration(seconds: 2));
    yield [
      User(
        id: count,
        username: 'From userStream John $count',
        age: 18 + count,
        email: 'john$count@example.com',
      ),
    ];
    count++;
  }
}

final streamUserProvider = StreamProvider<List<User>>((ref) async* {
  int count = 1;
  while (count < 21) {
    //await Future.error('Error from streamUserProvider');
    await Future.delayed(const Duration(seconds: 2));
    yield [
      User(
        id: count,
        username: 'From streamUserProvider John $count',
        age: 18 + count,
        email: 'john$count@example.com',
      ),
    ];
    count++;
  }
});
