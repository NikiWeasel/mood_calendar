import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key, required this.isReadOnly, required this.onTap});

  final bool isReadOnly;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          style: isReadOnly
              ? ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      Theme.of(context).colorScheme.onPrimary,
                  disabledForegroundColor:
                      Theme.of(context).colorScheme.onSecondary,
                )
              : ElevatedButton.styleFrom(),
          onPressed: isReadOnly ? null : onTap,
          child: Text(
            'Сохранить',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: isReadOnly
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.surface),
          )),
    );
  }
}
