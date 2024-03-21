import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:pinput/pinput.dart';
import 'package:warrentyopine/Utils/Data_model.dart';
import 'package:warrentyopine/Utils/Extentions.dart';

import 'package:warrentyopine/Utils/HiveDb.dart';

import 'package:warrentyopine/screens/dashboard/HomePageScreen.dart';

import '../../APIS/api.dart';

import '../../Utils/Toast.dart';

void main() {
  runApp(MaterialApp(
    home: HomeProfile(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeProfile extends StatefulWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController serviceIdController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController secondaryMobileController =
      TextEditingController();

  final TextEditingController gstController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  UserModel userModel = HiveDb.getUserModel();
  bool isVisibleSecondPh = false;
  bool isLoading = false;

  @override
  void initState() {
    nameController.text = userModel.name ?? "";
    serviceIdController.text = userModel.partnerId ?? "";
    addressController.text = userModel.address ?? "";

    gstController.text = userModel.gstNo ?? "";
    panController.text = userModel.panNo ?? "";
    pinController.text = userModel.pin ?? "";
    if ((userModel.mobile ?? "").contains(",")) {
      List<String> phNosList = userModel.mobile!.split(",").toList();
      isVisibleSecondPh = phNosList.length > 1;
      mobileController.text = phNosList[0];
      secondaryMobileController.text = phNosList[1];
    } else {
      mobileController.text = userModel.mobile ?? "";
    }
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {

    var _mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(27),
                        bottomRight: Radius.circular(27)),
                    child: Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/backgroundpic.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 22),
                                  child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()));
                                          },
                                          child:
                                              Icon(Icons.arrow_back_rounded))),
                                ),
                                Center(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, right: 22),
                                      child:isLoading?Center(child: const CircularProgressIndicator()): GestureDetector(
                                          onTap: () {
                                            saveData();

                                          },
                                          child: Text(
                                            "Save",
                                            style: TextStyle(fontSize: 14),
                                          ))),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 155, top: 90),
                    child: SizedBox(
                      height: 67,
                      width: 67,
                      child: Image.asset(
                        'assets/circlepic.png',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, top: 15),
                    child: Text(
                      'Name',
                      style: GoogleFonts.publicSans(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 22, right: 22, top: 7),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Colors.black12)),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 22, top: 15),
                    child: Text(
                      'Service ID',
                      style: GoogleFonts.publicSans(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 22, right: 22, top: 7),
                      child: TextField(
                        controller: serviceIdController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Colors.black12)),
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
                    child: Padding(
                      padding: EdgeInsets.only(left: 22, right: 22, top: 7),
                      child: TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Colors.black12)),
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
                        height: 70,
                        width: 300,
                        child: Padding(
                          padding: EdgeInsets.only(left: 22, right: 22, top: 7),
                          child: TextField(
                            controller: mobileController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(21),
                                    borderSide:
                                        BorderSide(color: Colors.black12)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                hintText: 'Enter your Phone Number',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 142, 141, 141),
                                ),
                                filled: true,
                                fillColor:
                                    Color.fromRGBO(255, 255, 255, 0.381)),
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
                      height: 70,
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.only(left: 22, right: 22, top: 7),
                        child: TextField(
                          controller: secondaryMobileController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide:
                                      BorderSide(color: Colors.black12)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              hintText: 'Enter your Secondary Number',
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
                    child: Padding(
                      padding: EdgeInsets.only(left: 22, right: 22, top: 7),
                      child: TextField(
                        controller: gstController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Colors.black12)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: 'Enter your Gst',
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
                    child: Padding(
                      padding: EdgeInsets.only(left: 22, right: 22, top: 7),
                      child: TextField(
                        controller: panController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Colors.black12)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            hintText: 'Enter your Pan ',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 142, 141, 141),
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 0.381)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22, top: 12),
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
                  Padding(padding: EdgeInsets.all(20))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future saveData() async {
    isLoading=true;
    setState(() {

    });
    var body = {
      'name': nameController.text,
      'partner_id': serviceIdController.text,
      'address': addressController.text,
      'mobile[1]': mobileController.text,
      'mobile[2]': secondaryMobileController.text,
      'gst': gstController.text,
      'pan_no': panController.text,
      'pin': pinController.text,
      'token': HiveDb.getToken(),
      'id': (HiveDb.getUserModel().id??0).toString(),
    };
    Response response = await post(Uri.parse(ApiData.editServiceCenter),
        body: body,headers: ApiData.getHeaders());
    isLoading=false;
    setState(() {

    });
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      bool status = responseBody["status"];
      String message = responseBody["message"];
      if (status) {
        if(HiveDb.getUserModel().id.isGreaterThanZero()){
          userModel.name=nameController.text;
          userModel.partnerId=serviceIdController.text;
          userModel.address=addressController.text;
          userModel.gstNo=gstController.text;
          userModel.panNo=panController.text;
          userModel.pin=pinController.text;
          userModel.mobile=secondaryMobileController.text.isNullOrEmpty()?
          mobileController.text: mobileController.text+","+secondaryMobileController.text;
          HiveDb.setUserModel(userModel);
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage()));
      } else {
        Toast.show('$message', context);
      }
    }
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
