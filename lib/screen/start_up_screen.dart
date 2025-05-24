import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/start_up_provider.dart';

class StartUpScreen extends ConsumerWidget {
  final String flavour;
  final WidgetBuilder builder;
  const StartUpScreen({
    super.key,
    required this.flavour,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(startupProvider(flavour: flavour));
    return asyncValue.when(
      data: (data) => builder(context),
      loading:
          () =>
              Material(child: const Center(child: CircularProgressIndicator())),
      error:
          (error, stackTrace) => Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(error.toString()),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(startupProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
