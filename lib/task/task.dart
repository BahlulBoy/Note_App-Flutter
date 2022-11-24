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
        children: const <Widget> [
          Text("Task", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}