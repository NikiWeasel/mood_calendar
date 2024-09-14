import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubemotionButton extends StatefulWidget {
  const SubemotionButton(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onTap,
      required this.localIndex});

  final bool isSelected;
  final String label;
  final void Function(int localIndex) onTap;
  final int localIndex;

  @override
  State<SubemotionButton> createState() => _SubemotionButtonState();
}

class _SubemotionButtonState extends State<SubemotionButton> {
  // bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        widget.onTap(widget.localIndex);
      },
      child: Card(
        child: Container(
          height: 45,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(3)),
          child: Text(
            widget.label,
            maxLines: 1,
            // overflow: TextOverflow.ellipsis,
            style: widget.isSelected
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
