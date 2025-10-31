import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider<String>((ref) {
  return 'Hello';
});

final ageProvider = Provider<int>((ref) {
  return 21;
});

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final hello = ref.watch(helloProvider);
//     final age = ref.watch(ageProvider);
//     return Scaffold(body: Center(child: Text(hello + age.toString())));
//   }
// }
//


class NewHome extends ConsumerStatefulWidget {
  const NewHome({super.key});

  @override
  ConsumerState<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends ConsumerState<NewHome> {
  @override
  Widget build(BuildContext context) {
    final hello = ref.watch(helloProvider);
    final age = ref.watch(ageProvider);
    return Scaffold( body:
        Center(child: Text(hello + age.toString())));
  }
}

