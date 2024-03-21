import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:warrentyopine/screens/authpages/CreateAccountScreen.dart';

class Passchange extends StatefulWidget {

  const Passchange({super.key});

  @override
  State<Passchange> createState() => _loginState();
}

class _loginState extends State<Passchange> {
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
                    'Password Changed Successfully',
                    style: GoogleFonts.sourceSerif4(
                        fontSize: 21, color: Color.fromARGB(255, 57, 57, 1)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 70, top: 27),
                  child: SizedBox(
                    height: 300,
                    width: 250,
                    child: Image.asset(
                      'assets/welpic.png',
                      width: 260,
                      height: 269,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 70),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(38)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CreateAccount()));
                      },
                      child: Container(
                        color: Color.fromRGBO(69, 55, 160, 1),
                        width: 350,
                        height: 55,
                        child: Center(
                            child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 174, top: 16),
                //   child: Text(
                //     'Resend',
                //     style: TextStyle(
                //         color: const Color.fromARGB(255, 0, 0, 1), fontSize: 14),
                //   ),
                // ),
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
                // Padding(
                //   padding: const EdgeInsets.only(left: 95, top: 70),
                //   child: Row(
                //     children: [
                //       Text(
                //         "Don't have an Account?",
                //         style: TextStyle(
                //             fontSize: 14, color: Color.fromARGB(255, 179, 175, 175)),
                //       ),
                //   TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Login',
                //         style: TextStyle(
                //             fontSize: 14,
                //             color: const Color.fromRGBO(69, 55, 160, 1)),
                //       ))
                // ],
              ]),
        ));
  }
}
