import 'dart:async';

import 'package:confirmation_success/confirmation_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mivattendance/screens/responsive.dart';
import 'package:mivattendance/widgets/lottie_screen.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer(const Duration(milliseconds: 1500), () {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConfirmationSuccess(
              reactColor: Colors.yellow,
              bubbleColors: [Colors.pink],
              numofBubbles: Responsive.isTablet(context)?35:30,
              maxBubbleRadius: Responsive.isTablet(context)?8:6,
              child: const Text("Welcome to MIV!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
