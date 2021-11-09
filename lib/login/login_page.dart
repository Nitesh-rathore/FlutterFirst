import 'package:flutter/material.dart';
import 'package:flutter_first/utils/AppRoutes.dart';
import 'package:flutter_first/utils/Strings.dart';

//import 'package:helloworld/pages/home_page.dart';
import '../bg_Image.dart';
import 'package:flutter_first/utils/Constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/securelogin.png", fit: BoxFit.cover),
              Text("Welcome",
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: Strings.enterUsernameHint,
                      labelText: Strings.username),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: Strings.enterPasswordHint,
                      labelText: Strings.password),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  //Below line of code we can user directly to move another class without routes
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));

                  //Below line of code we can user if we define routes in main.dart
                  //Navigator.pushNamed(context, "/home");

                  Constants.prefs!.setBool("loggedIn", true);
                  Navigator.pushReplacementNamed(context, AppRoutes.homeRts);
                },
                style: TextButton.styleFrom(minimumSize: Size(170, 50)),
                child: Text(
                  "Login",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
