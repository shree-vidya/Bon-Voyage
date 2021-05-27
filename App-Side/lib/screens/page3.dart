import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page4.dart';
import 'page5.dart';
import 'page6.dart';



final Map<String,dynamic> places= {
  'Red Fort' : false,
  'Qutub Minar': false,
  'Gurudwara Bangla Sahib': false,
  'Lotus Temple': false,
  'India Gate': false,
  'Jama Masjid': false,
  'Taj Mahal': false,
  'Humayun\'s Tomb': false,
  'Akshardham': false,
  'Purana Qila': false,
  'Rajpath and Rashtrapati Bhavan': false,

} ;

String state;
String visitingState;
String district;

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
                  image: AssetImage('images/page3_city.jpg'),
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
                    margin: EdgeInsets.only(left:15, right:10),
                    child: Text(
                      "Select Places:",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'SpecialElite',
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:20, left:15, right: 15,bottom: 15),
                    padding:EdgeInsets.only( left:10, right: 10,top:5, bottom: 10) ,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),

                    child: Column(
                      children: places.entries.map((entry)
                      {
                        return CheckboxListTile(
                          title:  Text(entry.key, style: TextStyle(fontFamily: 'SpecialElite', fontSize: 21, fontWeight: FontWeight.w600,),),
                          value: entry.value,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
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
                    margin: EdgeInsets.only(top:10,bottom: 25),
                    height: screenHeight*.06,
                    child: RaisedButton(
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page4(),));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color:Colors.white)),
                      child: Text(
                        'Find Best Route',
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



