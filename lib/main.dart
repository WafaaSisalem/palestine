import 'package:flutter/material.dart';
import 'package:palestine/bottom_nav.dart';
import 'package:palestine/calendar.dart';
import 'package:palestine/event_card_widget.dart';
import 'package:palestine/notification_page.dart';
import 'package:palestine/splash_screen.dart';
import 'package:palestine/square_event_card.dart';

import 'bottom_sheet_email.dart';
import 'calendartable.dart';
import 'email_login_page.dart';

void main() {
  //  WidgetsFlutterBinding.ensureInitialized();
  // ScreenUtil.init(

  //   designSize: Size(360, 640),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomSheetEmail());
  }
}
