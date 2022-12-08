// ignore_for_file: camel_case_types, prefer_const_constructors

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
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Text(
              "Notes", style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w900, color: Color.fromRGBO(222, 185, 96, 1)
              ),
            ),
          ),
          GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.yellow[400],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 5,
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        widthFactor: 1,
                        child: Text("Tanpa Judul", textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800
                        )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        widthFactor: 1,
                        child: Align(
                          widthFactor: 1,
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () => {

                            }, 
                            icon: Icon(
                                Icons.keyboard_arrow_right_sharp,
                                size: 30,
                              )
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.yellow[400],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 5,
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        widthFactor: 1,
                        child: Text("Tanpa Judul", textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800
                        )),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: FractionallySizedBox(
                        heightFactor: 1,
                        widthFactor: 1,
                        child: Align(
                          widthFactor: 1,
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () => {

                            }, 
                            icon: Icon(
                                Icons.keyboard_arrow_right_sharp,
                                size: 30,
                              )
                            ),
                        ),
                      ),
                    ),
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
