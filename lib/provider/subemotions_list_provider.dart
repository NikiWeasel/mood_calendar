import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubemotionsListNotifier extends StateNotifier<List<List<bool>>> {
  SubemotionsListNotifier()
      : super(List.generate(
          6,
          (_) => List.filled(11, false),
        ));

  void initSubemotionsList(int length) {
    state = List.generate(6, (_) => List.filled(11, false));
  }

  void toggleSubemotionButton(int subemotionIndex, int emotionIndex) {
    var newList = state;
    newList[emotionIndex][subemotionIndex] =
        !newList[emotionIndex][subemotionIndex];
    state = newList;
  }

  void unselectSubemotionButtons() {
    //TODO 2 одинаковых метода, убрать один
    state = List.generate(6, (_) => List.filled(11, false));
  }
}

final subemotionsProvider =
    StateNotifierProvider<SubemotionsListNotifier, List<List<bool>>>((ref) {
  return SubemotionsListNotifier();
});
