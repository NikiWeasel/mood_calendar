import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmotionsListNotifier extends StateNotifier<List<bool>> {
  EmotionsListNotifier() : super([]);

  void initEmotionsList(int length) {
    state = List.generate(length, (fd) => false);
  }

  void toggleEmotionButton(int index) {
    var newList = List.generate(state.length, (fd) => false);
    newList[index] = true;
    state = newList;
  }
}

final emotionsProvider =
    StateNotifierProvider<EmotionsListNotifier, List<bool>>((ref) {
  return EmotionsListNotifier();
});

////

class EmotionIndexNotifier extends StateNotifier<double> {
  EmotionIndexNotifier() : super(-1);

  void setIndex(int index) {
    state = index.toDouble();
  }
}

final emotionIndexProvider =
    StateNotifierProvider<EmotionIndexNotifier, double>((ref) {
  return EmotionIndexNotifier();
});
