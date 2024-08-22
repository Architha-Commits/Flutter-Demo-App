import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/auth/auth_methods.dart';
import 'package:master_go_replication/auth/signin_screen.dart';
import 'package:master_go_replication/crud/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPassHidden1 = true;
  GlobalKey<FormState> customKey = GlobalKey<FormState>();
  bool isPassHidden2 = true;
  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Sign Up',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: HexColor('#525464')),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.menu,
                color: HexColor('#525464'),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                key: customKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/signup.png',
                      height: 145,
                      width: 110,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("Please enter your email");
                          }
                          // reg expression for email validation
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return ("Please enter a valid email");
                          }
                          return null;
                        },
                        controller: emailController,
                        cursorColor: HexColor('#F7F7F7'),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            fillColor: HexColor('#F7F7F7'),
                            filled: true,
                            hintText: 'Enter email',
                            hintStyle: TextStyle(
                              color: HexColor('#B0B0C3'),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(15))),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{3,}$');
                          if (value!.isEmpty) {
                            return ("Username is required");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Username(Min. 3 Character)");
                          }
                          return null;
                        },
                        controller: userNameController,
                        cursorColor: HexColor('#F7F7F7'),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            fillColor: HexColor('#F7F7F7'),
                            filled: true,
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: HexColor('#B0B0C3'),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(15))),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return ("Password is required");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password(Min. 6 Character)");
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: isPassHidden1,
                        cursorColor: HexColor('#F7F7F7'),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            fillColor: HexColor('#F7F7F7'),
                            filled: true,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassHidden1 = !isPassHidden1;
                                  });
                                },
                                icon: isPassHidden1
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: HexColor('#B0B0C3'),
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: HexColor('#B0B0C3'),
                                      )),
                            hintText: 'Enter password',
                            hintStyle: TextStyle(
                              color: HexColor('#B0B0C3'),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(15))),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != confirmPasswordController.text) {
                            return ("Passwords do not match");
                          }
                          return null;
                        },
                        controller: confirmPasswordController,
                        obscureText: isPassHidden2,
                        cursorColor: HexColor('#F7F7F7'),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            fillColor: HexColor('#F7F7F7'),
                            filled: true,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassHidden2 = !isPassHidden2;
                                  });
                                },
                                icon: isPassHidden2
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: HexColor('#B0B0C3'),
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: HexColor('#B0B0C3'),
                                      )),
                            hintText: 'Confirm password',
                            hintStyle: TextStyle(
                              color: HexColor('#B0B0C3'),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(15))),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        if (customKey.currentState!.validate()) {
                          AuthMethods()
                              .signUpUser(
                                  emailController.text,
                                  userNameController.text,
                                  passwordController.text)
                              .then((value) {
                            Fluttertoast.showToast(msg: "Signup Successful");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                                (route) => false);
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: HexColor('#20C3AF'),
                        height: 50,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'or',
                      style: TextStyle(color: HexColor('#838391')),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(color: HexColor('#838391')),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SigninScreen()));
                          },
                          child: Text('Signin',
                              style: TextStyle(
                                  color: HexColor('#FFB19D'),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: HexColor('#FFB19D'),
                                  decorationThickness: 3,
                                  decorationStyle: TextDecorationStyle.solid)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
