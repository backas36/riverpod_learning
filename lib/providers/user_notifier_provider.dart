import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNotifierProvider = NotifierProvider<UserNotifier, String>(
  UserNotifier.new,
);

// Notifier 會 Cache 資料，所以當從 user 頁面返回至 counter 頁面再回到 user 頁面時， user 頁面會保留資料
// 如果想要清除 Cache 資料，可以將 Notifier 改為 AutoDisposeNotifier
class UserNotifier extends Notifier<String> {
  @override
  String build() {
    return "-";
  }

  void update(String value) {
    state = value;
  }
}
