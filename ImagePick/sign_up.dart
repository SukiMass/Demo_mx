import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const routeTech = '/SignupScreen';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formfield = GlobalKey<FormState>();
  final emailController1 = TextEditingController();
  final passController1 = TextEditingController();
  final conform_passController = TextEditingController();

  bool passToggle = true;

  bool confirm_passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(),
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
                Email_field1(),
                SizedBox(
                  height: 20,
                ),
                Password_field(),
                SizedBox(
                  height: 20,
                ),
                Conform_Password_field(),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      // Navigator.of(context).pushNamed(MyHomePage.routeName);
                      emailController1.clear();
                      passController1.clear();
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
                        'Sign Up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar MainBar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: Text(
        'MXA Login',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  Widget Email_field1() {
    return TextFormField(
        controller: emailController1,
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
        });
  }

  Widget Password_field() {
    return TextFormField(
      controller: passController1,
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
          child: Icon(passToggle ? Icons.visibility_off : Icons.visibility),
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
    );
  }

  Widget Conform_Password_field() {
    return TextFormField(
      controller: conform_passController,
      keyboardType: TextInputType.emailAddress,
      obscureText: passToggle,
      decoration: InputDecoration(
        labelText: 'Confirm Password', //password
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              confirm_passToggle = !confirm_passToggle;
            });
          },
          child: Icon(passToggle ? Icons.visibility_off : Icons.visibility),
        ),
      ),
      validator: (value) {
        bool passValid = RegExp(
                r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$")
            .hasMatch(value!);
        if (passController1!=conform_passController) {
          return 'Enter Confirm Password';
        } else if (!passValid) {
          return 'Enter Valid Confirm Password';
        }
      },
    );
  }
}
  