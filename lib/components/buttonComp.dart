import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class buttoncomp extends StatefulWidget {

  final String text;
  final Function() onClick;
  final Color color;

  const buttoncomp({Key? key, required this.text, required this.onClick, required this.color}) : super(key: key);

  @override
  State<buttoncomp> createState() => _buttoncompState();
}

class _buttoncompState extends State<buttoncomp> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onClick, 
      child: Text(widget.text),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(100, 30),
            onPrimary: Colors.black,
            elevation: 15,
            shadowColor: Colors.black,
            primary: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),);
  }
}