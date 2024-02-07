import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_app/ImagePick/image_view.dart';
import 'package:image_app/maintenance.dart';
import 'package:image_app/pages.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'MXA Login',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.asset(
                    'images/mxa-logo.png',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email', //Email id
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return 'Enter Email';
                      } else if (!emailValid) {
                        return 'Enter Valid Email';
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: 'Password', //password
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                  validator: (value) {
                    bool passValid = RegExp(
                            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return 'Enter Password';
                    } else if (!passValid) {
                      return 'Enter Valid Password';
                    }
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyHomePage()));
                      emailController.clear();
                      passController.clear();
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
