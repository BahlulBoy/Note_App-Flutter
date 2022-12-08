// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:note_app/firebase/firebase_options.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
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
  final GlobalKey<AnimatedFloatingActionButtonState> key =GlobalKey<AnimatedFloatingActionButtonState>();
  final PageStorageBucket page = PageStorageBucket();
  // ignore: non_constant_identifier_names

  Widget addNote() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        heroTag: "btn1",
        tooltip: 'First button',
        child: Icon(Icons.note_add_sharp),
      ),
    );
  }

  Widget addTask() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        heroTag: "btn1",
        tooltip: 'First button',
        child: Icon(Icons.add_task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: page,
        child: screens[current_tab]
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: <Widget> [
          addNote(), addTask()
        ], 
        curve: Curves.easeInOutCirc,
        animatedIconData: AnimatedIcons.menu_home,
        colorStartAnimation: Color.fromRGBO(222, 185, 96, 1),
        colorEndAnimation: Color.fromARGB(255, 240, 127, 127),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(36, 35, 34, 1.0),
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 75,
          child: Row(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: <Widget> [
              IconButton(
                onPressed: () {
                  setState(() {
                  current_tab = 0;
                });
                }, 
                padding: EdgeInsets.symmetric(horizontal: 30),
                iconSize: 40,
                icon: Icon(
                  Icons.list_alt,
                  color: current_tab == 0 ? Color.fromARGB(255, 141, 141, 141) :Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                  current_tab = 1;
                });
                }, 
                iconSize: 40,
                padding: EdgeInsets.symmetric(horizontal: 30),
                icon: Icon(
                  Icons.note_add_sharp,
                  color: current_tab == 1 ? Color.fromARGB(255, 141, 141, 141) :Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
              IconButton(
                onPressed: () {
                setState(() {
                  current_tab = 2;
                });
                }, 
                iconSize: 40,
                padding: EdgeInsets.symmetric(horizontal: 30),
                icon: Icon(
                  Icons.account_circle,
                  color: current_tab == 2 ? Color.fromARGB(255, 141, 141, 141) :Color.fromRGBO(102, 102, 102, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
