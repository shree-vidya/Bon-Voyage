import 'package:flutter/material.dart';
import 'page5.dart';

final List<dynamic> placeList=[
  {
    'rank':1,
    'place':'Red Fort'
  },
  {
    'rank':2,
    'place':'Qutub Minar'
  },
  {
    'rank':3,
    'place':'Gurudwara Bangla Sahib'
  },
  {
    'rank':4,
    'place':'Lotus Temple'
  },
  {
    'rank':5,
    'place':'India Gate'
  },
  {
    'rank':6,
    'place':'Jama Masjid'
  },
  {
    'rank':7,
    'place':'Humayun\'s Tomb'
  },
  {
    'rank':8,
    'place':'Akshardham'
  },
  {
    'rank':9,
    'place':'Purana Qila'
  },
  {
    'rank':10,
    'place':'Rajpath and Rashtrapati Bhavan'
  },
];

int noOfPlaces=placeList.length;
String state;
String district;

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
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
                  image: AssetImage('images/page4_bali.jpg'),
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
                      "Your plan for the trip (Places to visit in order):",
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'SpecialElite',
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: placeList.map((place){
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left:10, right:20),
                              child: Text(
                                place['rank'].toString(),
                                style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'SpecialElite',
                                    color: Colors.white
                                ),
                              ),
                            ),

                              Flexible(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left:10, right:10),
                                  child: Text(
                                    place['place'],
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontFamily: 'SpecialElite',
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      );

                  }).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:screenHeight*.03),

                    child: RaisedButton(
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page5(places:noOfPlaces),));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color:Colors.white)),
                      child: Text(
                        'Calculate Days',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Raleway'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
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
