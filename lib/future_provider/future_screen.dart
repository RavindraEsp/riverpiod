import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/future_provider/future_provider.dart';

class FutureScreen extends ConsumerStatefulWidget {
  const FutureScreen({super.key});

  @override
  ConsumerState<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends ConsumerState<FutureScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      body: Center(
        child: provider.when(
          data: (value) => Text(value.toString()),
          error: (error, stack) => Text(error.toString()),
          loading: () {
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
