import 'package:calender/data/subemotions_list.dart';
import 'package:calender/widgets/subemotion_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:calender/provider/subemotions_list_provider.dart';

import 'package:calender/provider/emotions_list_provider.dart';

class SubemotionsToggleButtons extends ConsumerStatefulWidget {
  const SubemotionsToggleButtons({super.key});

  // final

  @override
  ConsumerState<SubemotionsToggleButtons> createState() =>
      _SubemotionsToggleButtonsState();
}

class _SubemotionsToggleButtonsState
    extends ConsumerState<SubemotionsToggleButtons> {
  @override
  Widget build(BuildContext context) {
    var placeholderList = List.generate(11, (fd) => false);

    late var subemotionNotifier;
    late var subemotionList;
    late var emotionBoolList;
    bool isVisible = false;
    late var subemotionsList;
    int? index;
    Future.delayed(
      Duration.zero,
      () {
        subemotionNotifier = ref.watch(subemotionsProvider.notifier);
        subemotionList = ref.watch(subemotionsProvider);
        emotionBoolList = ref.watch(emotionsProvider);
        isVisible = emotionBoolList.contains(true);

        index = emotionBoolList.indexWhere((element) => element == true);
        subemotionsList = emotionsListList[index!];
        subemotionNotifier.innitSubemotionsList(subemotionsList.length);
      },
    );
    // if (!isVisible || index == null) {
    //   return const SizedBox.shrink();
    // }

    // emotionsListList[index]

    return Wrap(
      spacing: 0.4,
      // runSpacing: 10.0,
      // direction: Axis.horizontal,
      children: [
        for (int i = 0; i < placeholderList.length; i++)
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: IntrinsicWidth(
                child: SubemotionButton(
                    isSelected: false, label: emotionsListList[0][i]),
              )),
      ],
    );
  }
}
