import 'dart:developer';

//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user.dart';
import '../state/user_state.dart';

// > this is not using riverpod_annotation way. But it works.
//class UserViewModel extends Notifier<UserState> {
//  @override
//  UserState build() {
//    log("UserViewModel build");
//    ref.onDispose(() {
//      log("UserViewModel dispose");
//    });
//    return UserState(isLoading: true);
//  }

//  void addUser(User user) {
//    state = state.copyWith(isLoading: true, isAdded: false);
//    state = state.copyWith(
//      isLoading: false,
//      isAdded: true,
//      //error: 'Something went wrong', // mock error
//      users: [...state.users, user],
//    );
//  }

//  void clearError() {
//    state = state.copyWith(error: null);
//  }
//}

//final usersProvider = NotifierProvider<UserViewModel, UserState>(
//  UserViewModel.new,
//);

// > this is using riverpod_annotation way.

part 'user_view_model.g.dart';

//@riverpod  => 如果沒有要帶參數用小寫
@Riverpod(keepAlive: true)
class UserViewModel extends _$UserViewModel {
  @override
  UserState build() {
    log("UserViewModel build");
    ref.onDispose(() {
      log("UserViewModel dispose");
    });
    return UserState(isLoading: true);
  }

  void addUser(User user) {
    state = state.copyWith(isLoading: true, isAdded: false);
    state = state.copyWith(
      isLoading: false,
      isAdded: true,
      //error: 'Something went wrong', // mock error
      users: [...state.users, user],
    );
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
