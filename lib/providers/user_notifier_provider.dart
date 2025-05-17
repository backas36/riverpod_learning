import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotifierProvider = AutoDisposeNotifierProvider<UserNotifier, String>(
  UserNotifier.new,
);

// Notifier 會 Cache 資料，所以當從 user 頁面返回至 counter 頁面再回到 user 頁面時， user 頁面會保留資料
// 如果想要清除 Cache 資料，可以將 Notifier 改為 AutoDisposeNotifier，但要先確保是否 state 有被 watch 中或者，有被初始化了多次
class UserNotifier extends AutoDisposeNotifier<String> {
  @override
  String build() {
    final keepAlive = ref.keepAlive();
    Timer? timer;

    log("1. UserNotifier build");

    ref.onCancel(() {
      log("2.UserNotifier onCancel");
      timer = Timer(const Duration(seconds: 10), () {
        keepAlive.close();
        log("5. UserNotifier onCancel timer");
      });
    });

    ref.onDispose(() {
      timer?.cancel();
      log("3. UserNotifier onDispose");
    });

    ref.onResume(() {
      timer?.cancel();
      log("4. UserNotifier onResume");
    });
    return "-";
  }

  void update(String value) {
    state = value;
  }
}

// 從 A 頁面進入 user_screen 頁面  => 1 UserNotifier build
// update 了 state 之後
// 回到 A 頁面 => 2 UserNotifier onCancel
// 10 秒內回到 user_screen 頁面 => 4 UserNotifier onResume
// 再回到 A 頁面 => 2 UserNotifier onCancel
// 10 秒後 => 5. UserNotifier onCancel timer, 3. UserNotifier onDispose
