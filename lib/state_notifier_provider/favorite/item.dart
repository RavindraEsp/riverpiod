class Item {
  final String id;
  final String name;
  final bool favourite;

  Item({required this.id, required this.name, required this.favourite});

  Item copyWith({String? id, String? name, bool? favourite}) {
    // using copyWith method we can update final var
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      favourite: favourite ?? this.favourite,
    );
  }
}

class FavoriteItemState {
  final List<Item> allItem;
  final List<Item> filteredItem;
  final String search;

  FavoriteItemState({
    required this.allItem,
    required this.filteredItem,
    required this.search,
  });

  FavoriteItemState copyWith({
    List<Item>? allItem,
    List<Item>? filteredItem,
    String? search,
  }) {
    // using copyWith method we can update final var
    return FavoriteItemState(
      allItem: allItem ?? this.allItem,
      filteredItem: filteredItem ?? this.filteredItem,
      search: search ?? this.search,
    );
  }
}
