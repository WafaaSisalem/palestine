import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palestine/colorhelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      //Go to another screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHelper.green0D,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/images/splash4.png',
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Text(
                      'European Palestinians Conference',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'مؤتمر فلسطيني أوروبي',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 31,
                    ),
                    SvgPicture.asset(
                      'assets/images/hands.svg',
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
