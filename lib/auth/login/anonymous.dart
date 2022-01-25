import 'package:era_elearn/screens/mainScreen.dart';
import 'package:era_elearn/widgets/progressDialog.dart';
import 'package:era_elearn/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> anonymous(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) =>
        const ProgressDialog(message: '  Authenticating. Please wait...'),
  );
  final User? user =
      (await FirebaseAuth.instance.signInAnonymously().catchError((e) {
    Navigator.of(context).pop();
    displayToast('Error:' + e.toString());
  }))
          .user;

  if (user != null) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(MainScreen.idScreen, (route) => false);

    displayToast("Congratulations! your are logged in now. 😊😊😊");
  } else {
    Navigator.of(context).pop();
    displayToast('Error occurred: couldn\'t signIn 😟');
  }
}

// Stream<String> streamPP() async* {
//   String url;
//
//   try {
//     User? user = FirebaseAuth.instance.currentUser;
//     firebase_storage.FirebaseStorage storage = FirebaseStorage.instance;
//
//     firebase_storage.Reference ref = storage.ref(user!.uid).child('profilePic');
//     await ref.getDownloadURL();
//     await ref.getDownloadURL().then((value) async {
//         print(await ref.getDownloadURL());
//       });
//
//     // firebase_storage.ListResult result = await ref.listAll();
//     // await ref
//     //     .listAll()
//     //     .then((value) => print('result done___ ${result.items}'));
//     // result.items.forEach((firebase_storage.Reference ref) async* {
//     // print('Found file: $ref');
//     // await ref.getDownloadURL().then((value) async {
//     //   print(await ref.getDownloadURL());
//     // });
//     // url = await ref.getDownloadURL();
//     // (await ref.getDownloadURL()).toString();
//     // });
//
//   } catch (e) {
//     print(e);
//   }
//
//   // firebasae_storage.FirebaseStorage storage = FirebaseStorage.instance;
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
