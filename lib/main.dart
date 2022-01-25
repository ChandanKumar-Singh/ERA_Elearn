import 'dart:async';

import 'package:era_elearn/auth/login/RegistrationScreen.dart';
import 'package:era_elearn/auth/login/loginScreen.dart';
import 'package:era_elearn/screens/mainScreen.dart';
import 'package:era_elearn/widgets/navigationWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'onboarding/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Era-elean',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Rajdhani'),
      initialRoute: SplashScreen.idScreen,
      routes: {
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreen: (context) => MainScreen(),
        OnBoarding.idScreen: (context) => OnBoarding(),
        SplashScreen.idScreen: (context) => SplashScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String idScreen = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
            () => ChangeScreenReplacement(
            context, user == null ? OnBoarding() : MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xc87352e8),
      body: Container(
        child: Center(
          child: Image.asset('assets/splash_logo.png'),
        ),
      ),
    );
  }
}
