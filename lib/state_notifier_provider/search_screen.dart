// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_demo/state_notifier_provider/search_provider.dart';
//
//
// class SearchScreen extends ConsumerStatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   ConsumerState<SearchScreen> createState() => _NewHomeState();
// }
//
// class _NewHomeState extends ConsumerState<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final search = ref.watch(searchProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("State Notifier provider"),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             onChanged: (v) {
//               ref.read(searchProvider.notifier).search(v);
//             },
//           ),
//
//           Text(search)
//         ],
//       ),
//     );
//   }
// }

/// Simple state End
///
///
///
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/state_notifier_provider/search_provider.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _NewHomeState();
}

class _NewHomeState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final search = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(title: Text("State Notifier provider")),
      body: Column(
        children: [
          TextField(
            onChanged: (v) {
              ref.read(searchProvider.notifier).search(v);
            },
          ),

          Text(search.search),

          Consumer(
            builder: (context, ref, child) {
             // final isChange = ref.watch(searchProvider);
              final isChange = ref.watch((searchProvider).select((state) => state.isChange));

              print("build 2");
              return Switch(
              ///  value: isChange.isChange,
                value: isChange,
                onChanged: (v) {
                  ref.read(searchProvider.notifier).onChange(v);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
