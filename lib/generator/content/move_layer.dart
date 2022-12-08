import 'package:field_generator/generator/sized_box.dart';
import 'package:flutter/material.dart';

class MoveLayer extends StatelessWidget {
  final Widget child;
  final VoidCallback? moveUp;
  final VoidCallback? moveDown;
  final VoidCallback? moveLeft;
  final VoidCallback? moveRight;
  final VoidCallback? copy;
  final VoidCallback? delete;

  const MoveLayer({
    Key? key,
    required this.child,
    this.moveUp,
    this.moveDown,
    this.moveLeft,
    this.moveRight,
    this.copy,
    this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    iconButton(IconData icons, VoidCallback onPressed) {
      return SizedBox.square(
        dimension: 24,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          child: Icon(icons, size: 18),
        ),
      );
    }

    renderIfNotNull<T>(T? nullable, Widget Function(T) item) =>
        nullable == null ? square24 : item.call(nullable);

    return Stack(
      children: [
        Opacity(
          opacity: 0.2,
          child: Container(
            color: Colors.blueAccent,
            width: 800,
            height: 84,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
          ),
        ),
        child,
        SizedBox(
          height: 100,
          width: 800,
          child: Column(
            children: [
              renderIfNotNull(
                  moveUp, (action) => iconButton(Icons.arrow_upward, action)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    renderIfNotNull(moveLeft,
                        (action) => iconButton(Icons.switch_left, action)),
                    renderIfNotNull(moveRight,
                        (action) => iconButton(Icons.switch_right, action)),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  renderIfNotNull(
                    moveDown,
                    (action) => iconButton(Icons.arrow_downward, action),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      renderIfNotNull(
                        copy,
                        (action) => iconButton(Icons.copy, action),
                      ),
                      w8,
                      renderIfNotNull(
                        delete,
                        (action) => iconButton(Icons.delete, action),
                      ),
                      w16,
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
