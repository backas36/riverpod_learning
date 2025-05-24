import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_list_provider.dart';

part 'start_up_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> startup(ref, {required String flavour}) async {
  ref.onDispose(() {
    log('startup disposed');
    ref.invalidate(userListProvider); // just example
  });

  //await Future.delayed(const Duration(seconds: 3));
  log('startup $flavour');
  // init db
  // initHive()
  // crash collection
  log("startup completed");
  await Future.delayed(const Duration(seconds: 3));
  await Future.error('Error from startup');
}
