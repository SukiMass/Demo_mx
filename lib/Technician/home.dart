import 'package:flutter/material.dart';
import 'package:image_app/Technician/service.dart';
import 'package:image_app/login_screen.dart';
import 'package:image_app/main.dart';

class HomeTech extends StatefulWidget {
  const HomeTech({super.key});
  static const routeTech = '/HomeTech';

  @override
  State<HomeTech> createState() => _HomeTechState();
}

class _HomeTechState extends State<HomeTech> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
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
      // padding: EdgeInsets.all(0),
      children: [
        Container(
          color: Colors.indigo,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 30, 10, 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage('images/technician.png'),
                      radius: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Technician',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mike-SERV-194',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        ListTile(
          title: Text('Profile',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          leading: Icon(Icons.info_rounded),
          title: Text('Vendor id'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.account_box_rounded),
          title: Text('Profession'),
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
          leading: Icon(Icons.miscellaneous_services_rounded),
          title: Text('Service'),
          onTap: () {
            Navigator.of(context).pushNamed(MyList.routeTech);
          },
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text('Service History'),
          onTap: () {},
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
