import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String title;
  final Color buttonColor;
  final Color textColor;
  double? width;
  final VoidCallback? onPressed;

  CustomButton(
      {super.key,
      required this.title,
      required this.buttonColor,
      required this.textColor,
      this.width,
      this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 50,
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(8.0),
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            textAlign: TextAlign.center,
            widget.title,
            style: TextStyle(color: widget.textColor, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
