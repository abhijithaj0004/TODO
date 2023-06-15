// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  Buttons({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Text(text,style:const TextStyle(color: Colors.amber),),
    );
  }
}
