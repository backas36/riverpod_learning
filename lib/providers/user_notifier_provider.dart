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

    log("UserNotifier build");

    ref.onCancel(() {
      log("UserNotifier onCancel");
      timer = Timer(const Duration(seconds: 10), () {
        keepAlive.close();
        log("UserNotifier onCancel timer");
      });
    });

    ref.onDispose(() {
      timer?.cancel();
      log("UserNotifier onDispose");
    });

    ref.onResume(() {
      timer?.cancel();
      log("UserNotifier onResume");
    });
    return "-";
  }

  void update(String value) {
    state = value;
  }
}
