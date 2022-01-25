import 'package:era_elearn/widgets/BottomBar.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:flutter/material.dart';

class MyCoupon extends StatefulWidget {
  const MyCoupon({Key? key}) : super(key: key);

  @override
  _MyCouponState createState() => _MyCouponState();
}

class _MyCouponState extends State<MyCoupon> {
  List coupons = [1, 2, 3, 4];
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
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: ListView.builder(
                    itemCount: coupons.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 160,
                          width: w,
                          decoration: BoxDecoration(
                              color: Colors.white,
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
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        topLeft: Radius.circular(15)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/1.png'),
                                        fit: BoxFit.cover),
                                  )),
                              Expanded(
                                  child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    CommonText(
                                      text: '\$5.0 OFF',
                                      size: 22,
                                      weight: FontWeight.bold,
                                    ),
                                    CommonText(
                                      text: '\$UX Designing',
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                    CommonText(
                                      text: 'Coupon Number: JDGSYE',
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    }),
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
                    text: 'My Coupon',
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
      bottomNavigationBar: const BottomBar(),
    );
  }
}
