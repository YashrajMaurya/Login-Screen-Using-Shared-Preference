import 'package:flutter/material.dart';
import 'package:login_screen/LoginScreen.dart';
import 'package:login_screen/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home,
                size: 54,
              ),
              const SizedBox(
                height: 200,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setBool(MyHomePageState.KEYLOGIN, false);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Loginscreen()));
                  },
                  child: const Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }
}
