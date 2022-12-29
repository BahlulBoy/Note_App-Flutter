import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class Addtask extends StatefulWidget{
  @override
  State<Addtask> createState() {
    return addtaskState();
  } 
}

class addtaskState extends State<Addtask>{
  TextEditingController hari = TextEditingController();
  TextEditingController isi = TextEditingController();
  TextEditingController judul = TextEditingController();

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
              final db = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com').collection(hari.text);
              if ((judul != null) && (isi != null)) {
                db.add(
                  {
                    'judul' : judul.text,
                    'jam'   : isi.text,
                  }
                ).whenComplete(() => Navigator.pop(context));
              } else {
                print('gagal');
                Navigator.pop(context);
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
              border: Border.all(width: 0.1)
            ),
            child: TextField(
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Judul Kegiatan",
              ),
              controller: judul,
            ),
          ),
          SizedBox(height: 10,), 
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.1)
              ),
              child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Jam",
                ),
                controller: isi,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.1)
              ),
              child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Hari",
                ),
                controller: hari,
              ),
            ),
        ],
      )
    );
  }
}

class edittask extends StatefulWidget{
  DocumentSnapshot droc;
  String hari;
  edittask(this.droc, this.hari);

  @override
  State<edittask> createState() {
    return edittaskState();
  } 
}

class edittaskState extends State<edittask>{
  TextEditingController hari = TextEditingController();
  TextEditingController isi = TextEditingController();
  TextEditingController judul = TextEditingController();

  @override
  void initState() {
    hari = TextEditingController(text: widget.hari);
    judul = TextEditingController(text: widget.droc['judul']);
    isi = TextEditingController(text: widget.droc['jam']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
            Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("edit task"),
        actions: [
          TextButton(
            onPressed: () {
              widget.droc.reference.delete().whenComplete(() => Navigator.pop(context));
            }, 
            child: Text("Delete", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)) ),
          TextButton(
            onPressed: () {;
              final db = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com');
              if ((judul != null) && (isi != null)) {
                print(hari.text);
                widget.droc.reference.delete().then((value) {
                  db.collection(hari.text).add({
                  'jam':isi.text,
                  'judul':judul.text,
                }).whenComplete(() => Navigator.pop(context));
                });
              } else {
                print('gagal');
                Navigator.pop(context);
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
              border: Border.all(width: 0.1)
            ),
            child: TextField(
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Judul Kegiatan",
              ),
              controller: judul,
            ),
          ),
          SizedBox(height: 10,), 
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.1)
              ),
              child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Jam",
                ),
                controller: isi,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 0.1)
              ),
              child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "Hari",
                ),
                controller: hari,
              ),
            ),
        ],
      )
    );
  }
}