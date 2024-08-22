import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/auth/auth_methods.dart';
import 'package:master_go_replication/auth/forgot_password.dart';
import 'package:master_go_replication/auth/signup_screen.dart';
import 'package:master_go_replication/crud/home_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassHidden = true;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: HexColor('#525464'),
            ),
          ),
          title: Text(
            'Sign In',
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
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/signin.png',
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
                            hintText: 'Email',
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
                        controller: passwordController,
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
                        obscureText: isPassHidden,
                        cursorColor: HexColor('#F7F7F7'),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                            fillColor: HexColor('#F7F7F7'),
                            filled: true,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassHidden = !isPassHidden;
                                  });
                                },
                                icon: isPassHidden
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: HexColor('#B0B0C3'),
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: HexColor('#B0B0C3'),
                                      )),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              color: HexColor('#B0B0C3'),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(15))),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword())),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Forgot your Password?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HexColor('#838391')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          AuthMethods()
                              .signInUser(
                                  emailController.text, passwordController.text)
                              .then((value) {
                            Fluttertoast.showToast(msg: "Login Successful");
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
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'or',
                      style: TextStyle(color: HexColor('#838391')),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: HexColor('#838391')),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                          child: Text('Signup',
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
