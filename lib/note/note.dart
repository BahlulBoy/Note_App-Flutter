// ignore_for_file: camel_case_types, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:note_app/note/addnote.dart';

class Note extends StatefulWidget{
  const Note({Key? key}) : super(key: key);
  @override
  State<Note> createState() {
    return Note_state();
  }
}

class Note_state extends State<Note>{

  final ref = FirebaseFirestore.instance.collection('note').doc('ahfaitar2@gmail.com').collection('note');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget> [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Text(
              "Notes", style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w900, color: Color.fromRGBO(222, 185, 96, 1)
              ),
            ),
          ),
         StreamBuilder(
           stream: ref.snapshots(),
           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
             return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
             shrinkWrap: true,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index) {
                DocumentSnapshot f = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>EditNote(f)))
                    },
                     child: Container(
                        margin: EdgeInsets.all(10),
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
                                 child: Text(f['judul'], style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),)),
                               )
                            ],
                         ),
                   ),
                   );
                },
              );
           }
         )
        ],
      )
    );
  }

}
