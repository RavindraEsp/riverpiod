import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/state_notifier_provider/crud/item_provider.dart';
import 'package:riverpod_demo/state_notifier_provider/search_provider.dart';

class ItemScreen extends ConsumerStatefulWidget {
  const ItemScreen({super.key});

  @override
  ConsumerState<ItemScreen> createState() => _NewHomeState();
}

class _NewHomeState extends ConsumerState<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(title: Text("State Notifier provider")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem("New Item");
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),

            trailing: Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                IconButton(
                  onPressed: () {
                    ref.read(itemProvider.notifier).updateItem(items[index].id);
                  },
                  icon: Icon(Icons.edit),
                ),

                IconButton(
                  onPressed: () {
                    ref.read(itemProvider.notifier).deleteItem(items[index].id);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
