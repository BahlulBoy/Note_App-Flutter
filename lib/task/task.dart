// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget{
  const Task({Key? key}):super(key: key);

  @override
  State<Task> createState() {
    return Task_state();
  }

}

class Task_state extends State<Task>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget> [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Text(
              "Task Planner", style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w900, color: Color.fromRGBO(222, 185, 96, 1)
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            shrinkWrap: true,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 248, 188),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    
                  ]
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}