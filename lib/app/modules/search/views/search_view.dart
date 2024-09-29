import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';


class SearchView extends GetView<SearchingController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Color(0xffF2F3F6),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 290,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff1966FF))
                ),
                child: Text("Searching", style: TextStyle(fontSize: 20,), textAlign: TextAlign.left,),
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Searching',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10)
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 20,
              ),

              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                color: Color(0xff1966FF),
                borderRadius: BorderRadius.circular(30), 
                ),
                child: Icon(
                  Icons.search,
                  color: Color(0xffffffff),
                ),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Color(0xff1966FF),
                  borderRadius: BorderRadius.circular(10)
                ),
                alignment: Alignment.center,
                child: Text("All", style: TextStyle(fontSize: 12, color: Color(0xffffffff)), textAlign: TextAlign.center,),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Color(0xffC7DAFF),
                  borderRadius: BorderRadius.circular(10)
                ),
                alignment: Alignment.center,
                child: Text("Available", style: TextStyle(fontSize: 12, color: Color(0xff1966FF)), textAlign: TextAlign.center,),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Color(0xffC7DAFF),
                  borderRadius: BorderRadius.circular(10)
                ),
                alignment: Alignment.center,
                child: Text("Booked", style: TextStyle(fontSize: 12, color: Color(0xff1966FF)), textAlign: TextAlign.center,),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: Color(0xffC7DAFF),
                  borderRadius: BorderRadius.circular(10)
                ),
                alignment: Alignment.center,
                child: Text("On Rent", style: TextStyle(fontSize: 12, color: Color(0xff1966FF)), textAlign: TextAlign.center,),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          Card(            
            margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  tileColor: Color(0xffffffff),
                  minTileHeight: 100,
                  minLeadingWidth: 100,
                  leading: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 2, 2, 2),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)
                    ),  
                    child: Text("IMG"),              
                  ),
                  title: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("yamaha",
                          style: TextStyle(
                            fontSize: 10,
                          ),),
                          SizedBox(
                            width: 110,
                          ),
                          Text("available", style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffFF9500)
                          ),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(0)),
                      Row(
                        children: [
                          Text("PCX 2024", 
                          style: TextStyle(
                            fontSize: 15),),
                          SizedBox(width: 85,),
                          Text("NAMA ", style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Plat Nomor", 
                          style: TextStyle(
                            fontSize: 10),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Rp.200.000/Day", 
                          style: TextStyle(
                            fontSize: 13),),
                        ],
                      ),
                    ],
                  ),
                  // trailing: Icon(
                  //   Icons.chevron_left,
                  //   size: 1,
                    
                  // ),
                )
              ],
            ),
          ),

          Card(            
            margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  tileColor: Color(0xffffffff),
                  minTileHeight: 100,
                  minLeadingWidth: 100,
                  leading: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 2, 2, 2),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)
                    ),  
                    child: Text("IMG"),              
                  ),
                  title: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("yamaha",
                          style: TextStyle(
                            fontSize: 10,
                          ),),
                          SizedBox(
                            width: 110,
                          ),
                          Text("available", style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff34C759)
                          ),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(0)),
                      Row(
                        children: [
                          Text("PCX 2024", 
                          style: TextStyle(
                            fontSize: 15),),
                          SizedBox(width: 85,),
                          Text("NAMA ", style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Plat Nomor", 
                          style: TextStyle(
                            fontSize: 10),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Rp.200.000/Day", 
                          style: TextStyle(
                            fontSize: 13),),
                        ],
                      ),
                    ],
                  ),
                  // trailing: Icon(
                  //   Icons.chevron_left,
                  //   size: 1,
                    
                  // ),
                )
              ],
            ),
          ),

          Card(            
            margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                ListTile(
                  tileColor: Color(0xffffffff),
                  minTileHeight: 100,
                  minLeadingWidth: 100,
                  leading: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 2, 2, 2),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)
                    ),  
                    child: Text("IMG"),              
                  ),
                  title: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("yamaha",
                          style: TextStyle(
                            fontSize: 10,
                          ),),
                          SizedBox(
                            width: 110,
                          ),
                          Text("available", style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffFF3B30)
                          ),)
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(0)),
                      Row(
                        children: [
                          Text("PCX 2024", 
                          style: TextStyle(
                            fontSize: 15),),
                          SizedBox(width: 85,),
                          Text("NAMA ", style: TextStyle(fontSize: 12),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Plat Nomor", 
                          style: TextStyle(
                            fontSize: 10),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Rp.200.000/Day", 
                          style: TextStyle(
                            fontSize: 13),),
                        ],
                      ),
                    ],
                  ),
                  // trailing: Icon(
                  //   Icons.chevron_left,
                  //   size: 1,
                    
                  // ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
