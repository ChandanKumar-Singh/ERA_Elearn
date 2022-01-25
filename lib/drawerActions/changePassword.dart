import 'package:era_elearn/screens/mainScreen.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:era_elearn/widgets/navigationWidgets.dart';
import 'package:era_elearn/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool hidden0 = true;
  bool hidden1 = true;
  bool hidden2 = true;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: h,
              width: w,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/flutter_assets/assets/images/bg.png',
                    width: w,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                      child: Container(
                    width: w,
                    height: h / 5.3,
                    color: Color(0x954336F0),
                  )),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.8,
                width: w,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: ListView(
                  children: [
                    Image.asset(
                      'assets/flutter_assets/assets/images/change_password.png',
                      height: h * 0.35,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(text: 'Current Password'),
                          TextField(
                            controller: currentController,
                            obscureText: hidden0,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'type password',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.blue,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(() {
                                    // hidden = !hidden;
                                    hidden0 = !hidden0;
                                  }),
                                  child: Icon(
                                    hidden0
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    color: Colors.blue,
                                  ),
                                )),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(text: 'New Password'),
                          TextField(
                            controller: newController,
                            obscureText: hidden1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'type password',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.blue,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(() {
                                    hidden1 = !hidden1;
                                  }),
                                  child: Icon(
                                    hidden1
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    color: Colors.blue,
                                  ),
                                )),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonText(text: 'Confirm New Password'),
                          TextField(
                            controller: confirmController,
                            obscureText: hidden2,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'type password',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline_rounded,
                                  color: Colors.blue,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => setState(() {
                                    hidden2 = !hidden2;
                                  }),
                                  child: Icon(
                                    hidden2
                                        ? Icons.visibility_off_rounded
                                        : Icons.visibility_rounded,
                                    color: Colors.blue,
                                  ),
                                )),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                        onTap: () {
                          if (currentController.text.isEmpty) {
                            displayToast(
                                'Please enter your current password');
                          }
                          else if (newController.text.isEmpty) {
                            displayToast(
                                'Please enter your new password');
                          }else if (confirmController.text.isEmpty) {
                            displayToast(
                                'Please enter your confirm password');
                          }else if (newController.text.length < 6) {
                            displayToast(
                                'Password must be at least 6 characters');
                          } else if (confirmController.text.length < 6) {
                            displayToast(
                                'Password must be at least 6 characters');
                          } else if (newController.text !=
                              confirmController.text) {
                            displayToast(
                                'New Pass word and Confirm Password does not match');
                          } else {
                            updatePassword(confirmController.text);
                            Navigator.of(context).pop();
                            displayToast(
                                'Congratulations! Password has changed 😊😊😊');
                          }
                        },
                        child: Container(
                          height: h * 0.07,
                          width: w,
                          decoration: BoxDecoration(
                              color: Colors.orange[300],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: CommonText(
                              text: 'Change Password',
                              size: 20,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const CommonText(
                    text: 'Change Password',
                    color: Colors.white,
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> updatePassword(String newPass) async {
    try {
      await _firebaseAuth.currentUser!
          .updatePassword(newPass)
          .then((value) => print('Password Changed'));
      // ChangeScreen(context, MainScreen());
    } on FirebaseAuthException catch (e) {
      displayToast(e.message!);
    }
  }
}
