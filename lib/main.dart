import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_app/Technician/home.dart';
import 'package:image_app/Technician/service.dart';
import 'package:image_app/chat_main.dart';
import 'package:image_app/maintenance.dart';
import 'package:image_app/pages.dart';
import 'login_screen.dart';

void main() {
  const SystemUiOverlayStyle(statusBarColor: Colors.indigo);
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  static const routeName = '/MainScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.indigo,
      // ),
      routes: {
        Main.routeName: (_) => const Main(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        MyHomePage.routeName: (_) => const MyHomePage(),
        Pages.routeName: (_) => const Pages(),
        MyList.routeTech: (_) => MyList(actualList: actualList),
        HomeTech.routeTech: (_) => const HomeTech(),
        MyApp.routeChat: (_) => const MyApp(),
      },
      //  initialRoute: Main.routeName,
      home: const MyApp(),
    );
  }
}
