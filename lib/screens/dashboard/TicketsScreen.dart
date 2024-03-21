import 'package:flutter/material.dart';
import 'package:warrentyopine/screens/dashboard/AboutServicesScreen.dart';
import 'package:warrentyopine/screens/dashboard/HomeMenuScreen.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: Container(
                      width: double.infinity,
                      height: 125,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/backgroundpic.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMenu()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 22),
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      size: 27,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Text(
                                    'Tickets',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 26, top: 18),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(26),
                                        child: Container(
                                          color:  Color.fromARGB(
                                              255, 255, 255, 255),
                                          height: 41,
                                          width: 270,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 41,
                                                width: 268,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      prefixIcon: Icon(
                                                          Icons.search_sharp),
                                                      hintText: "Search",
                                                      hintStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            255,
                                                            142,
                                                            141,
                                                            141),
                                                        fontSize: 13,
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          Color.fromRGBO(
                                                              249,
                                                              249,
                                                              249,
                                                              0.986)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 10),
                                        child: Container(

                                          child: Center(
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                                radius: 10,
                                                backgroundImage: AssetImage("assets/ticketsearch.png")),
                                          ),
                                          height: 41,
                                          width: 41,
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Color.fromARGB(
                                                 234, 255, 255, 255
                                             ),
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
              Container(
                child: TabBar(
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: "Open",
                      ),
                      Tab(
                        text: "Working",
                      ),
                      Tab(
                        text: "Complete",
                      ),
                      Tab(
                        text: "Rejected",
                      )
                    ]),
              ),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutServices()));
              },
                child: Container(
                  height: 400,
                  width: double.maxFinite,
                  child: TabBarView(controller: tabController, children: [
                    Container(
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('HNVGFGHH7577'),
                                        subtitle: Text('Fridge Door Changing',style: TextStyle(color: Color.fromRGBO(
                                            141, 140, 140, 0.796078431372549)),),
                                        leading: SizedBox(
                                          height: 45,
                                          width: 45,
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                          ),
                                        ),
                                        trailing: CircleAvatar(maxRadius: 13,
                                          backgroundImage: AssetImage('assets/round arrow.png'),
                                        ),

                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutServices()));
                    },
                      child: Container(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('HNVGFGHH7577'),
                                      subtitle: Text('Fridge Door Changing',style: TextStyle(color: Color.fromRGBO(
                                          141, 140, 140, 0.796078431372549)),),
                                      leading: SizedBox(
                                        height: 45,
                                        width: 45,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                        ),
                                      ),
                                      trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                          color:
                                              Color.fromRGBO(206, 138, 240, 0.937)),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutServices()));
                    },
                      child: Container(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('HNVGFGHH7577'),
                                      subtitle: Text('Fridge Door Changing',style: TextStyle(color:Color.fromRGBO(
                                          141, 140, 140, 0.796078431372549)),),
                                      leading: SizedBox(
                                        height: 45,
                                        width: 45,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                        ),
                                      ),
                                      trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                          color:
                                              Color.fromRGBO(206, 138, 240, 0.937)),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutServices()));
                    },
                      child: Container(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text('HNVGFGHH7577'),
                                      subtitle: Text('Fridge Door Changing',style: TextStyle(color: Color.fromRGBO(
                                          141, 140, 140, 0.796078431372549)),),
                                      leading: SizedBox(
                                        height: 45,
                                        width: 45,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://images.unsplash.com/photo-1682687982134-2ac563b2228b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                        ),
                                      ),
                                      trailing: Icon(Icons.arrow_forward_ios_rounded,size: 18,
                                          color:
                                              Color.fromRGBO(206, 138, 240, 0.937)),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
