import 'dart:io';

import 'package:era_elearn/widgets/commonText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:path_provider/path_provider.dart';

class AccountInfo extends StatefulWidget {
  static var _imageA;
  var _image;

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  String? networkImage;

  void picDialog(BuildContext context) async {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: h * 0.16,
                width: w * 0.3,
                child: Center(
                  child: Container(
                    width: 190,
                    height: 125,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => openCamera(),
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.blue,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CommonText(
                                  text: 'Camera',
                                  size: 15,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () => openGallery(),
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.photo,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CommonText(
                                  text: 'From Gallery',
                                  size: 15,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  void openCamera() async {
    final image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        widget._image = File(image.path);
        AccountInfo._imageA = File(image.path);
      });
      uploadImgToFStorage();
    } else {
      return null;
    }
    Navigator.of(context).pop();
    // print(_image);
    // print( 'AccImage'+AccountInfo._image);
  }

  void openGallery() async {
    final image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        widget._image = File(image.path);
        AccountInfo._imageA = File(image.path);
      });
      uploadImgToFStorage();
    } else {
      return null;
    }
    Navigator.of(context).pop();
    // print(image.path);
    print('AccImgage' + '${AccountInfo._imageA}');
  }

  void uploadImgToFStorage() async {
    User? user = FirebaseAuth.instance.currentUser;
    firebase_storage.FirebaseStorage storage = FirebaseStorage.instance;

    Directory directory = await getApplicationDocumentsDirectory();
    File file = widget._image;

    String filePath = '${directory.absolute}';

    try {
      await storage
          .ref(user!.uid)
          .child('profilePic')
          .putFile(file)
          .then((p0) => print('done'));
    } on firebase_core.FirebaseException catch (e) {
      print(e.message!);
    }

    // firebase_storage.Reference ref = storage.ref(user!.uid);
    // firebase_storage.ListResult result = await ref.listAll();
    // await ref
    //     .listAll()
    //     .then((value) => print('result done___ result.items'));
    // result.items.forEach((firebase_storage.Reference ref) async {
    //   // print('Found file: $ref');
    //   await ref.getDownloadURL().then((value) async {print(await ref.getDownloadURL());});
    //   (await ref.getDownloadURL()).toString();
    // });
  }

  // Stream<void> streamPP() async* {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   firebase_storage.FirebaseStorage storage = FirebaseStorage.instance;
  //
  //   firebase_storage.Reference ref = storage.ref(user!.uid).child('profilePic');
  //   firebase_storage.ListResult result = await ref.listAll();
  //   await ref
  //       .listAll()
  //       .then((value) => print('result done___ ${result.items}'));
  //   result.items.forEach((firebase_storage.Reference ref) async* {
  //     print('Found file: $ref');
  //     await ref.getDownloadURL().then((value) async {print(await ref.getDownloadURL());});
  //     yield (await ref.getDownloadURL()).toString();
  //   });
  //
  //   // firebase_storage.FirebaseStorage storage = FirebaseStorage.instance;
  //   // firebase_storage.Reference ref = storage.ref(user!.uid).child('profilePic');
  //   // firebase_storage.ListResult result = await ref.listAll();
  //   // print('result ___ $result');
  //   // for (firebase_storage.Reference ref in result.items){
  //   //   print(ref.getDownloadURL());
  //   // }
  //   //
  //   // result.items.forEach((firebase_storage.Reference ref) async* {
  //   //   print('Found file: $ref');
  //   //   final url = (await ref.getDownloadURL()).toString();
  //   //   print(url);
  //   // });
  // }

  initialImage() async {
    networkImage = await FirebaseStorage.instance
        .ref(await FirebaseAuth.instance.currentUser!.uid)
        .child('profilePic')
        .getDownloadURL();
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      initialImage();
    });
  }

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
              child: Stack(
                children: [
                  Container(
                    height: h * 0.8,
                    width: w,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
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
                            text: 'Profile',
                            color: Colors.white,
                            size: 25,
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.17,
                        child: Center(
                          child: Stack(
                            children: [
                              widget._image == null
                                  ? StreamBuilder<String>(
                                      stream: FirebaseStorage.instance
                                          .ref(user!.uid)
                                          .child('profilePic')
                                          .getDownloadURL()
                                          .asStream(),
                                      builder: (context, snapshot) {
                                        // print(snapshot.data);
                                        // print(snapshot.connectionState);
                                        // print(snapshot.hasData);
                                        if (snapshot.data == null || snapshot.hasError) {
                                          Container(
                                            height: 130,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:AssetImage('assets/profile.png'),
                                                  // widget._image == null ||
                                                  //         networkImage == null
                                                  //     ? NetworkImage(networkImage!)
                                                  //     :
                                                  // FileImage(widget._image)
                                                  // as ImageProvider,
                                                  fit: BoxFit.cover),
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(100),
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
                                       else if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          final url = snapshot.data;

                                          return Container(
                                            height: 130,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage('$url'),
                                                  fit: BoxFit.cover),
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(100),
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

                                        else if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const CircularProgressIndicator();
                                        }
                                        return  Container(
                                            height: 130,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image:AssetImage('assets/profile.png'),
                                                  // widget._image == null ||
                                                  //         networkImage == null
                                                  //     ? NetworkImage(networkImage!)
                                                  //     :
                                                  // FileImage(widget._image)
                                                  // as ImageProvider,
                                                  fit: BoxFit.cover),
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(100),
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
                                        //           height: 130,
                                        //           width: 130,
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
                                      })
                                  : Container(
                                      height: 130,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                // widget._image == null ||
                                                //         networkImage == null
                                                //     ? NetworkImage(networkImage!)
                                                //     :
                                                FileImage(widget._image)
                                                    as ImageProvider,
                                            fit: BoxFit.cover),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                    ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () => picDialog(context),
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4336f8),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: w * 0.42,
                              width: w * 0.42,
                              decoration: BoxDecoration(
                                  color: Color(0xf9facfc4),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CommonText(
                                    text: 'Total courses',
                                    size: 20,
                                    weight: FontWeight.w600,
                                  ),
                                  CommonText(
                                    text: '75+',
                                    size: 40,
                                    weight: FontWeight.w600,
                                    color: Colors.orange[800],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: w * 0.42,
                              width: w * 0.42,
                              decoration: BoxDecoration(
                                  color: Color(0xf999d6dc),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const CommonText(
                                    text: 'Complete courses',
                                    size: 20,
                                    weight: FontWeight.w600,
                                  ),
                                  CommonText(
                                    text: '68',
                                    size: 40,
                                    weight: FontWeight.w600,
                                    color: Colors.green[800],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Address',
                            labelStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => print('Edit'),
                        child: Container(
                          height: h * 0.07,
                          width: w,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: CommonText(
                              text: 'Edit',
                              size: 20,
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
