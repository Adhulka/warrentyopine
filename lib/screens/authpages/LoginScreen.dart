import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warrentyopine/APIS/api.dart';
import 'package:warrentyopine/Utils/Data_model.dart';
import 'package:warrentyopine/Utils/HiveDb.dart';
import 'package:warrentyopine/Utils/Toast.dart';

import 'package:warrentyopine/screens/authpages/CreateAccountScreen.dart';
import 'package:warrentyopine/screens/authpages/recoveryEmailScreen.dart';
import 'package:http/http.dart';


import 'package:warrentyopine/screens/dashboard/HomePageScreen.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool isLoading = false;
  UserModel userData = UserModel();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (kDebugMode) {
      emailController.text = "service@gmail.com";
      passwordController.text = "Service@123";
    }
  }

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
                  'Welcome Back',
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
                padding: const EdgeInsets.only(left: 22, top: 35),
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
                      controller: emailController,
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
                child: Text('Password',
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
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
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
                    ),
                  ),
                ],
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 35),
                  child: isLoading?Center(child: const CircularProgressIndicator()):ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(38)),
                    child: GestureDetector(
                      onTap: () {
                        if (emailController.text.isEmpty) {
                          Toast.show("Enter valid Email", context);
                        } else if (passwordController.text.isEmpty) {
                          Toast.show("Enter valid Password", context);
                        } else {
                          login(emailController.text.toString(),
                              passwordController.text.toString());
                        }

                      },
                      child: Container(
                        color: Color.fromRGBO(69, 55, 160, 1),
                        width: 225,
                        height: 60,
                        child: Center(
                            child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only( top: 6),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPage()));
                      },
                      child: Text(
                        'forgot Password',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 1),
                            fontSize: 14),
                      )),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only( top: 65),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(String email, password) async {
    isLoading=true;
    setState(() {

    });
    var body = {'email': email, 'password': password};
    Response response = await post(Uri.parse(ApiData.login), body: body);
    isLoading=false;
    setState(() {

    });
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      bool status = responseBody["status"];
      String message = responseBody["message"];
      Toast.show(message, context);

      if (status) {
        String token = responseBody["token"];
        var userDetails = responseBody["details"]["profile"];
        userData = UserModel.fromJson(userDetails);
        HiveDb.setUserModel(userData);
        HiveDb.setToken(token);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    } else {}
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
