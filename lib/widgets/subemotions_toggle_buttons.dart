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
  var placeholderList = List.generate(11, (fd) => false);

  @override
  Widget build(BuildContext context) {
    double index = ref.watch(emotionIndexProvider);
    var subemotionBoolList = ref.watch(subemotionsProvider);
    var subemotionNotifier = ref.watch(subemotionsProvider.notifier);
    bool isVisible = false;
    int intIndex = 0;

    if (index != -1) {
      isVisible = true;
      intIndex = index.toInt();
    }

    void onTap(
      int localIndex,
    ) {
      setState(() {
        subemotionNotifier.toggleSubemotionButton(localIndex, intIndex);
      });
    }

    return isVisible
        ? Wrap(
            spacing: 0.4,
            // runSpacing: 10.0,
            // direction: Axis.horizontal,
            children: [
              for (int i = 0; i < placeholderList.length; i++)
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: IntrinsicWidth(
                      child: SubemotionButton(
                        label: emotionsListList[intIndex][i],
                        isSelected: subemotionBoolList[intIndex][i],
                        onTap: onTap,
                        localIndex: i,
                      ),
                    )),
            ],
          )
        : const SizedBox.shrink();
  }
}
