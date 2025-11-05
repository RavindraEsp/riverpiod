import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/state_notifier_provider/favorite/item.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, FavoriteItemState>((ref) {
      return FavoriteNotifier();
    });

class FavoriteNotifier extends StateNotifier<FavoriteItemState> {
  FavoriteNotifier()
    : super(FavoriteItemState(allItem: [], filteredItem: [], search: ''));

  addItem() {
    List<Item> item = [
      Item(id: "1", name: "Macbook", favourite: false),
      Item(id: "2", name: "ipad", favourite: true),
      Item(id: "3", name: "Samsung", favourite: false),
      Item(id: "4", name: "Nokia", favourite: true),
      Item(id: "5", name: "<Moto>", favourite: false),
      Item(id: "6", name: "One Plus", favourite: false),
    ];

    state = state.copyWith(allItem: item.toList(), filteredItem: item.toList());
  }

  void filterList(String search) {
    state = state.copyWith(filteredItem: _filterItem(state.allItem, search));
  }

  List<Item> _filterItem(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  void favList(String option) {
    state = state.copyWith(filteredItem: _favItem(state.allItem, option));
  }

  List<Item> _favItem(List<Item> items, String option) {
    if (option == "All") {
      return items;
    }
    return items.where((item) => item.favourite == true).toList();
  }
}
