import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:readmore/readmore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warrentyopine/APIS/api.dart';
import 'package:warrentyopine/Utils/Toast.dart';

import 'package:warrentyopine/screens/dashboard/ApiAddButton.dart';
import 'package:warrentyopine/screens/dashboard/HomePageScreen.dart';
import 'package:warrentyopine/screens/dashboard/TicketsScreen.dart';

import '../../Utils/HiveDb.dart';



void main(){
  runApp(MaterialApp(home: AboutServices(),));
}

class AboutServices extends StatefulWidget {

  @override
  State<AboutServices> createState() => _AboutServicesState();
}

class _AboutServicesState extends State<AboutServices> {
  String dropDownValue = 'Working';
  List data=[];
  int _value=1;

 final ImagePicker imagePicker=ImagePicker();
 List<XFile>imageFileList=[];
 void selectImage()async{
   final List<XFile>?selectedImages=await imagePicker.pickMultiImage();
   if(selectedImages!.isNotEmpty){
     imageFileList!.addAll(selectedImages);
   }
   setState(() {

   });
 }
 bool isVisibleAdd=false;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
  updateclaimstatus();
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Expanded(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: GestureDetector(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketsScreen()));
                          },
                              child: Icon(Icons.arrow_back_rounded)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'About Service',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                    
                          height: 70,
                          width: 360,
                          // color: Colors.amber,
                          child: ListTile(
                            title: Text("876NVHH7577"),
                            subtitle: Text(
                              "Fridge Door Changing",
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                            leading: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/LG.png"))
                              ),
                              height: 42,
                              width: 40,
                    
                              // child: Image(image: AssetImage("")),
                            ),
                            trailing: Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                    height: 40,
                                    width: 102,
                                    color: Colors.amber,
                                    child: Center(
                                      child: DropdownButton<String>(
                                        value: dropDownValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropDownValue = newValue!;
                                          });
                                        },
                                        items: const [
                                          DropdownMenuItem<String>(
                                            value: 'Working',
                                            child: Text(
                                              'Working',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Completed',
                                            child: Text('Completed',
                                                style: TextStyle(fontSize: 12)),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'Rejected',
                                            child: Text('Rejected',
                                                style: TextStyle(fontSize: 12)),
                                          ),
                                        ],
                                      ),

                                    )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 15, right: 15),
                          child: ReadMoreText(
                            "Fridge, pronounced /FRIJ/, is the shortened form of refrigerator that started appearing in print in the early 20th century. The word was likely spoken long before it appeared in writing.Fridge, pronounced /FRIJ/, is the shortened form of refrigerator that started appearing in print in the early 20th century. The word was likely spoken long before it appeared in writing.",
                            trimLines: 2,
                            textAlign: TextAlign.justify,
                            trimCollapsedText: "More",
                            trimExpandedText: "Show Less",
                            lessStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 29, 42, 227),
                                fontSize: 16),
                            moreStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 29, 42, 227),
                                fontSize: 16),
                          ),
                        )),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                'Information',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                                "Type",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 90, top: 10),
                              child: Text("Fridge"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 21,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Serial Number",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 31),
                              child: Text("example123"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 21,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Issued Date",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 44),
                              child: Text("12-08-2023"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 21,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Model Number",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27),
                              child: Text("8157xxsvg77"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 21,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                "Information",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 47),
                              child: Text("Information"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 21,
                    ),
            
                    
            Container(
              child: Row(
                    children: [
            Row(
              children: [
                GestureDetector(
                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                    
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/inputimage.png'))),
                      ),
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
                    itemCount:imageFileList!.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(File(imageFileList[index].path),fit: BoxFit.cover,
                        ),
                      );
                    }) ,
              ),
            ),
                    
                    
                    
                    ],
              ),
                    
                    
            ),
                    
                    
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 2,
                      endIndent: 2,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Text("Parts Request",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 190,),
                              child:GestureDetector(
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
                              )
                            ),

                          ],
                        )
                      ],
                    ),
                    if(isVisibleAdd)
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, right: 15),
                        child: TextFormField(
                          minLines: 2,
                          maxLines: 7,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                    Divider(
                      color: Colors.grey,
                      height: 20,
                      thickness: 0.5,
                      indent: 2,
                      endIndent: 2,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Text(
                                'Remarks*',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15),
                              child: TextFormField(
                                minLines: 2,
                                maxLines: 7,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15))),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Container(
                            height: 290,
                            width: double.maxFinite,
                            color: Color(0x299E9E9E),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, top: 20),
                                          child: Text(
                                            'Comments',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: ListTile(
                                        leading: CircleAvatar(),
                                        title: Text(
                                          'name123',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        subtitle: Expanded(
                                            child: Text(
                                          "My Samsung side by side refrigerator is very big,my name is adhul ",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),
                                        )),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: ListTile(
                                        leading: CircleAvatar(),
                                        title: Text(
                                          'name321',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        subtitle: Expanded(
                                            child: Text(
                                          "My Samsung side by side refrigerator is very big, spacious and elegant looking good wowww",
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.black),
                                        )),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 5,left: 20),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                                child: Container(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  height: 41,
                                                  width: 320,
                                                  child: Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                26),
                                                        child: Container(
                                                          child: Image.asset(
                                                              'assets/serach appbar.png'),
                                                          height: 36,
                                                          width: 36,
                                                          color:
                                                              const Color.fromRGBO(
                                                                  202, 216, 255, 1),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 40,
                                                        width: 215,
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                                  enabledBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                                  16),
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: Colors
                                                                                  .transparent)),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors
                                                                            .transparent),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                16),
                                                                  ),
                                                                  hintText:
                                                                      'Add a comment...',
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            142,
                                                                            141,
                                                                            141),
                                                                    fontSize: 14,
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: Color
                                                                      .fromRGBO(
                                                                          255,
                                                                      255,
                                                                      255,
                                                                      0.984313725490196)),
                                                        ),
                                                      ),
                                                      // ClipRRect(
                                                      //   borderRadius:
                                                      //       BorderRadius.circular(
                                                      //           26),
                                                      //   child: Container(
                                                      //     child: Image.asset(
                                                      //         'assets/serach appbar.png'),
                                                      //     height: 36,
                                                      //     width: 49,
                                                      //     color:
                                                      //         const Color.fromRGBO(
                                                      //             202, 216, 255, 1),
                                                      //   ),
                                                      // ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 30),
                                                        child: Container(
                                                          height: 40,
                                                          width: 30,
                                                          child: Icon(
                                                            Icons
                                                                .send,
                                                            size: 17,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                    
                                        ],
                                      ),
                    
                                    ),
                    
                                  ],
                    
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width:double.maxFinite,
                            color: Color(0x299E9E9E)
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateclaimstatus()async{
    var body = {


      'token': HiveDb.getToken(),
    };

   final response=await get(Uri.parse(ApiData.updateClaimWarrentyStatus),  );
   data=jsonDecode(response.body);
   setState(() {

   });
   if (response.statusCode == 200) {
     var responseBody = jsonDecode(response.body);


     bool status = responseBody["status"];
     String message = responseBody["message"];

     if (status) {
       Toast.show(message, context);
       Navigator.push(
           context, MaterialPageRoute(builder: (context) => HomePage()));
     } else {

     }
   }
  }

}
