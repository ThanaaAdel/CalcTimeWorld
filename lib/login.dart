// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worldtime/Register.dart';
import 'package:worldtime/home.dart';
import 'package:worldtime/loading.dart';
import 'package:worldtime/shared/contants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisable = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    // final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Log in"),
      ),
      body: Center(
        child: Padding(
          padding: widthScreen > 600
              ? EdgeInsets.symmetric(horizontal: widthScreen * .3)
              : const EdgeInsets.all(33.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Log in",
                  style: TextStyle(fontSize: 33, fontFamily: "myfont"),
                ),
                const SizedBox(
                  height: 35,
                ),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  width: 288,
                ),
                const SizedBox(
                  height: 35,
                ),
                TextFormField(
                    validator: (email) {
                      return email!.contains(RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                          ? null
                          : "Enter a valid email";
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    decoration: decorationTextfield.copyWith(
                        hintText: "Enter Your Email : ",
                        suffixIcon: Icon(Icons.email))),
                const SizedBox(
                  height: 33,
                ),
                TextFormField(
                    validator: (value) {
                      return value!.length < 8
                          ? "Enter at least 8 characters"
                          : null;
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: isVisable ? false : true,
                    decoration: decorationTextfield.copyWith(
                        hintText: "Enter Your Password : ",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisable = !isVisable;
                              });
                            },
                            icon: isVisable
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)))),
                const SizedBox(
                  height: 33,
                ),
                ElevatedButton(
                  onPressed: () async {

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Loading()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.purple),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "Log in",
                          style: TextStyle(fontSize: 19),
                        ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an accout? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/Register");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 299,
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.6,
                        color: Colors.purple[900],
                      )),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.purple[900],
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.6,
                        color: Colors.purple[900],
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.purple, width: 1)),
                          child: SvgPicture.asset(
                            "assets/icons/facebook.svg",
                            color: Colors.purple[400],
                            height: 27,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.purple, width: 1)),
                          child: SvgPicture.asset(
                            "assets/icons/google-plus.svg",
                            color: Colors.purple[400],
                            height: 27,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.purple, width: 1)),
                          child: SvgPicture.asset(
                            "assets/icons/twitter.svg",
                            color: Colors.purple[400],
                            height: 27,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   left: 0,
          //   child: Image.asset(
          //     "assets/images/main_top.png",
          //     width: 111,
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset(
          //     "assets/images/login_bottom.png",
          //     width: 111,
          //   ),
          // ),
        ),
      ),
    );
  }
}
