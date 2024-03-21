import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warrentyopine/Utils/HiveDb.dart';

import 'package:warrentyopine/screens/dashboard/HomePageScreen.dart';

import '../../APIS/api.dart';
import '../../Utils/Data_model.dart';
import '../../Utils/Toast.dart';

void main() {
  runApp(MaterialApp(
    home: NewRegister(),
  ));
}

class NewRegister extends StatefulWidget {
  const NewRegister({super.key});

  @override
  State<NewRegister> createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
  final TextEditingController serialNumberController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController modelNumberController = TextEditingController();
  final TextEditingController issueController = TextEditingController();
  final TextEditingController resolutionController = TextEditingController();
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];
  bool isLoding = false;
  UserModel userData = UserModel();
  void selectImage() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  bool isVisibleAdd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Icon(Icons.arrow_back_sharp)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Registration",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 19, right: 19, top: 25),
                  child: SizedBox(
                    height: 49,
                    child: TextField(
                      controller: serialNumberController,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(184, 0, 0, 0))),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color.fromARGB(40, 2, 2, 2)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: 'Serial No',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 142, 141, 141),
                          ),
                          filled: true,
                          fillColor: Color.fromRGBO(244, 241, 241, 0.38)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 19),
                  child: Row(
                    children: [
                      Text(
                        "Information",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 25, right: 19),
                      child: SizedBox(
                        height: 49,
                        child: TextFormField(
                          controller: typeController,
                          decoration: InputDecoration(
                              labelText: 'Type',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 30, right: 19),
                      child: SizedBox(
                        height: 49,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Model Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 30, right: 19),
                      child: SizedBox(
                        height: 49,
                        child: TextFormField(
                          controller: modelNumberController,
                          decoration: InputDecoration(
                              labelText: 'Issue',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 30, right: 19),
                      child: SizedBox(
                        height: 49,
                        child: TextFormField(
                          controller: issueController,
                          decoration: InputDecoration(
                              labelText: 'Resolution',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 30, right: 19),
                      child: SizedBox(
                        height: 49,
                        child: TextFormField(
                          controller: resolutionController,
                          decoration: InputDecoration(
                              labelText: 'Customer Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 30, right: 19),
                      child: SizedBox(
                        height: 49,
                        child: TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(
                              labelText: 'Address',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 19, top: 30, right: 19),
                      child: SizedBox(
                        height: 49,
                        child: TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 21,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Row(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                    child: Container(
                                      height: 100,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/inputimage.png'))),
                                    ),
                                    onTap: () {
                                      selectImage();
                                    }),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Container(
                                color: Colors.white,
                                width: 246,
                                height: 100,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imageFileList!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.file(
                                          File(imageFileList[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 21,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 3, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Part Requests",
                            style: TextStyle(fontSize: 16),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                left: 190,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  isVisibleAdd = !isVisibleAdd;

                                  setState(() {});
                                },
                                child: Icon(
                                  isVisibleAdd
                                      ? Icons.remove
                                      : Icons.add_circle_sharp,
                                  color: const Color.fromRGBO(69, 55, 160, 1),
                                ),
                              )),
                        ],
                      ),
                    ),
                    if (isVisibleAdd)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 15),
                        child: TextFormField(
                          minLines: 2,
                          maxLines: 6,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 0.5,
                        indent: 15,
                        endIndent: 21,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Remarks *',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 15),
                      child: TextFormField(
                        minLines: 2,
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, top: 10, bottom: 10),
                      child: isLoding
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(27),
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

                                  homeRegistration();
                                  serialnum();
                                },
                                child: Container(
                                  height: 60,
                                  width: 345,
                                  color: Color.fromARGB(255, 95, 31, 179),
                                  child: Center(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void homeRegistration() async {
    isLoding = true;
    setState(() {});
    var body = {
      'serial_no': serialNumberController,
      'type': typeController.text,
      'model_no': modelNumberController.text,
      'issue': issueController.text,
      'resolution': resolutionController.text,
      'customer_name': customerNameController.text,
      'address': addressController.text,
      'phone_no': phoneNumberController.text,
      'token': HiveDb.getToken(),
    };
    Response response = await post(
      Uri.parse(ApiData.addClaimRegistration),
      body: body,
      headers: ApiData.getHeaders(),
    );
    isLoding = false;
    setState(() {});
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      bool status = responseBody["status"];
      String message = responseBody["message"];
      String userid=responseBody["uid"];
      Toast.show(message, context);
      if (status) {

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {}
    }
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  void serialnum() async {
    isLoding = true;
    setState(() {});
    var body = {
      'token': HiveDb.getToken(),
    };
    Response response = await get(
      Uri.parse(ApiData.validateSerialNo),
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
      } else {}
    }
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
