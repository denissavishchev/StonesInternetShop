import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton(
      {this.color = Colors.black, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 2, color: Colors.grey,),
      ),
      child: Material(
        elevation: 15.0,
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 42,
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}