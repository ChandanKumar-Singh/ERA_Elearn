import 'package:era_elearn/widgets/commonText.dart';
import 'package:flutter/material.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  _HelpSupportState createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => print('call'),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(1, 1),
                                    blurRadius: 4,
                                  )
                                ]),
                            child: const Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () => print('video call'),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(1, 1),
                                    blurRadius: 4,
                                  )
                                ]),
                            child: const Icon(
                              Icons.video_call_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            helper(),
                            helperMsg(),
                            helperMsg(),
                            const SizedBox(
                              height: 5,
                            ),
                            yourMsg(),
                            const SizedBox(
                              height: 5,
                            ),helper(),
                            helperMsg(),
                            helperMsg(),
                            const SizedBox(
                              height: 5,
                            ),
                            yourMsg(),
                            const SizedBox(
                              height: 5,
                            ),helper(),
                            helperMsg(),
                            helperMsg(),
                            const SizedBox(
                              height: 5,
                            ),
                            yourMsg(),
                            const SizedBox(
                              height: 5,
                            ),helper(),
                            helperMsg(),
                            helperMsg(),
                            const SizedBox(
                              height: 5,
                            ),
                            yourMsg(),
                            const SizedBox(
                              height: 5,
                            ),helper(),
                            helperMsg(),
                            helperMsg(),
                            const SizedBox(
                              height: 5,
                            ),
                            yourMsg(),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    )
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
                    text: 'Help & Support',
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
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(1, 1),
                  blurRadius: 4,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => print('emoji'),
                  icon: const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.red,
                    size: 20,
                  )),
              IconButton(
                  onPressed: () => print('photo'),
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.red,
                    size: 20,
                  )),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'type message'),
              )),
              IconButton(
                  onPressed: () => print('send'),
                  icon: const Icon(
                    Icons.send_rounded,
                    color: Colors.purple,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget helper() {
    return Row(
      children: [
        CircleAvatar(
          child: Image.asset(
            'assets/1.png',
            fit: BoxFit.cover,
          ),
          radius: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CommonText(
                text: 'Chandan K S',
                size: 10,
                weight: FontWeight.bold,
                color: Colors.red,
              ),
              CommonText(
                text: '5:10 pm',
                size: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget helperMsg() {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            height: 40,
            width: w - 25,
            decoration: BoxDecoration(
                color: Color(0xfffae6d9),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.black54,
                //     offset: Offset(1, 1),
                //     blurRadius: 4,
                //   )
                // ]
            ),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('hiii...'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  Widget yourMsg() {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 40,
            width: w - 25,
            decoration: const BoxDecoration(
                color:  Color(0xffe2fae2),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.black54,
                //     offset: Offset(1, 1),
                //     blurRadius: 4,
                //   )
                // ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('hiii...'),
                ),
              ],
            ),
          ),
          CommonText(
            size: 12,
            text: 'seen message',
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
