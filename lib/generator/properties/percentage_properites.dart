import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PercentageProperties extends StatelessWidget {
  final List<bool> isSelected;
  final void Function(int) onPressed;

  const PercentageProperties({
    Key? key,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("字段占比"),
          ToggleButtons(
            onPressed: (flex) => onPressed(flex + 1),
            isSelected: isSelected,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: Colors.blue[700],
            selectedColor: Colors.white,
            fillColor: Colors.blue[200],
            color: Colors.blue[400],
            children: const [
              Text("25%"),
              Text("50%"),
              Text("75%"),
              Text("100%"),
            ],
          )
        ],
      ),
    );
  }
}
