import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab(
      {super.key,
      required this.imageUrl,
      required this.label,
      required this.isSelected});

  final String imageUrl;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        height: 30,
        // width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: isSelected
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(47.0),
              )
            : const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imageUrl,
                height: 12,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 11,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
