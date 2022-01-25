import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.purple[400],
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircularProgressIndicator(
              color: Colors.green,
            ),
            Text(
              message,
              style: TextStyle(color: Colors.red, fontSize: 15,fontFamily: 'Brand Bold'),
            ),
          ],
        ),
      ),
    );
  }
}
