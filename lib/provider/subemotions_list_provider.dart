import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubemotionsListNotifier extends StateNotifier<List<bool>> {
  SubemotionsListNotifier() : super([]);

  void innitSubemotionsList(int length) {
    state = List.generate(length, (fd) => false);
  }

  void toggleSubemotionButton(int index, String emotionName) {
    // final isSubemotionSelected = state[index];

    var newList = state;
    newList[index] = !newList[index];
    state = newList;
    // if (isSubemotionSelected) {
    //   var newList = state;
    //   newList[index] = !newList[index];
    //   state = newList;
    // } else {
    //   state = [...state, meal];
    //   return true;
    // }
  }
}

final subemotionsProvider =
    StateNotifierProvider<SubemotionsListNotifier, List<bool>>((ref) {
  return SubemotionsListNotifier();
});
