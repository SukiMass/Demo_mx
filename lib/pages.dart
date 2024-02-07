import 'package:flutter/material.dart';
import 'package:image_app/maintenance.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Widget build(BuildContext context) {
    return MaterialApp(
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
        UserAccountsDrawerHeader(
          accountName: Text('House Owner'),
          accountEmail: Text('Ownermail@gmail.com'),
          currentAccountPicture: CircleAvatar(
            foregroundImage: AssetImage('images/circular_avatar.png'),
            radius: 70,
          ),
          decoration: BoxDecoration(
              color: Colors.indigo, borderRadius: BorderRadius.circular(5)),
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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyHomePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('History'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Sign Out'),
          onTap: () {},
        ),
      ],
    ),
  );
}
