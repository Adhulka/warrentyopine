
import 'package:flutter/material.dart';
import 'package:warrentyopine/screens/dashboard/AboutServicesScreen.dart';
class AddpartScreen extends StatefulWidget {
  const AddpartScreen({Key? key}) : super(key: key);

  @override
  State<AddpartScreen> createState() => _AddpartScreenState();
}

class _AddpartScreenState extends State<AddpartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
             Row(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 10, left: 20),
                   child: GestureDetector(onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutServices()));
                   },
                       child: Icon(Icons.arrow_back_rounded)),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 10, left: 20),
                   child: Text(
                     'Add Parts',
                     style: TextStyle(
                         fontSize: 13, fontWeight: FontWeight.w500),
                   ),
                 )
               ],
             ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            color:  Color.fromARGB(
                                255, 255, 255, 255),
                            height: 41,
                            width: 320,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 41,
                                  width: 318,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                18),
                                            borderSide: BorderSide(
                                                color: Colors
                                                    .black26)),
                                        focusedBorder:
                                        OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors
                                                  .black26),
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
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
