import 'package:era_elearn/screens/mainScreen.dart';
import 'package:era_elearn/widgets/BottomBar.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:era_elearn/widgets/navigationWidgets.dart';
import 'package:flutter/material.dart';

class Buy extends StatefulWidget {
  const Buy({Key? key}) : super(key: key);

  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  bool cardRadio = false;
  bool mobileRadio = false;

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
                height: h * 0.82,
                width: w,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: ListView(
                    children: [
                      Container(
                        height: 140,
                        width: w,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 1),
                                  blurRadius: 2)
                            ]),
                        child: Row(
                          children: [
                            Container(
                                width: 175,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/flutter_assets/assets/images/coupon/1.png'),
                                      fit: BoxFit.cover),
                                )),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CommonText(
                                        text: 'Basic Graphics Course 2021',
                                        size: 20,
                                        weight: FontWeight.w600,
                                      ),
                                      const CommonText(
                                        text: 'Cks',
                                        size: 18,
                                        color: Colors.grey,
                                        weight: FontWeight.bold,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/flutter_assets/assets/images/star.png',
                                              ),
                                              const Text(
                                                '5.0',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            '\$15.0',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          children: [
                            const Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.card_giftcard_rounded,
                                  color: Color(0xFF532EF3),
                                  size: 25,
                                ),
                                hintText: 'Enter Coupon',
                                border: UnderlineInputBorder(),
                              ),
                            )),
                            RaisedButton(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13),
                                color: Color(0xFF532EF3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {},
                                child: const CommonText(
                                  text: 'Apply Coupon',
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          cardRadio = !cardRadio;
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                    blurRadius: 5)
                              ]),
                          child: Row(
                            children: [
                              cardRadio
                                  ? const Icon(
                                      Icons.radio_button_checked_rounded,
                                      color: Colors.blue,
                                    )
                                  : const Icon(
                                      Icons.radio_button_off_rounded,
                                      color: Colors.blue,
                                    ),
                              // Checkbox(value: true, onChanged: (value) {}),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 250,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, i) => Row(
                                    children: [
                                      Image.asset(
                                        'assets/card${i + 1}.png',
                                        height: 45,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      cardRadio
                          ? Column(
                              children: [
                                Container(
                                    height: 100,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 4,
                                      itemBuilder: (context, i) => Row(
                                        children: [
                                          InkWell(
                                            onTap: () => print('card'),
                                            child: Image.asset(
                                              'assets/card${i + 1}.png',
                                              height: 100,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          )
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      InkWell(
                        onTap: () => setState(() {
                          mobileRadio = !mobileRadio;
                        }),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                    blurRadius: 5)
                              ]),
                          child: Row(
                            children: [
                              mobileRadio
                                  ? const Icon(
                                      Icons.radio_button_checked_rounded,
                                      color: Colors.blue,
                                    )
                                  : const Icon(
                                      Icons.radio_button_off_rounded,
                                      color: Colors.blue,
                                    ),
                              const SizedBox(
                                width: 50,
                              ),
                              const CommonText(
                                text: 'Mobile Banking',
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      mobileRadio
                          ? Column(
                              children: [
                                Container(
                                    height: 100,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 4,
                                      itemBuilder: (context, i) => Row(
                                        children: [
                                          InkWell(
                                            onTap: () => print('card'),
                                            child: Image.asset(
                                              'assets/card${i + 1}.png',
                                              height: 100,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          )
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      cardRadio == true || mobileRadio == true
                          ? const SizedBox(
                              height: 40,
                            )
                          : const SizedBox(
                              height: 170,
                            ),
                      InkWell(
                        onTap: () async {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              elevation: 7,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: h * 0.6,
                                width: w * 0.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Image.asset('assets/1.png'),
                                    const SizedBox(height: 10,),
                                    const CommonText(text: 'Successfully Payment',size: 18,),
                                    const SizedBox(height: 10,),

                                    RaisedButton(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 13),
                                        color: Color(0xFF532EF3),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        onPressed: () =>ChangeScreen(context, MainScreen()),
                                        child: const CommonText(
                                          text: 'Back To Home',
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: h * 0.07,
                          width: w,
                          decoration: BoxDecoration(
                              color: Colors.orange[800],
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: CommonText(
                              text: 'Payment',
                              size: 20,
                              weight: FontWeight.w600,
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
                  CommonText(
                    text: 'Payment',
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
