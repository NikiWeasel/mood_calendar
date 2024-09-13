import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calender/provider/emotions_list_provider.dart';

import 'package:calender/models/emotion.dart';

class EmotionCard extends ConsumerStatefulWidget {
  const EmotionCard(
      {super.key,
      required this.index,
      required this.boolList,
      required this.emotion,
      required this.onTap});

  final int index;
  final List<bool> boolList;
  final Emotion emotion;
  final void Function(int index, List<bool> boolList) onTap;

  @override
  ConsumerState<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends ConsumerState<EmotionCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref
            .read(emotionsProvider.notifier)
            .innitEmotionsList(widget.boolList.length);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final emotionNotifier = ref.watch(emotionsProvider.notifier);
    // emotionNotifier.innitEmotionsList(6);
    // final emotionList = ref.watch(emotionsProvider);

    // final bool isSelected = emotionList[widget.index];
    var boolList = widget.boolList;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: SizedBox(
          height: 118,
          width: 83,
          child: InkWell(
            borderRadius: BorderRadius.circular(76),
            onTap: () {
              // emotionNotifier.toggleEmotionButton(widget.index);
              setState(() {
                // print(widget.boolList[widget.index]);
                // widget.onTap(widget.index, widget.boolList);
                // print(widget.boolList[widget.index]);
                boolList = ref.read(emotionsProvider);
                ref
                    .read(emotionsProvider.notifier)
                    .toggleEmotionButton(widget.index);
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(76),
                side: boolList[widget.index]
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
