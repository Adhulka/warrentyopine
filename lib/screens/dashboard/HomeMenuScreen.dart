import 'package:flutter/material.dart';
import 'package:warrentyopine/Utils/HiveDb.dart';
import 'package:warrentyopine/Utils/HiveKeys.dart';
import 'package:warrentyopine/screens/authpages/LoginScreen.dart';
import 'package:warrentyopine/screens/dashboard/HomePageScreen.dart';
import 'package:warrentyopine/screens/dashboard/HomeProfile.dart';
import 'package:warrentyopine/screens/dashboard/TicketsScreen.dart';

import '../../Utils/Data_model.dart';

void main() {
  runApp(MaterialApp(
    home: HomeMenu(),
  ));
}

class HomeMenu extends StatefulWidget {
  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  UserModel userModel = HiveDb.getUserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(27),
                bottomRight: Radius.circular(27)),
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
                          padding: const EdgeInsets.only(top: 10, left: 22),
                          child: SizedBox(
                              height: 25,
                              width: 25,
                              child: InkWell(
                                onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
                                  child: Icon(Icons.arrow_back_rounded))),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 19),
                      child: ListTile(
                        leading: SizedBox(
                          height: 60,
                          width: 60,
                          child: CircleAvatar(
                            radius: 60,
                            child: Image.asset('assets/circlepic.png'),
                          ),
                        ),
                        title: Text(
                        userModel.name.toString(),
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                           userModel.partnerId.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                  HomeProfile()  ));
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                color: Color.fromRGBO(13, 104, 179, 1),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 438,
              width: 360,
              // color: Colors.amber,
              child: Column(
                children: [
                  GestureDetector(onTap:
                  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeProfile()));
                  },
                    child: SizedBox(
                      height: 38,
                      width: 360,
                      child: ListTile(
                        leading: Image.asset('assets/profile.png'),
                        title: Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 0.5,
                    indent: 15,
                    endIndent: 7,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketsScreen()));
                    },
                    child: SizedBox(
                      height: 38,
                      width: 360,
                      child: ListTile(
                        leading: Image.asset('assets/profiletickets.png'),
                        title: Text(
                          'Tickets',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 0.5,
                    indent: 15,
                    endIndent: 7,
                  ),
                  SizedBox(
                    height: 38,
                    width: 360,
                    child: ListTile(
                      leading: Image.asset('assets/profile report.png'),
                      title: Text(
                        'Report',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 0.5,
                    indent: 15,
                    endIndent: 7,
                  ),
                  SizedBox(
                    height: 38,
                    width: 360,
                    child: ListTile(
                      leading: Image.asset('assets/profile account.png'),
                      title: Text(
                        'Account Setting',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 0.5,
                    indent: 15,
                    endIndent: 7,
                  ),
                  SizedBox(
                    height: 38,
                    width: 360,
                    child: ListTile(
                      leading: Image.asset('assets/profile help.png'),
                      title: Text(
                        'Help',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 0.5,
                    indent: 15,
                    endIndent: 7,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                    child: SizedBox(
                      height: 38,
                      width: 360,
                      child: ListTile(
                        leading: Image.asset('assets/profile logout.png'),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 20,
                    thickness: 0.5,
                    indent: 15,
                    endIndent: 7,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
