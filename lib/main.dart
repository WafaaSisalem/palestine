import 'package:flutter/material.dart';

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
      home: LoginPage(),
    );
  }
}
