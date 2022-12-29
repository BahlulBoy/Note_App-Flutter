import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_app/task/task.dart';
import 'package:note_app/account/account.dart';
import 'package:note_app/note/note.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:note_app/note/addnote.dart';
import 'package:note_app/task/addtask.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current_tab = 0;
  final List<Widget> screens = [
    Note(),
    Tas(),
    ProfilePage(),
  ];
  final GlobalKey<AnimatedFloatingActionButtonState> key =GlobalKey<AnimatedFloatingActionButtonState>();
  final PageStorageBucket page = PageStorageBucket();
  // ignore: non_constant_identifier_names

  Widget addNote() {
    return Container(
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddNote()));
        },
        tooltip: 'First button',
        child: Icon(Icons.note_add_sharp),
      ),
    );
  }

  Widget addTask() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Addtask()));
        },
        heroTag: null,
        tooltip: 'First button',
        child: Icon(Icons.add_task),
      ),
    );
  }

  Widget logout() {
    return Container(
    child: FloatingActionButton(
        backgroundColor: Color.fromRGBO(222, 185, 96, 1.0),
        child: Icon(
          Icons.logout_outlined,
          size: 30,
          color: Colors.white),
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
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
          height: 60,
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
                iconSize: 35,
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
                iconSize: 35,
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
                iconSize: 35,
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
