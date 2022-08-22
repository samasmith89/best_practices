import 'package:flutter/material.dart';

class VerySpecialButton extends StatelessWidget {
  final Function onPressed; // declare variables as "final" in stateless widgets
  final String label;
  final Color? color; // nullable variable

  // required properties, default values, non-required properties
  const VerySpecialButton(
      {Key? key, required this.onPressed, this.label = 'Button', this.color})
      : super(key: key);

  Color buttonColor() {
    return color ?? Colors.blue; // "if null" operator
  }

  @override
  Widget build(BuildContext context) {
    // keep build function as clean as possible
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor(),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ));
  }
}
