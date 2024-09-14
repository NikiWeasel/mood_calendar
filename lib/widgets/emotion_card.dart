import 'dart:io';
import 'package:calender/provider/subemotions_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calender/provider/emotions_list_provider.dart';

import 'package:calender/models/emotion.dart';

class EmotionCard extends ConsumerStatefulWidget {
  const EmotionCard({
    super.key,
    required this.index,
    required this.boolList,
    required this.emotion,
  });

  final int index;
  final List<bool> boolList;
  final Emotion emotion;

  @override
  ConsumerState<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends ConsumerState<EmotionCard> {
  // bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(emotionsProvider.notifier)
            .initEmotionsList(widget.boolList.length);
        ref.read(subemotionsProvider.notifier).initSubemotionsList(11);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final emotionNotifier = ref.watch(emotionsProvider.notifier);
    final emotionList = ref.watch(emotionsProvider);
    final emotionIndexNotifier = ref.watch(emotionIndexProvider.notifier);
    final emotionIndex = ref.watch(emotionIndexProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
          height: 118,
          width: 83,
          child: InkWell(
            borderRadius: BorderRadius.circular(76),
            onTap: () {
              setState(() {
                if (emotionIndex != widget.index) {
                  ref
                      .read(subemotionsProvider.notifier)
                      .unselectSubemotionButtons();
                }
                emotionNotifier.toggleEmotionButton(widget.index);
                emotionIndexNotifier.setIndex(widget.index);
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(76),
                side: emotionList[widget.index]
                    ? BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 2,
                      )
                    : BorderSide.none,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  children: [
                    Image.asset(widget.emotion.imageUrl),
                    Text(
                      widget.emotion.emotionName,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
