import 'package:era_elearn/auth/login/anonymous.dart';
import 'package:era_elearn/drawerActions/accountInfo.dart';
import 'package:era_elearn/drawerActions/changePassword.dart';
import 'package:era_elearn/drawerActions/coupon.dart';
import 'package:era_elearn/drawerActions/help.dart';
import 'package:era_elearn/drawerActions/myWallet.dart';
import 'package:era_elearn/onboarding/onboarding.dart';
import 'package:era_elearn/screens/category.dart';
import 'package:era_elearn/screens/latestCoursesScreen.dart';
import 'package:era_elearn/widgets/BottomBar.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:era_elearn/widgets/navigationWidgets.dart';
import 'package:era_elearn/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'filter.dart';
import 'myCourses.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String idScreen = 'mainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

Color color(int i) {
  if (i % 3 == 0) {
    return Color(0xf27df1e5);
  }
  if (i % 3 == 1) {
    return const Color(0xf2f8caca);
  } else {
    return Color(0xf2979cfa);
  }
}

List category = [
  ['1', 'Technology'],
  ['2', 'Language'],
  ['3', 'Art & Design'],
  ['4', 'Business'],
];
List latest = ['1', '2', '3'];
List category_details = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  User? user = FirebaseAuth.instance.currentUser;
  firebase_storage.FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: drawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/flutter_assets/assets/images/home_bg.png',
                  width: w,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                    child: Container(
                  width: w,
                  height: h / 2.78,
                  color: Color(0x954336F0),
                ))
              ],
            ),
            Positioned(
              child: SizedBox(
                height: h,
                width: w,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: h / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () =>
                                        _scaffoldKey.currentState!.openDrawer(),
                                    icon: const Icon(
                                      Icons.menu_open_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    )),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Grow Your Own Skill By Online Learning',
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: h / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.orange[800]),
                                  child: IconButton(
                                      onPressed: () => ChangeScreen(
                                          context,
                                          MyCourses(
                                            button: 'My Courses',
                                          )),
                                      icon: const Icon(
                                        Icons.account_balance_wallet_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Search Result',
                                            hintStyle: TextStyle()),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                          onPressed: () => print('Search'),
                                          icon: const Icon(
                                            Icons.search_rounded,
                                            size: 30,
                                            color: Colors.white,
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orange[800],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: IconButton(
                                onPressed: () =>
                                    ChangeScreen(context, Filter()),
                                icon: const Icon(
                                  Icons.filter_list_rounded,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: InkWell(
                                onTap: () => ChangeScreen(
                                    context,
                                    Category(
                                      catName: category[i][1],
                                    )),
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: color(i),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 70,
                                        child: Image.asset(
                                          'assets/flutter_assets/assets/images/category/${category[0][0]}.png',
                                        ),
                                      ),
                                      Text(category[i][1])
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Our Instructors',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 160,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, top: 10),
                              child: Container(
                                width: 107,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      child: Image.asset(
                                        'assets/flutter_assets/assets/images/instructor/${category[0][0]}.png',
                                        fit: BoxFit.cover,
                                      ),
                                      radius: 40,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'Our Instuctors',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    const Text(
                                      'Our Instuctors',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/flutter_assets/assets/images/star.png',
                                        ),
                                        Image.asset(
                                          'assets/flutter_assets/assets/images/star.png',
                                        ),
                                        Image.asset(
                                          'assets/flutter_assets/assets/images/star.png',
                                        ),
                                        Image.asset(
                                          'assets/flutter_assets/assets/images/star.png',
                                        ),
                                        Image.asset(
                                          'assets/flutter_assets/assets/images/star.png',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Latest Courses',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: latest.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: InkWell(
                                onTap: () => ChangeScreen(
                                    context,
                                    LatestCourseScreen(
                                        courseName: 'Our Instuctors Unders')),
                                child: Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 120,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/flutter_assets/assets/images/latest/1.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Our Instuctors Unders',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            SizedBox(
                                              height: 1,
                                            ),
                                            Text(
                                              'Our Instuctors Okay',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/flutter_assets/assets/images/star.png',
                                                  ),
                                                  const Text(
                                                    '5.0',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Text(
                                                '\$15.0',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Weekly Best Sellers',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 9,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: InkWell(
                                onTap: () => ChangeScreen(
                                    context,
                                    LatestCourseScreen(
                                        courseName: 'Our Instuctors Unders')),
                                child: Card(
                                  elevation: 6,
                                  child: Container(
                                    width: 270,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/flutter_assets/assets/images/category_details/1.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Our Instuctors Unders 2021',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              const SizedBox(
                                                height: 1,
                                              ),
                                              const Text(
                                                'Our Instuctors Okay',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                          'assets/flutter_assets/assets/images/star.png',
                                                        ),
                                                        const Text(
                                                          '5.0',
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Text(
                                                      '\$15.0',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        'assets/1.png'),
                                                    radius: 20,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        'Our Instuctors ',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                      Text(
                                                        'Our Instuctors Okay',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class drawer extends StatelessWidget {
  drawer({Key? key}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;
  firebase_storage.FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xF86D51D2),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.height / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const CommonText(
                                    text: 'LogOut',
                                    size: 25,
                                    weight: FontWeight.bold,
                                  ),
                                  content: const CommonText(
                                    text: 'Are you sure to log out?',
                                    size: 20,
                                    weight: FontWeight.normal,
                                  ),
                                  actions: [
                                    FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const CommonText(
                                          text: 'Cancel',
                                          size: 20,
                                          weight: FontWeight.normal,
                                        )),
                                    FlatButton(
                                        onPressed: () async {
                                          await FirebaseAuth.instance.signOut();
                                          displayToast(
                                              'Logged Out Successfully 😟 ');
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  OnBoarding.idScreen,
                                                  (route) => false);
                                        },
                                        child: const CommonText(
                                          text: 'OK',
                                          size: 20,
                                          weight: FontWeight.normal,
                                        )),
                                  ],
                                ));
                      },
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                InkWell(
                  onTap: () => ChangeScreen(context, AccountInfo()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder<String>(
                          stream: FirebaseStorage.instance
                              .ref(user!.uid)
                              .child('profilePic')
                              .getDownloadURL()
                              .asStream(),
                          builder: (context, snapshot) {
                            print(snapshot.data);
                            // print(snapshot.connectionState);
                            print(snapshot.hasData);
                            print(snapshot.hasError);
                            if (snapshot.data == null || snapshot.hasError) {
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage('assets/profile.png'),
                                      // widget._image == null ||
                                      //         networkImage == null
                                      //     ? NetworkImage(networkImage!)
                                      //     :
                                      // FileImage(widget._image)
                                      // as ImageProvider,
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                // child: Center(
                                //   child: _image == null
                                //       ? Image.asset(
                                //           'assets/1.png',
                                //           fit: BoxFit.fill,
                                //         )
                                //       : Image.file(
                                //           _image,
                                //           fit: BoxFit.cover,
                                //         ),
                                // ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              final url = snapshot.data;
                              return Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('$url'),
                                      fit: BoxFit.cover),
                                  color: Color(0xF86D51D2),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                // child: Center(
                                //   child: _image == null
                                //       ? Image.asset(
                                //           'assets/1.png',
                                //           fit: BoxFit.fill,
                                //         )
                                //       : Image.file(
                                //           _image,
                                //           fit: BoxFit.cover,
                                //         ),
                                // ),
                              );
                            }
                            // if (snapshot.connectionState ==
                            //     ConnectionState.waiting) {
                            //   return Container(
                            //     height: 100,
                            //     width: 100,
                            //     decoration: BoxDecoration(
                            //       image: const DecorationImage(
                            //           image: AssetImage('assets/profile.png'),
                            //           fit: BoxFit.cover),
                            //       color: Color(0xF86D51D2),
                            //       borderRadius: BorderRadius.circular(100),
                            //     ),
                            //     // child: Center(
                            //     //   child: _image == null
                            //     //       ? Image.asset(
                            //     //           'assets/1.png',
                            //     //           fit: BoxFit.fill,
                            //     //         )
                            //     //       : Image.file(
                            //     //           _image,
                            //     //           fit: BoxFit.cover,
                            //     //         ),
                            //     // ),
                            //   );
                            // }
                            else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            return Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/profile.png'),
                                    // widget._image == null ||
                                    //         networkImage == null
                                    //     ? NetworkImage(networkImage!)
                                    //     :
                                    // FileImage(widget._image)
                                    // as ImageProvider,
                                    fit: BoxFit.cover),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              // child: Center(
                              //   child: _image == null
                              //       ? Image.asset(
                              //           'assets/1.png',
                              //           fit: BoxFit.fill,
                              //         )
                              //       : Image.file(
                              //           _image,
                              //           fit: BoxFit.cover,
                              //         ),
                              // ),
                            );

                            //         return
                            // Container(
                            //           height: 100,
                            //           width: 100,
                            //           decoration: BoxDecoration(
                            //             image: DecorationImage(
                            //               image: NetworkImage('https://miro.medium.com/focal/58/58/50/50/0*gpymykyqqqCCTp96'),
                            //             ),
                            //             color: Colors.green,
                            //             borderRadius: BorderRadius.circular(100),
                            //           ),
                            //           // child: Center(
                            //           //   child: _image == null
                            //           //       ? Image.asset(
                            //           //           'assets/1.png',
                            //           //           fit: BoxFit.fill,
                            //           //         )
                            //           //       : Image.file(
                            //           //           _image,
                            //           //           fit: BoxFit.cover,
                            //           //         ),
                            //           // ),
                            //         );
                          }),
                      // Container(
                      //   height: 100,
                      //   width: 100,
                      //   decoration: BoxDecoration(
                      //     image: const DecorationImage(
                      //       image:
                      //       NetworkImage(
                      //           'https://firebasestorage.googleapis.com/v0/b/era-elearn.appspot.com/o/mEQXCNsErCOnrSh1gaLc3TuuJYX2%2FprofilePic%2F2022-01-18%2022%3A32%3A52.479743?alt=media&token=505789e6-cd2e-4b58-97fd-1581e8e89dbd'),
                      //     ),
                      //     color: Colors.green,
                      //     borderRadius: BorderRadius.circular(100),
                      //   ),
                      //   // child: Center(
                      //   //   child: _image == null
                      //   //       ? Image.asset(
                      //   //           'assets/1.png',
                      //   //           fit: BoxFit.fill,
                      //   //         )
                      //   //       : Image.file(
                      //   //           _image,
                      //   //           fit: BoxFit.cover,
                      //   //         ),
                      //   // ),
                      // ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Chandan Kumar Singh',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                            Text(
                              'the.inventor.rev@gmail.com',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            onTap: () => ChangeScreen(context, MyCoupon()),
            horizontalTitleGap: 40,
            leading: Container(
              width: 40,
              height: 40,
              child: const Icon(
                Icons.card_giftcard_rounded,
                color: Colors.white,
              ),
            ),
            title: const CommonText(
              text: 'My Coupon',
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () => ChangeScreen(context, MyWallet()),
            horizontalTitleGap: 40,
            leading: Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
              ),
            ),
            title: const CommonText(
              text: 'My Wallet',
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () => ChangeScreen(context, ChangePassword()),
            horizontalTitleGap: 40,
            leading: Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
            title: const CommonText(
              text: 'Change Password',
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () => ChangeScreen(context, HelpSupport()),
            horizontalTitleGap: 40,
            leading: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.person_search_outlined,
                color: Colors.white,
              ),
            ),
            title: const CommonText(
              text: 'Help & Support',
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () => print('Leading'),
            horizontalTitleGap: 40,
            leading: Container(
              width: 40,
              height: 40,
              child: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
            ),
            title: const CommonText(
              text: 'Sign Out',
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
