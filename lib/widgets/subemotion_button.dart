import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubemotionButton extends StatelessWidget {
  const SubemotionButton(
      {super.key, required this.isSelected, required this.label});

  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Card(
        child: Container(
          height: 45,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            label,
            maxLines: 1,
            // overflow: TextOverflow.ellipsis,
            style: isSelected
                ? Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.surface)
                : Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
