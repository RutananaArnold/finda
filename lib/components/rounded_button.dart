import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function press;
  final double screen;

  const RoundButton({
    Key key,
    this.text,
    this.color,
    this.press,
    this.screen = 0.9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * screen,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          color: color,
          onPressed: press,
          child: Text(
            text.toUpperCase(),
          ),
        ),
      ),
    );
  }
}
