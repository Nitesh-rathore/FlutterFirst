// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_first/pages/home_page_with_fb.dart';
import 'package:flutter_first/utils/AppRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';
import 'login/login_page.dart';
import 'utils/Constants.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'App background title',
    //home: MyHomePage(),
    //home: LoginPage(),
    home: Constants.prefs.getBool("loggedIn") == true ? MyHomePageFB() : LoginPage(),
    theme: ThemeData(primarySwatch: Colors.deepPurple, fontFamily: GoogleFonts.roboto().fontFamily),

    //Below routes used in different class for navigation e.g. review line 50 in login_page.dart
    routes: {
      AppRoutes.loginRts: (context) => LoginPage(),
      AppRoutes.homeRts: (context) => MyHomePage()
      //"/home": (context) => MyHomePageFB()
    },
  ));
}
