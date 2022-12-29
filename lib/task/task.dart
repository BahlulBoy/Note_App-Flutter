// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_app/task/addtask.dart';
import 'package:flutter/material.dart';

class Tas extends StatefulWidget{
  const Tas({Key? key}):super(key: key);

  @override
  State<Tas> createState() {
    return Task_state();
  }

}

class Task_state extends State<Tas>{
  int current_tab = 0;
  final List<Widget> page = [
    senin(),
    selasa(),
    rabu(),
    kamis(),
    jumat(),
    sabtu(),
    minggu()
  ];

  PageStorageBucket p = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget> [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Task Planner", style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w900, color: Color.fromRGBO(222, 185, 96, 1)
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            children: [
              Container(
                height: 40,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          current_tab = 0;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange.shade900
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Senin", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          current_tab = 1;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange.shade900
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Selasa", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          current_tab = 2;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange.shade900
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Rabu", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          current_tab = 3;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange.shade900
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Kamis", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          current_tab = 4;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange.shade900
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Jumat", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),),
                      ),
                    ),
                   InkWell(
                    onTap: () {
                        setState(() {
                          current_tab = 5;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange.shade900
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Sabtu", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),),
                      ),
                    ),
                   InkWell(
                    onTap: () {
                        setState(() {
                          current_tab = 6;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange.shade900
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                        alignment: Alignment.center,
                        child: Text("Minggu", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
              PageStorage(
                bucket: p, 
                child: page[current_tab]
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

class senin extends StatefulWidget{
  @override
  State<senin> createState() {
    // TODO: implement createState
    return senin_state();
  }
}
class senin_state extends State<senin>{

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com').collection('senin');
    // TODO: implement build
    return  StreamBuilder(
           stream: ref.snapshots(),
           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
             return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2),
             shrinkWrap: true,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index) {
                DocumentSnapshot f = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>edittask(f, 'senin')))
                    },
                     child: Container(
                      height: 20,
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
                               flex: 3,
                               child: FractionallySizedBox(
                                 heightFactor: 1,
                                 widthFactor: 1,
                                 alignment: Alignment.centerLeft,
                                 child: Text(f['judul'], style: TextStyle(fontSize: 25),)),
                               ),
                               Flexible(                         
                                flex: 1,                         
                                child: FractionallySizedBox(                           
                                    heightFactor: 1,                           
                                    widthFactor: 1,
                                    child: Align(
                                      child: Text(f['jam'], style: TextStyle(fontSize: 20),),
                                    widthFactor: 1,
                                    alignment: Alignment.centerRight)
                                )
                              ),
                            ],
                         ),
                   ),
                   );
                },
              );
           }
         );
  }}

  class selasa extends StatefulWidget{
  @override
  State<selasa> createState() {
    // TODO: implement createState
    return selasa_state();
  }
}
class selasa_state extends State<selasa>{

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com').collection('selasa');
    // TODO: implement build
    return  StreamBuilder(
           stream: ref.snapshots(),
           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
             return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2),
             shrinkWrap: true,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index) {
                DocumentSnapshot f = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>edittask(f, 'selasa')))
                    },
                     child: Container(
                      height: 20,
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
                               flex: 3,
                               child: FractionallySizedBox(
                                 heightFactor: 1,
                                 widthFactor: 1,
                                 alignment: Alignment.centerLeft,
                                 child: Text(f['judul'], style: TextStyle(fontSize: 25),)),
                               ),
                               Flexible(                         
                                flex: 1,                         
                                child: FractionallySizedBox(                           
                                    heightFactor: 1,                           
                                    widthFactor: 1,
                                    child: Align(
                                      child: Text(f['jam'], style: TextStyle(fontSize: 20),),
                                    widthFactor: 1,
                                    alignment: Alignment.centerRight)
                                )
                              ),
                            ],
                         ),
                   ),
                   );
                },
              );
           }
         );
         }
      }

  class rabu extends StatefulWidget{
  @override
  State<rabu> createState() {
    // TODO: implement createState
    return rabu_state();
  }
}
class rabu_state extends State<rabu>{

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com').collection('rabu');
    // TODO: implement build
    return  StreamBuilder(
           stream: ref.snapshots(),
           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
             return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2),
             shrinkWrap: true,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index) {
                DocumentSnapshot f = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>edittask(f, 'rabu')))
                    },
                     child: Container(
                      height: 20,
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
                               flex: 3,
                               child: FractionallySizedBox(
                                 heightFactor: 1,
                                 widthFactor: 1,
                                 alignment: Alignment.centerLeft,
                                 child: Text(f['judul'], style: TextStyle(fontSize: 25),)),
                               ),
                               Flexible(                         
                                flex: 1,                         
                                child: FractionallySizedBox(                           
                                    heightFactor: 1,                           
                                    widthFactor: 1,
                                    child: Align(
                                      child: Text(f['jam'], style: TextStyle(fontSize: 20),),
                                    widthFactor: 1,
                                    alignment: Alignment.centerRight)
                                )
                              ),
                            ],
                         ),
                   ),
                   );
                },
              );
           }
         );
  }}
  class kamis extends StatefulWidget{
  @override
  State<kamis> createState() {
    // TODO: implement createState
    return kamis_state();
  }
}
class kamis_state extends State<kamis>{

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com').collection('kamis');

    // TODO: implement build
    return  StreamBuilder(
           stream: ref.snapshots(),
           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
             return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2),
             shrinkWrap: true,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index) {
                DocumentSnapshot f = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>edittask(f, 'kamis')))
                    },
                     child: Container(
                      height: 20,
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
                               flex: 3,
                               child: FractionallySizedBox(
                                 heightFactor: 1,
                                 widthFactor: 1,
                                 alignment: Alignment.centerLeft,
                                 child: Text(f['judul'], style: TextStyle(fontSize: 25),)),
                               ),
                               Flexible(                         
                                flex: 1,                         
                                child: FractionallySizedBox(                           
                                    heightFactor: 1,                           
                                    widthFactor: 1,
                                    child: Align(
                                      child: Text(f['jam'], style: TextStyle(fontSize: 20),),
                                    widthFactor: 1,
                                    alignment: Alignment.centerRight)
                                )
                              ),
                            ],
                         ),
                   ),
                   );
                },
              );
           }
         );
  }}
  class jumat extends StatefulWidget{
  @override
  State<jumat> createState() {
    // TODO: implement createState
    return jumat_state();
  }
}
class jumat_state extends State<jumat>{

 @override
  Widget build(BuildContext context) {

    final ref = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com').collection('jumat');
    
    // TODO: implement build
    return  StreamBuilder(
           stream: ref.snapshots(),
           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
             return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2),
             shrinkWrap: true,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index) {
                DocumentSnapshot f = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>edittask(f, 'jumat')))
                    },
                     child: Container(
                      height: 20,
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
                               flex: 3,
                               child: FractionallySizedBox(
                                 heightFactor: 1,
                                 widthFactor: 1,
                                 alignment: Alignment.centerLeft,
                                 child: Text(f['judul'], style: TextStyle(fontSize: 25),)),
                               ),
                               Flexible(                         
                                flex: 1,                         
                                child: FractionallySizedBox(                           
                                    heightFactor: 1,                           
                                    widthFactor: 1,
                                    child: Align(
                                      child: Text(f['jam'], style: TextStyle(fontSize: 20),),
                                    widthFactor: 1,
                                    alignment: Alignment.centerRight)
                                )
                              ),
                            ],
                         ),
                   ),
                   );
                },
              );
           }
         );
  }
  }
  class sabtu extends StatefulWidget{
  @override
  State<sabtu> createState() {
    // TODO: implement createState
    return sabtu_state();
  }
}
class sabtu_state extends State<sabtu>{

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com').collection('sabtu');
    
    // TODO: implement build
    return  StreamBuilder(
           stream: ref.snapshots(),
           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
             return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2),
             shrinkWrap: true,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index) {
                DocumentSnapshot f = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>edittask(f, 'sabtu')))
                    },
                     child: Container(
                      height: 20,
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
                               flex: 3,
                               child: FractionallySizedBox(
                                 heightFactor: 1,
                                 widthFactor: 1,
                                 alignment: Alignment.centerLeft,
                                 child: Text(f['judul'], style: TextStyle(fontSize: 25),)),
                               ),
                               Flexible(                         
                                flex: 1,                         
                                child: FractionallySizedBox(                           
                                    heightFactor: 1,                           
                                    widthFactor: 1,
                                    child: Align(
                                      child: Text(f['jam'], style: TextStyle(fontSize: 20),),
                                    widthFactor: 1,
                                    alignment: Alignment.centerRight)
                                )
                              ),
                            ],
                         ),
                   ),
                   );
                },
              );
           }
         );
  }}
  class minggu extends StatefulWidget{
  @override
  State<minggu> createState() {
    // TODO: implement createState
    return minggu_state();
  }
}
class minggu_state extends State<minggu>{

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseFirestore.instance.collection('task').doc('ahfaitar2@gmail.com').collection('minggu');
    
    // TODO: implement build
    return  StreamBuilder(
           stream: ref.snapshots(),
           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
             return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio: 2),
             shrinkWrap: true,
             itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
             itemBuilder: (_,index) {
                DocumentSnapshot f = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => {
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>edittask(f, 'minggu')))
                    },
                     child: Container(
                      height: 20,
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
                               flex: 3,
                               child: FractionallySizedBox(
                                 heightFactor: 1,
                                 widthFactor: 1,
                                 alignment: Alignment.centerLeft,
                                 child: Text(f['judul'], style: TextStyle(fontSize: 25),)),
                               ),
                               Flexible(                         
                                flex: 1,                         
                                child: FractionallySizedBox(                           
                                    heightFactor: 1,                           
                                    widthFactor: 1,
                                    child: Align(
                                      child: Text(f['jam'], style: TextStyle(fontSize: 20),),
                                    widthFactor: 1,
                                    alignment: Alignment.centerRight)
                                )
                              ),
                            ],
                         ),
                   ),
                   );
                },
              );
           }
         );
  }}