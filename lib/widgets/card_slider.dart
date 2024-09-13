import 'package:calender/widgets/slider_separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  const CardSlider({super.key, required this.minText, required this.maxText});

  final String minText;
  final String maxText;

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  double _currentSliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SliderSeparator(),
                Spacer(),
                SliderSeparator(),
                Spacer(),
                SliderSeparator(),
                Spacer(),
                SliderSeparator(),
                Spacer(),
                SliderSeparator(),
                Spacer(),
                SliderSeparator(),
              ],
            ),
          ),
          Slider(
            value: _currentSliderValue,
            max: 100,
            divisions: 10,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  widget.minText,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
                const Spacer(),
                Text(
                  widget.maxText,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
