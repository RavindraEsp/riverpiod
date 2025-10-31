import 'package:flutter_riverpod/flutter_riverpod.dart';

/// simple state
// final searchProvider = StateNotifierProvider<SearchNotifier, String>((ref) {
//   return SearchNotifier();
// });
//
// class SearchNotifier extends StateNotifier<String> {
//   SearchNotifier()
//       : super(
//       ""); // using super parents class ke properties ko initialize krte h
//
//   void search(String query) {
//     state = query;
//   }
// }



final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});


class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier()
      : super(SearchState(search: "",isChange: false)); // using super parents class ke properties ko initialize krte h

  void search(String query) {
    state = state.copyWith(search: query);
  }

  void onChange(bool value) {
    state = state.copyWith(isChange: value);
  }
}




class SearchState {

  final String search;
  final bool isChange;

  SearchState({required this.search,required this.isChange});

  SearchState copyWith({
    String? search,
    bool? isChange
  }) {
    return SearchState(
        search: search ?? this.search,
      isChange: isChange ?? this.isChange,
    );
  }
}
