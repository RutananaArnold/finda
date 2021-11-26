import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
   final Color color;
  final Function press;

  const RoundButton({
    Key key,
    this.text,
    this.color,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        color: color,
        onPressed: press,
        child: Text(
          text.toUpperCase(),
        ),
      ),
    );
  }
}
