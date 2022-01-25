import 'dart:io';

import 'package:era_elearn/widgets/commonText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AddCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    height: h * 0.3,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      child: Container(
                    height: h / 0.3,
                    color: Color(0x954336F0),
                  )),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  Container(
                    height: h * 0.7,
                    width: w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.only(
                      //     topRight: Radius.circular(20),
                      //     topLeft: Radius.circular(20))
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                height: h,
                width: w,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Row(
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
                            text: 'Add Card',
                            color: Colors.white,
                            size: 25,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: h * 0.27,
                        decoration: BoxDecoration(
                          color: Color(0xFF102E55),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(
                                height: 40,
                              ),
                              CommonText(
                                text: 'XXXX XXXX XXXX XXXX',
                                size: 25,
                                color: Colors.white70,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CommonText(
                                text: 'MM/YY',
                                size: 25,
                                color: Colors.white70,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CommonText(
                                text: 'CARD HOLDER',
                                size: 25,
                                color: Colors.white70,
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex:5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Expired Date',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CVV',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder Name',
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () => print('Proceed'),
                        child: Container(
                          height: h * 0.07,
                          width: w,
                          decoration: BoxDecoration(
                              color: Color(0xFF4B43B3),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: CommonText(
                              text: 'PROCEED',
                              size: 20,color: Colors.white,
                              weight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
