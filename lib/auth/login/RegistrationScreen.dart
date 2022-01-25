import 'package:era_elearn/screens/mainScreen.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:era_elearn/widgets/progressDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'loginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  static const String idScreen = 'Registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Image(
              image: AssetImage('assets/sign_in.png'),
              width: 250,
              height: 250,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 1,
            ),
            const CommonText(
              text: 'Register as a Learner',
              size: 24,
              color: Colors.black,
              weight: FontWeight.bold,
              fontFamily: 'Brand Bold',
            ),
            const SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Your Name',
                    size: 16,
                    color: Colors.grey[600],
                    weight: FontWeight.w500,
                    fontFamily: 'Brand Bold',
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.edit_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          fontSize: 18,
                        )),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  CommonText(
                    text: 'Phone Number',
                    size: 16,
                    color: Colors.grey[600],
                    weight: FontWeight.w500,
                    fontFamily: 'Brand Bold',
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.mobile_friendly_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(
                          fontSize: 18,
                        )),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  CommonText(
                    text: 'Email',
                    size: 16,
                    color: Colors.grey[600],
                    weight: FontWeight.w500,
                    fontFamily: 'Brand Bold',
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.deepPurpleAccent,
                        ),
                        hintText: 'demo@gmail.com',
                        hintStyle: TextStyle(
                          fontSize: 18,
                        )),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  CommonText(
                    text: 'Password',
                    size: 16,
                    color: Colors.grey[600],
                    weight: FontWeight.w500,
                    fontFamily: 'Brand Bold',
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: show,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.deepPurpleAccent,
                        ),
                        suffixIcon: InkWell(
                            onTap: () => setState(() {
                                  show = !show;
                                }),
                            child: !show
                                ? const Icon(Icons.visibility_rounded,color: Colors.blue,)
                                : const Icon(Icons.visibility_off_rounded,color: Colors.blue,)),
                        hintText: 'Type Password',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                        )),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.purple[400],
                    onPressed: () {
                      if (nameController.text.length < 4) {
                        displayToast('Name must be at least 4 characters');
                      } else if (!emailController.text.contains('@')) {
                        displayToast('Email address is not valid');
                      } else if (phoneController.text.isEmpty) {
                        displayToast('Phone Number is mandatory');
                      } else if (passwordController.text.length < 6) {
                        displayToast('Password must be at least 6 characters');
                      } else {
                        registerUser(context);
                      }
                    },
                    child: const SizedBox(
                      height: 50,
                      child: Center(
                        child: CommonText(
                          text: 'Create Account',
                          fontFamily: 'Brand Bold',
                          size: 30,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                ],
              ),
            ),
            FlatButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.idScreen, (route) => false),
                child: const CommonText(
                  text: 'Already have an Account? Sing In',
                  size: 20,
                ))
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerUser(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          const ProgressDialog(message: '  Authenticating. Please wait...'),
    );

    final User? user = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .catchError((e) {
      displayToast('Error:' + e.toString());
    }))
        .user;
    if (user != null) {
      displayToast('Congratualations! your account has been created');
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.idScreen, (route) => false);
    } else {
      //error- dislay error msg
      displayToast('New user account has not been created');
    }
  }

  void displayToast(
    String message,
  ) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
