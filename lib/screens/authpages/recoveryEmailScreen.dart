import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:warrentyopine/APIS/api.dart';
import 'package:warrentyopine/Utils/Toast.dart';
import 'package:warrentyopine/screens/authpages/LoginScreen.dart';
import 'package:warrentyopine/screens/authpages/OtpScreen.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _loginState();
}

class _loginState extends State<ForgetPage> {
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void recovery() async {
    isLoading = true;
    setState(() {});
    var body = {
      'email': emailController.text,
    };
    Response response = await post(
      Uri.parse(ApiData.forgetPass),
      body: body,
      headers: ApiData.getHeaders(),
    );
    isLoading = false;
    setState(() {});
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      bool status = responseBody["status"];
      String message = responseBody["message"];

      if (status) {
        Toast.show(message, context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OtpScreen(emailController.toString(),true)));
      } else {}
    }
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  bool obscureText = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                'Forget Password',
                style: GoogleFonts.sourceSerif4(
                    fontSize: 41, color: Color.fromARGB(255, 57, 57, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 17),
              child: Text(
                'Enter your email address and we will share a link to create a new password',
                style: GoogleFonts.publicSans(
                    fontSize: 14, color: Color.fromARGB(255, 179, 175, 175)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 90),
              child: Text('Email',
                  style: GoogleFonts.publicSans(
                      fontSize: 14, color: Color.fromARGB(255, 179, 175, 175))),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    //   _email = value!;
                    // },
                    decoration: InputDecoration(),
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
            //           fontSize: 14, color: Color.fromARGB(255, 179, 175, 175))),
            // ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: 22, right: 22),
            //       child: TextField(
            //         obscureText: _obscureText,
            //         decoration: InputDecoration(
            //             suffixIcon: GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               _obscureText = !_obscureText;
            //             });
            //           },
            //           child: Icon(
            //               _obscureText ? Icons.visibility : Icons.visibility_off),
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
                padding: const EdgeInsets.only(top: 60),
                child: isLoading
                    ? Center(
                        child: const CircularProgressIndicator(),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(38)),
                        child: GestureDetector(
                          onTap: () {
                            recovery();

                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => OTP()));
                          },
                          child: Container(
                            color: Color.fromRGBO(69, 55, 160, 1),
                            width: 225,
                            height: 60,
                            child: Center(
                                child: Text(
                              "Send",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                          ),
                        ),
                      ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 140, top: 6),
            //   child: TextButton(
            //       onPressed: () {},
            //       child: Text(
            //         'forget Password',
            //         style: TextStyle(
            //             color: const Color.fromARGB(255, 0, 0, 1), fontSize: 14),
            //       )),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 95, top: 105),
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
                        'Login',
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
    );
  }
}
