// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Note extends StatefulWidget{
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() {
    return Note_state();
  }
}

class Note_state extends State<Note>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget> [
          Center(child: Text("Note", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),))
        ],
      )
    );
  }

}
