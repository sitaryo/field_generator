import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MoveLayer extends HookWidget {
  final Widget child;

  const MoveLayer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    iconButton(IconData icons, VoidCallback onPressed) {
      return SizedBox.square(
        dimension: 24,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: Icon(icons, size: 18),
        ),
      );
    }

    return Stack(
      children: [
        Opacity(opacity: 0.2,child: Container(color: Colors.blueAccent,width: 800,height: 100,),),
        child,
        SizedBox(
          height: 100,
          width: 800,
          child: Column(
            children: [
              iconButton(Icons.arrow_upward, () {}),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconButton(Icons.switch_left, () {}),
                    iconButton(Icons.switch_right, () {}),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  iconButton(Icons.arrow_downward, () {}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      iconButton(Icons.copy, () {}),
                      const SizedBox(width: 8),
                      iconButton(Icons.delete, () {}),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
