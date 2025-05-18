import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';
import '../state/user_state.dart';

class UserViewModel extends Notifier<UserState> {
  @override
  UserState build() {
    return UserState(isLoading: true);
  }

  void addUser(User user) {
    state = state.copyWith(isLoading: true, isAdded: false);
    state = state.copyWith(
      isLoading: false,
      //isAdded: true,
      error: 'Something went wrong',
      users: [...state.users, user],
    );
  }
}

final usersProvider = NotifierProvider<UserViewModel, UserState>(
  UserViewModel.new,
);
