import 'package:era_elearn/widgets/commonText.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();


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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: ListView(
                    children: [
                      Image.asset(
                        'assets/flutter_assets/assets/images/forgot_password.png',
                        height: h * 0.35,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      CommonText(
                        text: 'Email',
                        size: 15,
                        color: Colors.grey[600],
                        weight: FontWeight.w400,
                        fontFamily: 'Brand Bold',
                      ),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.deepPurpleAccent,
                            ),
                            hintText: 'demo@gmail.com',
                            hintStyle: TextStyle(
                              fontSize: 16,
                            )),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () => print('SEND CODE'),
                        child: Container(
                          height: h * 0.07,
                          width: w,
                          decoration: BoxDecoration(
                              color: Color(0xFF363CB4),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: CommonText(
                              text: 'SEND CODE',
                              size: 20,color: Colors.white70,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ), const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
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
}
