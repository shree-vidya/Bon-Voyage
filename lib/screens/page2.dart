import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page3.dart';
import 'page4.dart';
import 'page5.dart';
import 'page6.dart';


final List<String> stateList=[
  "Karnataka",
  "Delhi",
  "Mumbai"
];

final List<String> visitingStateList=[
  "Karnataka",
  "Delhi",
  "Mumbai"
];

final List<String> districtList=[
  "Chitradurga",
  "Bengaluru",
  "Mysore"
];

final Map<String,dynamic> places= {
  "Temple": false,
  "Amusement parks": false,
  "Trekking places": false,
  "Beaches": false,
  "Historical sites": false,
  "zoo": false,
  "Resorts": false
} ;

String state;
String visitingState;
String district;

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override


  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,

    body:  Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/page2_venice.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),

          Container(
          margin: EdgeInsets.only(top:screenHeight*.20,left:20,right:20),
            child: SingleChildScrollView(
              child: Column(
                children: [

                Container(
                alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left:10, right:10),
                child: Text(
                  "Start State:",
                  style: TextStyle(
                    fontSize: 25,
                      fontFamily: 'SpecialElite',
                    color: Colors.white
                  ),
                ),
              ),
                  // Container(
                  //   margin: EdgeInsets.only(left:10, right:10),
                  //   decoration:BoxDecoration(
                  //     border: Border(
                  //       bottom: BorderSide(width: .5, color: Colors.white),
                  //     ),
                  //     color: Colors.transparent,
                  //   ),
                  //   child: Container(
                  //     padding: EdgeInsets.only(left:10),
                  //     child: TextField(
                  //         style: TextStyle(color: Colors.white),
                  //       decoration: InputDecoration(
                  //         hintText: 'Label text',
                  //         fillColor: Colors.white,
                  //         hintStyle:
                  //         TextStyle(fontSize: 19, color: Colors.grey),
                  //         border: InputBorder.none,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: screenWidth*0.8,
                    margin : EdgeInsets.only(top: 10,right: 10,left: 10),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      value: state ,
                      hint: Text('Select State'),
                      items: stateList.map((dura0) {
                        return DropdownMenuItem(
                          value: dura0,
                          child: Text(
                            '$dura0',
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway', fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => state = val),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          filled: true,
                          fillColor: Colors.white60,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:10, right:10,top:20),
                    child: Text(
                      "Start City:",
                      style: TextStyle(
                        fontFamily: 'SpecialElite',
                          fontSize: 26,
                          // fontWeight: FontWeight.w100,
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth*0.8,
                    margin : EdgeInsets.only(top: 5,left: 10,right: 10),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      value: district ,
                      hint: Text('Select District'),
                      items: districtList.map((dura0) {
                        return DropdownMenuItem(
                          value: dura0,
                          child: Text(
                            '$dura0',
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway', fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() => district = val);
                      },
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          filled: true,
                          fillColor: Colors.white60,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:10, right:10,top:20),
                    child: Text(
                      "Visiting State:",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'SpecialElite',
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth*0.8,
                    margin : EdgeInsets.only(top: 10,right: 10,left: 10),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      value: state ,
                      hint: Text('Select State'),
                      items: visitingStateList.map((dura0) {
                        return DropdownMenuItem(
                          value: dura0,
                          child: Text(
                            '$dura0',
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway', fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => visitingState = val),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          filled: true,
                          fillColor: Colors.white60,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:10, right:10,top:20),
                    child: Text(
                      "Preferred Places:",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'SpecialElite',
                          color: Colors.white
                      ),
                    ),
                  ),
              Container(
                margin: EdgeInsets.only(top:15, left:15, right: 15,bottom: 15),
                padding:EdgeInsets.only( left:10, right: 10,top:5, bottom: 5) ,
                decoration: BoxDecoration(
                    color: Colors.white60,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),

                child: Column(
                  children: places.entries.map((entry)
                      {
                       return CheckboxListTile(
                          title:  Text(entry.key, style: TextStyle(fontFamily: 'SpecialElite', fontSize: 21, fontWeight: FontWeight.w500,),),
                          value: entry.value,
                          onChanged: (bool value) {
                            setState(() {
                             places[entry.key] = value;
                            });
                          },
                        );
                      }).toList(),
                ),
              ),
                  Container(
                    margin: EdgeInsets.only(top:10,bottom: 20),
                    height: screenHeight*.06,
                    child: RaisedButton(
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page3(),));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color:Colors.white)),
                      child: Text(
                        'See Places List',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Raleway'),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
          Positioned(    // To take AppBar Size only
            top: screenHeight*.07,
            left: 3.0,
            right: 20.0,
            child: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              backgroundColor: Colors.transparent,
              primary: false,
              title: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Bon Voyage',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50.0,
                        fontFamily : 'Ariana-Violeta',
                        // fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



