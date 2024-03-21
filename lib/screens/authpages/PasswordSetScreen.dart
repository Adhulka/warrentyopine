import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:warrentyopine/APIS/api.dart';
import 'package:warrentyopine/Utils/Toast.dart';
import 'package:warrentyopine/screens/authpages/CreateAccountScreen.dart';
import 'package:warrentyopine/screens/authpages/LoginScreen.dart';

import 'package:warrentyopine/screens/authpages/passchangeSuccessScreen.dart';


class PasswordSetScreen extends StatefulWidget {
  PasswordSetScreen(this.isPasswordReset,this.userid);
  bool isPasswordReset=false;
  String userid='uid';




  @override
  State<PasswordSetScreen> createState() => _loginState();
}

class _loginState extends State<PasswordSetScreen> {

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void secondConfirmation() async {
    // try {
    isLoading = true;

    if(widget.isPasswordReset){
      var body = {
        'password': password,
        'confirmPassword': confirmPassword,
        'userid': widget.userid
      };
      Response response = await post(Uri.parse(ApiData.saveRestPass),
          body: body, headers: ApiData.getHeaders());
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        isLoading = false;
        setState(() {});

        bool status = responseBody["status"];
        String message = responseBody["message"];
        String userid=responseBody["uid"];
        Toast.show(message, context);
        if (status) {

          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>Passchange()));
        } else {}
      } else {
        print('falied');
      }
    }else {
      setState(() {});
      var body = {
        'password': password,
        'confirmPassword': confirmPassword,
        'userid': widget.userid
      };
      Response response = await post(Uri.parse(ApiData.savePassword),
          body: body, headers: ApiData.getHeaders());
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        isLoading = false;
        setState(() {});

        bool status = responseBody["status"];
        String message = responseBody["message"];
        String userid=responseBody["uid"];
        Toast.show(message, context);
        if (status) {

          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  Login()));
        } else {}
      } else {
        print('falied');
      }
    }
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  bool isLoading = false;
  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                padding: const EdgeInsets.only(left: 22, top: 35),
                child: Text('Password',
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
                      controller: password,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                        onTap: () {
                          formKey.currentState!.validate();
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(
                            255,
                            0,
                            0,
                            1,
                          ),
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 25),
                child: Text('Confirm Password',
                    style: GoogleFonts.publicSans(
                        fontSize: 14,
                        color: Color.fromARGB(255, 179, 175, 175))),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 22, right: 22),
                    child: TextFormField(
                      controller: confirmPassword,
                      obscureText: _obscureText2,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText2 = !_obscureText2;
                          });
                        },
                        child: Icon(_obscureText2
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(
                            255,
                            0,
                            0,
                            1,
                          ),
                          fontWeight: FontWeight.w400),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        } else if (value != confirmPassword.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only( top: 35),
                  child: isLoading
                      ? Center(
                          child: const CircularProgressIndicator(),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(38)),
                          child: GestureDetector(
                            onTap: () {
                              if (password.text == confirmPassword.text) {
                                (password.text, confirmPassword.text);
                              } else {
                                print("unsuccessfuly");
                              }
                              secondConfirmation();
                            },
                            child: Container(
                              color: Color.fromRGBO(69, 55, 160, 1),
                              width: 225,
                              height: 60,
                              child: Center(
                                  child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 95),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()));
                        },
                        child: Text(
                          'Sign up',
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
}
