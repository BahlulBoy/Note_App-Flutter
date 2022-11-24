import 'package:flutter/cupertino.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Text(
              "Task Planner", style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w900, color: Color.fromRGBO(222, 185, 96, 1)
              ),
            ),
          )
        ],
      ),
    );
  }
}