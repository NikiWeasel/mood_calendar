import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTextField extends StatelessWidget {
  const CardTextField({super.key, required this.isReadOnly});

  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 121),
      child: TextField(
        readOnly: isReadOnly,
        maxLines: 5,
        decoration: const InputDecoration(
            hintText: 'Введите заметку', border: InputBorder.none),
      ),
    );
  }
}
