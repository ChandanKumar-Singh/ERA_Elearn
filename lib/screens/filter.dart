import 'package:era_elearn/widgets/BottomBar.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  double sValue = 100;
  final key = GlobalKey();
  final key1 = GlobalKey();
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
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: const [
                                CommonText(
                                  text: 'Language',
                                  size: 25,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Wrap(
                              spacing: 5,
                              children: <Widget>[
                                CheckBox('Bangla'),
                                CheckBox('English'),
                                CheckBox('Hindi'),
                                CheckBox('Spanish'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: const [
                                CommonText(
                                  text: 'Level',
                                  size: 25,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Wrap(
                              spacing: 5,
                              children: <Widget>[
                                CheckBox('Beginner'),
                                CheckBox('Intermediate'),
                                CheckBox('Expert'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CommonText(
                                  text: 'Choose Price',
                                  size: 25,
                                  weight: FontWeight.w600,
                                ),
                                CommonText(
                                  text: '$sValue',
                                  size: 25,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Slider(
                                key: key,
                                value: 0,
                                min: 0,
                                max: 1000,
                                inactiveColor: Colors.deepPurpleAccent,
                                activeColor: Colors.orange,
                                label: '$sValue',
                                divisions: 1000,
                                onChanged: (double value) {
                                  setState(() {
                                    sValue = value;
                                  });
                                },
                              ),
                              Container(
                                child: Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Slider(
                                    key: key1,
                                    value: sValue,
                                    min: 0,
                                    max: 1000,
                                    inactiveColor: Colors.deepPurpleAccent,
                                    activeColor: Colors.orange,
                                    label: '\$$sValue',
                                    divisions: 1000,
                                    autofocus: true,
                                    onChanged: (double value) {
                                      setState(() {
                                        sValue = value;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: h * 0.06,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: InkWell(
                              onTap: () async {
                                showDialog(
                                  barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        backgroundColor: Color(0xFF6D3DF1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0)), //this right here
                                        child: Container(
                                          height: 300,
                                          width: 300,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const CircularProgressIndicator(
                                                    backgroundColor: Colors.blue,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  RaisedButton(
                                                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    onPressed: () =>Navigator.of(context).pop(),
                                                    child: const Text(
                                                      "CANCEL",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18),
                                                    ),
                                                    color: Colors.red,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    });

                                print('Apply Now');
                              },
                              child: Container(
                                height: h * 0.07,
                                width: w,
                                decoration: BoxDecoration(
                                    color: Colors.orange[300],
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: CommonText(
                                    text: 'Apply Now',
                                    size: 20,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.04,
                          ),
                        ],
                      ),
                    ],
                  )),
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
                    text: 'Filter by',
                    color: Colors.white,
                    size: 25,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),bottomNavigationBar: BottomBar(),
    );
  }
}

class CheckBox extends StatefulWidget {
  CheckBox(this.category);
  final String category;
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          checked = !checked;
        });
        print('Checkbox');
      },
      color: Color(0xDD4C31E8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checked
              ? const Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 18,
                )
              : const SizedBox.shrink(),
          const SizedBox(
            width: 6,
          ),
          CommonText(
            text: widget.category,
            size: 18,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
