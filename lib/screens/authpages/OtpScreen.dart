import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:http/http.dart';
import 'package:pinput/pinput.dart';
import 'package:warrentyopine/APIS/api.dart';
import 'package:warrentyopine/Utils/Toast.dart';
import 'package:warrentyopine/screens/authpages/PasswordSetScreen.dart';
import 'package:warrentyopine/screens/authpages/LoginScreen.dart';

class OtpScreen extends StatefulWidget {

  bool isPasswordReset=false;
  String email;
  OtpScreen(this.email, this.isPasswordReset);

  @override
  State<OtpScreen> createState() => _loginState();
}

class _loginState extends State<OtpScreen> {
  final TextEditingController pinController = TextEditingController();


  void sendOtp(String email,otp) async {
    isLoading=true;
    setState(() {

    });
    // try {

      var body={
         'email':email,
        'otp':otp,


      };
      Response response = await post(Uri.parse(ApiData.checkOtp), body:body);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        isLoading=false;
        setState(() {

        });

        bool status=responseBody["status"];
        String message=responseBody["message"];
        String user_id=responseBody["uid"].toString();
        Toast.show(message,context);
        if(status){

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PasswordSetScreen(widget.isPasswordReset,user_id)));
        }else{

        }


      } else {

      }
    // } catch (e) {
    //   print(e.toString());
    // }
  }
bool isLoading=false;
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
                'OTP',
                style: GoogleFonts.sourceSerif4(
                    fontSize: 41, color: Color.fromARGB(255, 57, 57, 1)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 22, top: 17),
              child: Text(
                'Enter your 4 digit otp here',
                style: GoogleFonts.publicSans(
                    fontSize: 14, color: Color.fromARGB(255, 179, 175, 175)),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(top: 70),
            //   child: OtpTextField(
            //     onCodeChanged: (value) {
            //       setState(() {
            //         otpValue = value;
            //       });
            //     },
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     textStyle: TextStyle(fontSize: 41),
            //     keyboardType: TextInputType.number,
            //     inputFormatters: [],
            //   ),
            // ),
            Padding(
              padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Center(
                child: Pinput(
                  controller: pinController,
                  androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(234, 239, 243, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ).copyDecorationWith(
                    border: Border.all(
                        color: const Color.fromRGBO(114, 178, 238, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(234, 239, 243, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ).copyDecorationWith(
                    border: Border.all(
                        color: const Color.fromRGBO(114, 178, 238, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  submittedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(234, 239, 243, 1)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ).copyDecorationWith(
                      color: const Color.fromRGBO(234, 239, 243, 1)),
                  validator: (s) {
                    if (s?.length == 4) {}
                    // return s == '2222'
                    //     ? null
                    //     : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  length: 4,
                  onCompleted: (pin) => print(pin),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only( top: 90),
                child:isLoading?Center(child: const CircularProgressIndicator(),): ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(38)),
                  child: InkWell(
                    onTap: () {

                     sendOtp(widget.email,pinController.text);
                    },
                    child: Container(
                      color: Color.fromRGBO(69, 55, 160, 1),
                      width: 225,
                      height: 60,
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only( top: 16),
                child: InkWell(
                  onTap: (){

                  },
                  child: Text(
                    'Resend',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 1), fontSize: 14),
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
              padding: const EdgeInsets.only(left: 95, top: 70),
              child: Row(
                children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 179, 175, 175)),
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
