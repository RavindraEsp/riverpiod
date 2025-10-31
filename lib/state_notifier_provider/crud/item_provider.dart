import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/state_notifier_provider/crud/item.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier()
    : super([]); // super keyword allow to initialize parent class properties

  addItem(String name) {
    final item = Item(id: DateTime.now().toString(), name: name);
    state.add(item);

    state = state.toList();
  }

  deleteItem(String id) {
    state.removeWhere((item) => item.id == id);

    state = state.toList();
  }

  updateItem(String id) {
    int index = state.indexWhere((item) => item.id == id);

    state[index].name = "update";

    state = state.toList();
  }
}
