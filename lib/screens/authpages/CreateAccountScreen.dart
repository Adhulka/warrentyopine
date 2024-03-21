import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:warrentyopine/APIS/api.dart';
import 'package:warrentyopine/Utils/HiveKeys.dart';
import 'package:warrentyopine/Utils/Toast.dart';
import 'package:warrentyopine/screens/authpages/CompleteProfileScreen.dart';
import 'package:warrentyopine/screens/authpages/LoginScreen.dart';


import 'package:warrentyopine/screens/authpages/OtpScreen.dart';



class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _loginState();
}

class _loginState extends State<CreateAccount> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();



  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 22),
                child: SizedBox(
                  height: 31,
                  width: 74.5,
                  child: Image.asset(
                    'assets/image 3.png',
                    width: 74.5,
                    height: 31,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 122, left: 22),
                child: Text(
                  'Create Account',
                  style: GoogleFonts.sourceSerif4(
                      fontSize: 41, color: Color.fromARGB(255, 57, 57, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 17),
                child: Text(
                  'Login to continue',
                  style: GoogleFonts.publicSans(
                      fontSize: 14, color: Color.fromARGB(255, 179, 175, 175)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 30),
                child: Text('Name',
                    style: GoogleFonts.publicSans(
                        fontSize: 14,
                        color: Color.fromARGB(255, 179, 175, 175))),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: TextFormField(
                      controller: name,
                      // decoration: InputDecoration(
                      //     suffixIcon: Icon(
                      //   Icons.check,
                      //   color: Colors.green,
                      // )),
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 1),
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 25),
                child: Text('Email',
                    style: GoogleFonts.publicSans(
                        fontSize: 14,
                        color: Color.fromARGB(255, 179, 175, 175))),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: TextFormField(
                      controller: email,
                      // decoration: InputDecoration(
                      //     suffixIcon: Icon(
                      //   Icons.check,
                      //   color: Colors.green,
                      // )),
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 1),
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 22, top: 25),
              //   child: Text('Password',
              //       style: GoogleFonts.publicSans(
              //           fontSize: 14,
              //           color: Color.fromARGB(255, 179, 175, 175))),
              // ),
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(left: 22, right: 22),
              //       child: TextFormField(
              //         controller: password,
              //         obscureText: _obscureText,
              //         decoration: InputDecoration(
              //             suffixIcon: GestureDetector(
              //           onTap: () {
              //             setState(() {
              //               _obscureText = !_obscureText;
              //             });
              //           },
              //           child: Icon(_obscureText
              //               ? Icons.visibility_off
              //               : Icons.visibility),
              //         )),
              //         style: TextStyle(
              //             fontSize: 14,
              //             color: Color.fromARGB(
              //               255,
              //               0,
              //               0,
              //               1,
              //             ),
              //             fontWeight: FontWeight.w400),
              //       ),
              //     ),
              //   ],
              // ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: isLoading
                      ? Center(
                          child: const CircularProgressIndicator(),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(38)),
                          child: GestureDetector(
                            onTap: () {
                              if (name.text.isEmpty) {
                                Toast.show("Enter valid Name", context);
                              } else if (email.text.isEmpty) {
                                Toast.show("Enter valid Email", context);
                              }
                              // else if (password.text.isEmpty) {
                              //   Toast.show("Enter valid Password", context);
                              // }
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) =>CompleteProfileScreen()));
                              createAccountSign(
                                  name.text, email.text,"" );
                            },
                            child: Container(
                              color: Color.fromRGBO(69, 55, 160, 1),
                              width: 225,
                              height: 60,
                              child: Center(
                                  child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 60),
                child: Row(
                  children: [
                    Text(
                      "Don't have an Account?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 179, 175, 175)),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromRGBO(69, 55, 160, 1)),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createAccountSign(String name, email, password) async {
    isLoading = true;
    setState(() {});
    {
      var body = {'name': name, 'email': email, };
      Response response =
          await post(Uri.parse(ApiData.serviceCenterSignup), body: body);

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        isLoading = false;
        setState(() {});

        bool status = responseBody["status"];
        String message = responseBody["message"];
        Toast.show(message, context);

        if (status) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>OtpScreen(email,false)));
        }
      }
    }
  }
}
