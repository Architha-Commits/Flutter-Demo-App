import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:master_go_replication/auth/auth_methods.dart';
import 'package:master_go_replication/auth/signin_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
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
            'Forgot Password',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: HexColor('#525464')),
          ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if (key.currentState!.validate()) {
                          AuthMethods()
                              .forgotPassword(emailController.text)
                              .then((value) {
                            Fluttertoast.showToast(
                                msg: "Reset password link sent successfully");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SigninScreen()),
                                (route) => false);
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: HexColor('#20C3AF'),
                        height: 50,
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
