import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderSeparator extends StatelessWidget {
  const SliderSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 2,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
