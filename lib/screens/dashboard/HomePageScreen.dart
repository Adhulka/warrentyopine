import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:warrentyopine/Utils/HiveDb.dart';
import 'package:warrentyopine/Utils/Toast.dart';
import 'package:warrentyopine/screens/dashboard/AboutServicesScreen.dart';
import 'package:warrentyopine/screens/dashboard/HomeMenuScreen.dart';
import 'package:warrentyopine/screens/dashboard/NewRegistersScreen.dart';
import 'package:warrentyopine/screens/dashboard/TicketsScreen.dart';

import '../../APIS/api.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    child: Container(
                      width: double.infinity,
                      height: 170,
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
                                      const EdgeInsets.only(top: 10, left: 22,),
                                  child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child:
                                          InkWell(
    onTap: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMenu()));
},
                                              child: Image.asset('assets/menu appbar.png'))),
                                ),
                                SizedBox(
                                    height: 47,
                                    width: 68,
                                    child: Image.asset('assets/image 3.png')),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 20),
                                  child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: Image.asset(
                                          'assets/notify appbar.png')),
                                ),
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 20, top: 20,right: 22),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(26),
                                        child: Container(
                                          color: const Color.fromARGB(
                                              255, 244, 245, 246),
                                          height: 41,
                                          width: 318,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                width: 266,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  16),
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .transparent)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                      ),
                                                      hintText:
                                                          'Enter your PAN No',
                                                      hintStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 142, 141, 141),
                                                        fontSize: 14,
                                                      ),
                                                      filled: true,
                                                      fillColor: Color.fromRGBO(
                                                          249, 249, 249, 0.986)),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                                child: Container(
                                                  child: Image.asset(
                                                      'assets/serach appbar.png'),
                                                  height: 36,
                                                  width: 49,
                                                  color: const Color.fromRGBO(
                                                      202, 216, 255, 1),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 22,right: 22),
                    child: SizedBox(
                      width: _mediaQuery.size.width*0.80,
                       height: _mediaQuery.size.height*0.093,
                       child: ClipRRect(
                        borderRadius: BorderRadius.circular(85),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRegister()));
                          },
                          child: Container(
                            color: const Color.fromARGB(255, 247, 245, 245),
                            child: Center(
                                child: Text(
                              "+  Create New Registration",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(69, 55, 160, 1)),
                            )),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:const  EdgeInsets.only(top: 12, left: 12),
                    child: Text(
                      'Open(13)',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/LG.png'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 12),
                    child: Text(
                      'Completed(70)',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 12),
                    child: Text("Working(46)",
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:const  EdgeInsets.only(top: 16, left: 12),
                    child: Text(
                      "Rejected(7)",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 15, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 5, left: 25, right: 25),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('HNfgagg&&67b'),
                            subtitle: Text('fridge door changing'),
                            leading: SizedBox(
                              height: 45,
                              width: 45,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                color: Color.fromRGBO(206, 138, 240, 0.937)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 52),
              child: InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(
                      image: AssetImage('assets/homewelcomepage.png'),
                    )),
              ),
            ),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketsScreen()));
            },
              child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image(image: AssetImage('assets/ticketorg.png'))),
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: FloatingActionButton.small(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRegister()));
          },
          backgroundColor: Color.fromRGBO(126, 61, 248, 1),
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
  void homepagescreen(String id) async {


    var body = {
      'id':id,
      'token': HiveDb.getToken(),
    };

    Response response =
    await post(Uri.parse(ApiData.serviceCenterProfile), body: body,headers: ApiData.getHeaders(),);

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
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
