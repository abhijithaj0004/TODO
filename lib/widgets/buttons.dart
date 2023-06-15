import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  Buttons({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(text,style: TextStyle(color: Colors.amber),),
    );
  }
}
