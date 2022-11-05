import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class formcomp extends StatefulWidget {

  final String text;
  final TextInputType type;
  final TextEditingController controller;
  final bool password;

  const formcomp({Key? key, 

  required this.text, 
  required this.type, 
  required this.controller,
  required this.password,
  
  }) : super(key: key);

  @override
  State<formcomp> createState() => _formcompState();
}

class _formcompState extends State<formcomp> {

  bool password1 = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.password == true ? password1 :false,
        keyboardType: widget.type,
        decoration: InputDecoration(
          suffixIcon: widget.password == true
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        password1 = !password1;
                      });
                    },
                    icon: password1 == true
                        ? const Icon(Icons.visibility_off, color: Colors.white,)
                        : const Icon(Icons.visibility, color: Colors.white))
                : null,
          label: Text(widget.text,style: TextStyle(color: Colors.white),),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.deepOrange.shade400, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange.shade400, width: 2),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
