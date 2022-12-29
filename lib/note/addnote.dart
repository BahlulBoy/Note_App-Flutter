// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() {
    return Add_state();
  }
}

class Add_state extends State<AddNote>{
  final db = FirebaseFirestore.instance.collection('note').doc('ahfaitar2@gmail.com').collection('note');
  TextEditingController judul = TextEditingController();
  TextEditingController isi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
            Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Add Note"),
        actions: [
          TextButton(
            onPressed: () {
              if ((judul != null) && (isi != null)) {
                db.add(
                  {
                    'judul' : judul.text,
                    'isi'   : isi.text,
                  }
                ).whenComplete(() => Navigator.pop(context));
              } else {
                print('gagal');
              }
            }, 
            child: Text("Save", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),)
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5)
            ),
            child: TextField(
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Judul Note",
              ),
              controller: judul,
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5)
              ),
              child: TextField(
                style: TextStyle(fontSize: 20),
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Isi Note",
                ),
                controller: isi,
              ),
            ),
          )
        ],
      )
    );
  }

}

class EditNote extends StatefulWidget{

  DocumentSnapshot droc;
  EditNote(this.droc);

  @override
  State<EditNote> createState() {
    // TODO: implement createState
    return EditNote_state();
  }
}

class EditNote_state extends State<EditNote>{
  TextEditingController judul = TextEditingController();
  TextEditingController isi = TextEditingController();

  @override
  void initState(){
    judul = TextEditingController(text: widget.droc['judul']);
    isi = TextEditingController(text: widget.droc['isi']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(36, 35, 34, 1.0),
        leading: IconButton(onPressed: () {
            Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Edit Note"),
        actions: [
          TextButton(
            onPressed: () {
              widget.droc.reference.delete().whenComplete(() => Navigator.pop(context));
            }, 
            child: Text("Delete", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)) ),
          TextButton(
            onPressed: () {
              widget.droc.reference.update({
                'judul':judul.text,
                'isi':isi.text
              }).whenComplete(() => Navigator.pop(context));
            }, 
            child: Text("Save", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),)
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5)
            ),
            child: TextField(
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Judul Note",
              ),
              controller: judul,
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5)
              ),
              child: TextField(
                style: TextStyle(fontSize: 20),
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Isi Note",
                ),
                controller: isi,
              ),
            ),
          )
        ],
      )
    );
  }

}