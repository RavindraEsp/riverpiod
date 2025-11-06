import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/stream_provider/current_price_provider.dart';

class CurrentPriceScreen extends ConsumerStatefulWidget {
  const CurrentPriceScreen({super.key});

  @override
  ConsumerState<CurrentPriceScreen> createState() => _CurrentPriceScreenState();
}

class _CurrentPriceScreenState extends ConsumerState<CurrentPriceScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(price);
    return Scaffold(
      body: Center(
        child: provider.when(
          data: (value) => Text(value.toStringAsFixed(2)),
          error: (error, stack) => Text(error.toString()),
          loading: () {
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
