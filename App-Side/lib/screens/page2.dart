import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'page3.dart';

bool viewVisible = false ;
List stateList = [
  {
    "id": 4006,
    "name": "Meghalaya",
    "iso2": "ML"
  },
  {
    "id": 4007,
    "name": "Haryana",
    "iso2": "HR"
  },
  {
    "id": 4008,
    "name": "Maharashtra",
    "iso2": "MH"
  },
  {
    "id": 4009,
    "name": "Goa",
    "iso2": "GA"
  },
  {
    "id": 4010,
    "name": "Manipur",
    "iso2": "MN"
  },
  {
    "id": 4011,
    "name": "Puducherry",
    "iso2": "PY"
  },
  {
    "id": 4012,
    "name": "Telangana",
    "iso2": "TG"
  },
  {
    "id": 4013,
    "name": "Odisha",
    "iso2": "OR"
  },
  {
    "id": 4014,
    "name": "Rajasthan",
    "iso2": "RJ"
  },
  {
    "id": 4015,
    "name": "Punjab",
    "iso2": "PB"
  },
  {
    "id": 4016,
    "name": "Uttarakhand",
    "iso2": "UT"
  },
  {
    "id": 4017,
    "name": "Andhra Pradesh",
    "iso2": "AP"
  },
  {
    "id": 4018,
    "name": "Nagaland",
    "iso2": "NL"
  },
  {
    "id": 4019,
    "name": "Lakshadweep",
    "iso2": "LD"
  },
  {
    "id": 4020,
    "name": "Himachal Pradesh",
    "iso2": "HP"
  },
  {
    "id": 4021,
    "name": "Delhi",
    "iso2": "DL"
  },
  {
    "id": 4022,
    "name": "Uttar Pradesh",
    "iso2": "UP"
  },
  {
    "id": 4023,
    "name": "Andaman and Nicobar Islands",
    "iso2": "AN"
  },
  {
    "id": 4024,
    "name": "Arunachal Pradesh",
    "iso2": "AR"
  },
  {
    "id": 4025,
    "name": "Jharkhand",
    "iso2": "JH"
  },
  {
    "id": 4026,
    "name": "Karnataka",
    "iso2": "KA"
  },
  {
    "id": 4027,
    "name": "Assam",
    "iso2": "AS"
  },
  {
    "id": 4028,
    "name": "Kerala",
    "iso2": "KL"
  },
  {
    "id": 4029,
    "name": "Jammu and Kashmir",
    "iso2": "JK"
  },
  {
    "id": 4030,
    "name": "Gujarat",
    "iso2": "GJ"
  },
  {
    "id": 4031,
    "name": "Chandigarh",
    "iso2": "CH"
  },
  {
    "id": 4032,
    "name": "Dadra and Nagar Haveli",
    "iso2": "DN"
  },
  {
    "id": 4033,
    "name": "Daman and Diu",
    "iso2": "DD"
  },
  {
    "id": 4034,
    "name": "Sikkim",
    "iso2": "SK"
  },
  {
    "id": 4035,
    "name": "Tamil Nadu",
    "iso2": "TN"
  },
  {
    "id": 4036,
    "name": "Mizoram",
    "iso2": "MZ"
  },
  {
    "id": 4037,
    "name": "Bihar",
    "iso2": "BR"
  },
  {
    "id": 4038,
    "name": "Tripura",
    "iso2": "TR"
  },
  {
    "id": 4039,
    "name": "Madhya Pradesh",
    "iso2": "MP"
  },
  {
    "id": 4040,
    "name": "Chhattisgarh",
    "iso2": "CT"
  },
  {
    "id": 4852,
    "name": "Ladakh",
    "iso2": "LA"
  },
  {
    "id": 4853,
    "name": "West Bengal",
    "iso2": "WB"
  }
];

List cityList = List();
List visitingCityList = List();

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
String stateISO2;
String visitingState;
String district;

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  // Future<void> fetchStates() async {
  //   try{
  //   final response = await http.get(
  //     Uri.parse('https://www.universal-tutorial.com/api/states/India'),
  //     // Send authorization headers to the backend.
  //     headers: {
  //       HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJzaHJlZWV2aWR5YWp1bmtAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoibmFubm4xQVVZd2h2SGJPOF80SndSU2Y0TzhOZnBqMlRDMEIzS1E1NFRFN3h5ZlBoOFB3aGJibFpwSkhvZ0hnYjlWSSJ9LCJleHAiOjE2MjIwOTQwNjh9.Fz_bKIoFohorkvyT5Z4hui4qtKY7-n9bGOBGY5f-V2I',
  //     },
  //   );
  //   final responseJson = jsonDecode(response.body);
  //   setState(() {
  //     stateList = responseJson;
  //     visitingStateList = responseJson;
  //     stateList.forEach((element) {dummy.insert(0, element['state_name']);});
  //     print(dummy);
  //   });}
  //   catch(error) {
  //     print(error);
  //   }
  // }


  Future<void> fetchCity() async {
    final response = await http.get(
      Uri.parse('https://api.countrystatecity.in/v1/countries/IN/states/$stateISO2/cities'),
      // Send authorization headers to the backend.
      headers: {
        'X-CSCAPI-KEY': 'NElkaEFZNlQxY3NBZ0NGaVFsVzN6a3RlUDNyblA3R3d4bDBkaEwwTA==',
      },
    );
    final responseJson = jsonDecode(response.body);
    setState(() {
      cityList = responseJson;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   this.fetchStates();
  // }

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
                      items: stateList.map((item) {
                        return DropdownMenuItem(
                          value: item['name'],
                          child: Text(
                            item['name'],
                            style: TextStyle(fontSize: 17, fontFamily: 'Raleway', fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                  setState(() {
                    state = val;
                    cityList = [];
                    district= null;
                var x =  stateList.firstWhere((element) => element['name']== state);
                  stateISO2 = x['iso2'];
                  print(stateISO2);
                  });
                  this.fetchCity();
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
                        hint: Text('Select City'),
                        items: cityList.map((item) {
                        return DropdownMenuItem(
                        value: item['name'],
                        child: Text(
                          item['name'],
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
                        value: visitingState ,
                        hint: Text('Select State'),
                        items: stateList.map((item) {
                        return DropdownMenuItem(
                        value: item['name'],
                        child: Text(
                        item['name'],
                        style: TextStyle(fontSize: 17, fontFamily: 'Raleway', fontWeight: FontWeight.w600),
                        ),
                        );
                        }).toList(),
                        onChanged: (val)  {
                        setState(() => visitingState = val);
                        viewVisible = true;},
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
                                activeColor: Colors.black,
                                checkColor: Colors.white,
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
                        'Next',
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



