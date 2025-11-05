import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/state_notifier_provider/favorite/favourite_provider.dart';
import 'package:riverpod_demo/state_notifier_provider/search_provider.dart';

class FavouriteScreen extends ConsumerStatefulWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favList = ref.watch(favoriteProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("State Notifier provider"),

        actions: [
          PopupMenuButton(
            onSelected: (v) {
              ref.read(favoriteProvider.notifier).favList(v);
            },

            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(value: "All", child: Text("All")),

                PopupMenuItem(value: "Fav", child: Text("Fav")),
              ];
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favoriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),

      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "search",
              border: OutlineInputBorder(),
            ),
            onChanged: (v) {
              ref.read(favoriteProvider.notifier).filterList(v);
            },
          ),

          Expanded(
            child: ListView.builder(
              itemCount: favList.filteredItem.length,
              itemBuilder: (context, index) {
                final item = favList.filteredItem[index];
                return ListTile(
                  title: Text(item.name),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          item.favourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
