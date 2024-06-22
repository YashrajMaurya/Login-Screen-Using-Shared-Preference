import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_screen/HomePage.dart';
import 'package:login_screen/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Maurya',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )));
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var IsLoggedIn = sharedPref.getBool(KEYLOGIN);
    Timer(const Duration(seconds: 2), () {
      if(IsLoggedIn != null){
        if(IsLoggedIn){
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
        }else{
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Loginscreen()));
        }
      }else{
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Loginscreen()));
      }
    });
  }
}
