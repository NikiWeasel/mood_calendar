import 'package:calender/widgets/card_slider.dart';
import 'package:calender/widgets/card_text_field.dart';
import 'package:calender/widgets/emotions_row.dart';
import 'package:calender/widgets/save_button.dart';
import 'package:calender/widgets/subemotions_toggle_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calender/provider/subemotions_list_provider.dart';

class Diary extends ConsumerStatefulWidget {
  const Diary({super.key});

  @override
  ConsumerState<Diary> createState() => _DiaryState();
}

class _DiaryState extends ConsumerState<Diary> {
  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    var subemotionBoolList = ref.watch(subemotionsProvider);

    bool newIsReadOnly = true;
    for (var subemotion in subemotionBoolList) {
      if (subemotion.contains(true)) {
        newIsReadOnly = false;
        break;
      }
    }

    if (isReadOnly != newIsReadOnly) {
      setState(() {
        isReadOnly = newIsReadOnly;
      });
    }

    void showPopUp() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('PopUp'),
              content: Text('Все хорошо.'),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Ок',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ))
              ]);
        },
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Что чувствуешь?',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
          ),
          const EmotionsRow(),
          const SubemotionsToggleButtons(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Уровень стресса',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                CardSlider(
                  minText: 'Низкий',
                  maxText: 'Высокий',
                  isReadOnly: isReadOnly,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Самооценка',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                CardSlider(
                  minText: 'Неуверенность',
                  maxText: 'Уверенность',
                  isReadOnly: isReadOnly,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Заметки',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                Card(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardTextField(isReadOnly: isReadOnly)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SaveButton(
                  isReadOnly: isReadOnly,
                  onTap: showPopUp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
