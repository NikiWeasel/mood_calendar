import 'package:calender/widgets/card_slider.dart';
import 'package:calender/widgets/emotions_row.dart';
import 'package:calender/widgets/page_switcher.dart';
import 'package:calender/widgets/subemotion_button.dart';
import 'package:calender/widgets/subemotions_toggle_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diary extends StatelessWidget {
  const Diary({super.key});

  @override
  Widget build(BuildContext context) {
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
          EmotionsRow(),
          SubemotionsToggleButtons(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 20,
                // ),
                Text('Уровень стресса',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                CardSlider(minText: 'Низкий', maxText: 'Высокий'),
                const SizedBox(
                  height: 20,
                ),
                Text('Самооценка',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                CardSlider(minText: 'Неуверенность', maxText: 'Уверенность'),
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
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 121),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: 'Введите заметку',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Сохранить',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surface),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
