import 'package:calender/widgets/emotion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:calender/provider/emotions_list_provider.dart';

import 'package:calender/data/emotions_list.dart';

class EmotionsRow extends ConsumerStatefulWidget {
  const EmotionsRow({super.key});

  @override
  ConsumerState<EmotionsRow> createState() => _EmotionsRowState();
}

class _EmotionsRowState extends ConsumerState<EmotionsRow> {
  List<bool> boolList = List.generate(emotionList.length, (fd) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < emotionList.length; i++)
            EmotionCard(
              index: i,
              boolList: boolList,
              emotion: emotionList[i],
            ),
        ],
      ),
    );
  }
}
