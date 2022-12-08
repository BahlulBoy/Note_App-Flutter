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
                height: 40,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 245, 155)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Senin", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 245, 155)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Selasa", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 245, 155)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Rabu", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 245, 155)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Kamis", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 245, 155)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Jumat", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 245, 155)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Sabtu", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 245, 155)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Minggu", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}