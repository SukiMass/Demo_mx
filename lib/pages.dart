import 'package:flutter/material.dart';
import 'package:image_app/Static_Page/static_chat.dart';
import 'package:image_app/chat_main.dart';
import 'package:image_app/maintenance.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});
  static const routeName = '/HomeScreen';
  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.indigo,
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Text('Welcome to MXA Home Page'),
        ),
        drawer: Navbar(context),
      ),
    );
  }
}

Widget Navbar(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.all(0),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.indigo,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
              child: Column(
                children: [
                  CircleAvatar(
                    foregroundImage: AssetImage('images/circular_avatar.png'),
                    radius: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'House Owner',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ownermail@gmail.com',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
        ListTile(
          title: Text('Profile',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home Id'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.streetview),
          title: Text('Address'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notification'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          title: Text(
            'Maintenance',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home_repair_service),
          title: Text('Service Request'),
          onTap: () {
            Navigator.of(context).pushNamed(MyApp.routeChat);
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('History'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(ChatScreens.routeStatic);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Sign Out'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
