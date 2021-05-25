import 'package:flutter/material.dart';


final List<String> stateList=[
  "Karnataka",
  "Delhi",
  "Mumbai"
];

final List<String> districtList=[
  "Chitradurga",
  "Bengaluru",
  "Mysore"
];

String state;
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
    // appBar: PreferredSize(
    //   preferredSize: Size.fromHeight(130.0), // here the desired height
    //   child: AppBar(
    //     backgroundColor: Colors.black45,
    //     elevation: 5,
    //     centerTitle: true,
    //     title: Container(
    //       height: screenHeight*.9,
    //       color: Colors.blue,
    //       child: Center(
    //         child: Text(
    //           'Bon Voyage',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //               fontSize: 80.0,
    //               fontFamily : 'Ariana-Violeta',
    //               // fontWeight: FontWeight.bold,
    //               color: Color.fromRGBO(255, 255, 255, 1)),
    //         ),
    //       ),
    //     ),
    //   ),
    // ),
    body:  Stack(
        children: <Widget>[
          Container(
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/venice.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),

          Container(
          margin: EdgeInsets.only(top:screenHeight*.21,left:20,right:20),
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
                      fontFamily: 'Raleway',
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
                    margin : EdgeInsets.only(top: 10,right: 30),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      value: state ,
                      hint: Text('Select State'),
                      items: stateList.map((dura0) {
                        return DropdownMenuItem(
                          value: dura0,
                          child: Text(
                            '$dura0',
                          ),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => state = val),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          filled: true,
                          fillColor: Colors.white70,
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
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:10, right:10,top:20),
                    child: Text(
                      "Start City:",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                          fontSize: 23,
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth*0.8,
                    margin : EdgeInsets.only(top: 5,right: 30),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      value: district ,
                      hint: Text('Select District'),
                      items: districtList.map((dura0) {
                        return DropdownMenuItem(
                          value: dura0,
                          child: Text(
                            '$dura0',
                          ),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => district = val),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          filled: true,
                          fillColor: Colors.white70,
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
                ],
              ),
            ),
          ),
          Positioned(    // To take AppBar Size only
            top: screenHeight*.07,
            left: 3.0,
            right: 20.0,
            child: AppBar(
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
