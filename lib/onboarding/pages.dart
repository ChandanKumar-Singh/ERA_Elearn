import 'package:era_elearn/auth/login/RegistrationScreen.dart';
import 'package:era_elearn/auth/login/anonymous.dart';
import 'package:era_elearn/auth/login/loginScreen.dart';
import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  const Pages(
      {Key? key,
      required this.image,
      required this.title,
      required this.content,
      required this.index,
      required this.controller})
      : super(key: key);
  final String image;
  final String title;
  final String content;
  final int index;
  final PageController controller;

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return PageView(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: h / 7, bottom: h / 15),
              child: SizedBox(
                width: w / 1.9,
                height: w / 1.8,
                child: Image.asset(
                  'assets/flutter_assets/assets/images/onboard/${widget.image}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: w / 15,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              widget.content,
                              style: TextStyle(
                                  fontSize: w / 22,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                    ),
                    widget.index == 3
                        ? Positioned(
                            bottom: 40,
                            left: 20,
                            right: 20,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginScreen())),
                                  child: Container(
                                    width: w / 2.2,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.orange,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'SIGN IN',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () => anonymous(context),
                                  child: Container(
                                    width: w / 2.2,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.purple[300],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'GET STARTED',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Positioned(
                            bottom: 40,
                            left: 20,
                            right: 20,
                            child: Buttons(
                              index: widget.index,
                              controller: widget.controller,
                            ),
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key, required this.index, required this.controller})
      : super(key: key);
  final int index;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 13,
              width: 20,
              decoration: BoxDecoration(
                  color: index == 0 ? Colors.purple[400] : Colors.grey,
                  borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 13,
              width: 20,
              decoration: BoxDecoration(
                  color: index == 1 ? Colors.purple[400] : Colors.grey,
                  borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 13,
              width: 20,
              decoration: BoxDecoration(
                  color: index == 2 ? Colors.purple[400] : Colors.grey,
                  borderRadius: BorderRadius.circular(20)),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 13,
              width: 20,
              decoration: BoxDecoration(
                  color: index == 3 ? Colors.purple[400] : Colors.grey,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => print('Skip'),
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 18),
              ),
            ),
            InkWell(
                onTap: () => controller.jumpToPage(index + 1),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orange),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
