import 'package:era_elearn/widgets/BottomBar.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                height: h * 0.72,
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: 11,
                    itemBuilder: (context,i)=>Card(
                      elevation: 6,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  CommonText(text: 'Confirm Your Payment',size: 18,weight: FontWeight.w500,),
                                  CommonText(text: '10:30 PM',size: 18,weight: FontWeight.normal,),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Container(width: w*0.6,child: CommonText(text: 'Pls confirm your payment in your bank account',size: 15,weight: FontWeight.normal,)),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                  ),
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // IconButton(
                      //   icon: const Icon(
                      //     Icons.arrow_back,
                      //     color: Colors.white,
                      //     size: 30,
                      //   ),
                      //   onPressed: () => Navigator.of(context).pop(),
                      // ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CommonText(
                          text: 'Notifications',
                          color: Colors.white,
                          size: 25,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: RaisedButton(
                          color: Colors.deepPurpleAccent,
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CommonText(
                              text: '11',
                              color: Colors.white,
                              size: 27,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),bottomNavigationBar: const BottomBar(),
    );
  }
}
