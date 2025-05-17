import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/user_state.dart';

class UserViewModel extends Notifier<UserState> {
  @override
  UserState build() {
    return UserState(isLoading: true);
  }
}

final usersProvider = NotifierProvider<UserViewModel, UserState>(
  UserViewModel.new,
);
