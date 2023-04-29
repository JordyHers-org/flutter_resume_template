import 'package:flutter/material.dart';

class AnimateButton extends StatefulWidget {
  const AnimateButton({
    Key? key,
    required this.onDragged,
    required this.onSave,
    required this.isDragged,
  }) : super(key: key);

  final VoidCallback onDragged;
  final Function() onSave;
  final bool isDragged;

  @override
  State<AnimateButton> createState() => _AnimateButtonState();
}

class _AnimateButtonState extends State<AnimateButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: Row(children: [
        OutlinedButton(
          onPressed: () => widget.onDragged.call(),
          style: OutlinedButton.styleFrom(
              backgroundColor: widget.isDragged
                  ? Colors.grey
                  : Theme.of(context).primaryColor,
              foregroundColor: Colors.white),
          child: Text(
            widget.isDragged ? 'Reset' : 'Animate',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white, fontSize: 12),
          ),
        ),
        IconButton(
          onPressed: widget.onSave,
          icon: const Icon(Icons.download),
        ),
      ]),
    );
  }
}
