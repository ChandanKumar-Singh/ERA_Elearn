import 'package:era_elearn/drawerActions/forgotPassword.dart';
import 'package:era_elearn/screens/mainScreen.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:era_elearn/widgets/navigationWidgets.dart';
import 'package:era_elearn/widgets/progressDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'RegistrationScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String idScreen = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool show = false;

  bool isLoading = false;
  bool checkBox = false;
  bool showP = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Image(
              image: AssetImage('assets/sign_in.png'),
              width: 300,
              height: 300,
              alignment: Alignment.center,
            ),
            const CommonText(
              text: 'Login as a Learner',
              size: 24,
              color: Colors.black,
              weight: FontWeight.bold,
              fontFamily: 'Brand Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: 'Email',
                    size: 16,
                    color: Colors.grey[600],
                    weight: FontWeight.w500,
                    fontFamily: 'Brand Bold',
                  ),
                  TextFormField(
                    enabled: !isLoading,
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
                    enabled: !isLoading,
                    controller: passwordController,
                    obscureText: show,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.deepPurpleAccent,
                        ),
                        suffixIcon: InkWell(
                            onTap: () => setState(() {
                                  show = !show;
                                }),
                            child: show
                                ? const Icon(
                                    Icons.visibility_rounded,
                                    color: Colors.blue,
                                  )
                                : const Icon(
                                    Icons.visibility_off_rounded,
                                    color: Colors.blue,
                                  )),
                        hintText: 'Type Password',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                        )),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => setState(() {
                          checkBox = !checkBox;
                        }),
                        child: Row(
                          children: [
                            Checkbox(
                                value: checkBox,
                                onChanged: (value) => setState(() {
                                      checkBox = value!;
                                    })),
                            const SizedBox(
                              width: 5,
                            ),
                            CommonText(
                              text: 'Remember me',
                              size: 15,
                              color: Colors.grey[600],
                              weight: FontWeight.w500,
                              fontFamily: 'Brand Bold',
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => ChangeScreen(context, ForgotPassword()),
                        child: CommonText(
                          text: 'Forgot your password ?',
                          size: 15,
                          color: Colors.grey[600],
                          weight: FontWeight.w500,
                          fontFamily: 'Brand Bold',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.purple[400],
                    onPressed: () {
                      if (!emailController.text.contains('@')) {
                        displayToast('Email address is not valid');
                      } else if (passwordController.text.length < 6) {
                        displayToast('Password must be at least 6 characters');
                      } else {
                        loginUser(context);
                      }
                    },
                    child: Container(
                      height: 50,
                      child: const Center(
                        child: CommonText(
                          text: 'Login',
                          fontFamily: 'Brand Bold',
                          size: 30,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, RegistrationScreen.idScreen, (route) => false),
              child: const CommonText(
                text: 'Don\'t have an Account? Register Here',
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void displayToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> loginUser(BuildContext context) async {
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
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .catchError((e) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop();
      displayToast('Error:' + e.toString());
    }))
        .user;
    if (user != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, MainScreen.idScreen, (route) => false);
      displayToast('Congratulations! your are logged in now. 😊😊😊');
    } else {
      Navigator.of(context).pop();
      setState(() {
        isLoading = false;
      });
      displayToast('Error occurred: couldn\'t signIn 😟');
    }
  }

  Future<void> updatePassword(String newPass) async {
    try {
      await _firebaseAuth.currentUser!
          .updatePassword(newPass)
          .then((value) => print('Password Changed'));
    } on FirebaseAuthException catch (e) {
      displayToast(e.message!);
    }
  }
}
