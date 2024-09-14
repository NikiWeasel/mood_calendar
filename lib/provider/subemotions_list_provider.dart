import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubemotionsListNotifier extends StateNotifier<List<bool>> {
  SubemotionsListNotifier() : super(List.generate(11, (fd) => false));

  void initSubemotionsList(int length) {
    state = List.generate(length, (fd) => false);
  }

  void toggleSubemotionButton(int index) {
    var newList = state;
    newList[index] = !newList[index];
    state = newList;
  }

  void unselectSubemotionButtons() {
    state = List.generate(11, (fd) => false);
  }
}

final subemotionsProvider =
    StateNotifierProvider<SubemotionsListNotifier, List<bool>>((ref) {
  return SubemotionsListNotifier();
});
