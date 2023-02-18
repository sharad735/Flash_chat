import 'package:flutter/material.dart';

class RoundedButtons extends StatelessWidget {
  Color colour;
  String btnTitle;
  void Function() onpress;
  RoundedButtons(
      {required this.colour, required this.btnTitle, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          onPressed: onpress,
          child: Text(
            btnTitle,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          minWidth: 200.0,
          height: 42.0,
        ),
      ),
    );
  }
}
