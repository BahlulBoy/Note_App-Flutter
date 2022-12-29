import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LOGIN / SIGN UP",
             style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             Container(
              margin: const EdgeInsets.fromLTRB(30, 15, 30, 10),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: emailController,
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Email'),
              ),
            ),
           Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 15),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: passwordController,
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Password'),
                    obscureText: true,
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            SizedBox(
                  width: 150,
               child: ElevatedButton(
                style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.blue.shade900)),
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if(email.isEmpty){
                    print("Email is Empty");
                  } else {
                    if(password.isEmpty){
                      print("Password is Empty");
                    } else {
                      context.read<AuthService>().login(
                        email,
                        password,
                      );
                    }
                  }
                },
                child: Text("LOG IN"),
              ),
            ),
            const SizedBox(
                  width: 15,
                ),
            SizedBox(
                  width: 150,
              child: ElevatedButton(
                style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.orange.shade900)),
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

                  if(email.isEmpty){
                    print("Email is Empty");
                  } else {
                    if(password.isEmpty){
                      print("Password is Empty");
                    } else {
                      context.read<AuthService>().signUp(
                        email,
                        password,
                      ).then((value) async {
                        User? user = FirebaseAuth.instance.currentUser;
                          if(user!=null && user.uid != null){
                        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
                          'uid': user.uid,
                          'email': email,
                          'password': password,
                        });
                         }else{
                            throw Error();
                          }
                       
                      });
                    }
                  }
                },
                child: Text("SIGN UP"),
              ),
            ),
            ],
        ),
          ],
        ),
      ),
    );
  }
}
