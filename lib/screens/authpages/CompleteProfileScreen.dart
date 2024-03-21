import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:pinput/pinput.dart';
import 'package:warrentyopine/APIS/api.dart';
import 'package:warrentyopine/Utils/Data_model.dart';
import 'package:warrentyopine/Utils/HiveDb.dart';
import 'package:warrentyopine/Utils/Toast.dart';
import 'package:warrentyopine/screens/authpages/LoginScreen.dart';
import 'package:warrentyopine/screens/authpages/passchangeSuccessScreen.dart';
import 'package:warrentyopine/screens/dashboard/HomePageScreen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreen();
}

class _CompleteProfileScreen extends State<CompleteProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController serviceIdController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController secondaryMobileController =
      TextEditingController();
  final TextEditingController gstController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  bool isVisibleSecondPh = false;
  bool isLoding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/backgroundpic.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      'Complete your profile',
                      style: GoogleFonts.sourceSerif4(
                          fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160, top: 19),
                  child: SizedBox(
                    height: 87,
                    width: 87,
                    child: Image.asset(
                      'assets/circlepic.png',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 15),
                  child: Text(
                    'Name',
                    style: GoogleFonts.publicSans(fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: _mediaQuery.size.width * 0.91,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 7),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: 'Enter your Name',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 142, 141, 141),
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.381)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 15),
                  child: Text(
                    'Service ID',
                    style: GoogleFonts.publicSans(fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: _mediaQuery.size.width * 0.97,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 7),
                    child: TextField(
                      controller: serviceIdController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: 'Enter your Service ID',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 141, 141),
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 0.381)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 15),
                  child: Text(
                    'Address',
                    style: GoogleFonts.publicSans(fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: _mediaQuery.size.width * 0.97,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 7),
                    child: TextField(
                      maxLines: 2,
                      controller: addressController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: 'Enter your Address',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 141, 141),
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 0.381)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 15),
                  child: Text(
                    'Contact',
                    style: GoogleFonts.publicSans(fontSize: 15),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _mediaQuery.size.width * 0.84,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 22, right: 22, top: 7),
                        child: TextField(
                          controller: mobileController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintText: 'Enter your Contact Number',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 142, 141, 141),
                              ),
                              filled: true,
                              fillColor: Color.fromRGBO(255, 255, 255, 0.381)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1, top: 3),
                      child: GestureDetector(
                        onTap: () {
                          isVisibleSecondPh = !isVisibleSecondPh;

                          setState(() {});
                        },
                        child: Icon(
                          isVisibleSecondPh
                              ? Icons.remove
                              : Icons.add_circle_sharp,
                          color: const Color.fromRGBO(69, 55, 160, 1),
                        ),
                      ),
                    )
                  ],
                ),
                if (isVisibleSecondPh)
                  SizedBox(
                    width: _mediaQuery.size.width * 0.97,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 22, right: 70, top: 7),
                      child: TextField(
                        controller: secondaryMobileController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: 'Enter your secondary contact Number',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 142, 141, 141),
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.381)),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 15),
                  child: Text(
                    'Gst',
                    style: GoogleFonts.publicSans(fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: _mediaQuery.size.width * 0.97,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 7),
                    child: TextField(
                      controller: gstController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: 'Enter your Gst No',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 141, 141),
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 0.381)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 15),
                  child: Text(
                    'Pan',
                    style: GoogleFonts.publicSans(fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: _mediaQuery.size.width * 0.97,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 7),
                    child: TextField(
                      controller: panController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: 'Enter your PAN No',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 141, 141),
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 0.381)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22, top: 1),
                  child: Text(
                    'Pin(4 digit code)',
                    style: GoogleFonts.publicSans(fontSize: 13),
                  ),
                ),
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
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     SizedBox(
                  //       width: _mediaQuery.size.width * 0.160,
                  //       child: TextField(
                  //         controller: pinController,
                  //         onChanged: (value) {
                  //           if (value.length == 1) {
                  //             FocusScope.of(context).nextFocus();
                  //           }
                  //         },
                  //         decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: Color.fromRGBO(
                  //                 215, 211, 211, 0.13333333333333333)),
                  //         style: Theme.of(context).textTheme.headlineSmall,
                  //         textAlign: TextAlign.center,
                  //         keyboardType: TextInputType.number,
                  //         inputFormatters: [
                  //           LengthLimitingTextInputFormatter(1),
                  //           FilteringTextInputFormatter.digitsOnly
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: _mediaQuery.size.width * 0.160,
                  //       child: TextField(
                  //         onChanged: (value) {
                  //           if (value.length == 1) {
                  //             FocusScope.of(context).nextFocus();
                  //           }
                  //         },
                  //         decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: Color.fromRGBO(
                  //                 215, 211, 211, 0.13333333333333333)),
                  //         style: Theme.of(context).textTheme.headlineSmall,
                  //         textAlign: TextAlign.center,
                  //         keyboardType: TextInputType.number,
                  //         inputFormatters: [
                  //           LengthLimitingTextInputFormatter(1),
                  //           FilteringTextInputFormatter.digitsOnly
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: _mediaQuery.size.width * 0.160,
                  //       child: TextField(
                  //         onChanged: (value) {
                  //           if (value.length == 1) {
                  //             FocusScope.of(context).nextFocus();
                  //           }
                  //         },
                  //         decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: Color.fromRGBO(
                  //                 215, 211, 211, 0.13333333333333333)),
                  //         style: Theme.of(context).textTheme.headlineSmall,
                  //         textAlign: TextAlign.center,
                  //         keyboardType: TextInputType.number,
                  //         inputFormatters: [
                  //           LengthLimitingTextInputFormatter(1),
                  //           FilteringTextInputFormatter.digitsOnly
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: _mediaQuery.size.width * 0.160,
                  //       child: TextField(
                  //         onChanged: (value) {
                  //           if (value.length == 1) {
                  //             FocusScope.of(context).nextFocus();
                  //           }
                  //         },
                  //         decoration: InputDecoration(
                  //             filled: true,
                  //             fillColor: Color.fromRGBO(
                  //                 215, 211, 211, 0.13333333333333333)),
                  //         style: Theme.of(context).textTheme.headlineSmall,
                  //         textAlign: TextAlign.center,
                  //         keyboardType: TextInputType.number,
                  //         inputFormatters: [
                  //           LengthLimitingTextInputFormatter(1),
                  //           FilteringTextInputFormatter.digitsOnly
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(23),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                },
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    "Skip",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500),
                                  )),
                                  color: const Color.fromRGBO(0, 0, 0, 0.04),
                                  height: 50,
                                  width: 110,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: isLoding
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(23),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (nameController.text.isEmpty) {
                                          Toast.show(
                                              "Enter valid name", context);
                                        } else if (serviceIdController
                                            .text.isEmpty) {
                                          Toast.show("Enter valid Service Id",
                                              context);
                                        } else if (addressController
                                            .text.isEmpty) {
                                          Toast.show(
                                              "Enter valid Address", context);
                                        } else if (mobileController
                                            .text.isEmpty) {
                                          Toast.show(
                                              "Enter valid Mobile Number",
                                              context);
                                        } else if (gstController.text.isEmpty) {
                                          Toast.show("Enter valid Gst Number",
                                              context);
                                        } else if (panController.text.isEmpty) {
                                          Toast.show("Enter valid Pan Number",
                                              context);
                                        } else if (pinController.text.isEmpty) {
                                          Toast.show("Enter valid Pin Number",
                                              context);
                                        }
                                        completeProfile();
                                      },
                                      child: Container(
                                        child: Center(
                                            child: Text(
                                          'Submit',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                        color: const Color.fromRGBO(
                                            69, 55, 160, 1),
                                        height: 50,
                                        width: 190,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 25)),
              ],
            ),
          ),
        ),
      )),
    );
  }

  void completeProfile() async {
    isLoding = true;
    setState(() {});
    var body = {
      'name': nameController.text,
      'partner_id': serviceIdController.text,
      'address': addressController.text,
      'mobile[0]': mobileController.text,
      'mobile[1]': secondaryMobileController.text,
      'pan_no': panController.text,
      'pin': pinController.text,
      'token': HiveDb.getToken(),
    };
    Response response = await post(
      Uri.parse(ApiData.editServiceCenter),
      body: body,
      headers: ApiData.getHeaders(),
    );
    isLoding = false;
    setState(() {});
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      bool status = responseBody["status"];
      String message = responseBody["message"];

      if (status) {
        Toast.show(message, context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {}
    }
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
