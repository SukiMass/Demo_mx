import 'package:flutter/material.dart';
import 'package:image_app/Technician/home.dart';
import 'package:image_app/Technician/service.dart';
import 'package:image_app/maintenance.dart';
import 'package:image_app/pages.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const routeName = '/MainScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        MyApp.routeName: (_) => MyApp(),
        LoginScreen.routeName: (_) => LoginScreen(),
        MyHomePage.routeName: (_) => MyHomePage(),
        Pages.routeName: (_) => Pages(),
        MyList.routeTech: (_) => MyList(actualList: actualList),
        HomeTech.routeTech: (_) => HomeTech(),
      },
      //  initialRoute: MyApp.routeName,
      home: LoginScreen(),
    );
  }
}
