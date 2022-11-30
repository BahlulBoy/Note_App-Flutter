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
        children: <Widget> [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: const Text(
              "Notes", style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w900, color: Color.fromRGBO(222, 185, 96, 1)
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text("Title"),
                  ],
                ),
              ),
            ],
          )
        ],
      )
    );
  }

}
