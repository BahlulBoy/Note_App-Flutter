// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:note_app/firebase_options.dart';
import './note/note.dart';
import './account/account.dart';
import './task/task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int current_tab = 0;
  final List<Widget> screens = [
    Note(),
    Task(),
    Account(),
  ];

  final PageStorageBucket page = PageStorageBucket();
  Widget current_screen = Note();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: page, 
        child: current_screen
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(222, 185, 96, 1.0),
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white),
        onPressed: () {
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(36, 35, 34, 1.0),
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 70,
          child: Row(
            children: <Widget> [
              IconButton(
                onPressed: () {}, 
                icon: Icon(
                  Icons.list
                ),
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(
                  Icons.list
                ),
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(
                  Icons.list
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
