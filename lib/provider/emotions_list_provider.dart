import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmotionsListNotifier extends StateNotifier<List<bool>> {
  EmotionsListNotifier() : super([]);

  void innitEmotionsList(int length) {
    state = List.generate(length, (fd) => false);
  }

  void toggleEmotionButton(int index) {
    var newList = List.generate(state.length - 1, (fd) => false);
    newList.insert(index, true);
    state = newList;
  }
}

final emotionsProvider =
    StateNotifierProvider<EmotionsListNotifier, List<bool>>((ref) {
  return EmotionsListNotifier();
});
