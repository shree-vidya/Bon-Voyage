import 'package:flutter/material.dart';
import 'page5.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
List names = List();
List ids = List();
int time;

class Page4 extends StatefulWidget {
  Map<String,dynamic> finalTouristSitesNamesIds;
  Page4({this.finalTouristSitesNamesIds});
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override

  void initState(){
    super.initState();
    names=[];
    ids=[];
    // print(widget.finalTouristSitesNamesIds.keys);
    // print(widget.finalTouristSitesNamesIds.values);
    widget.finalTouristSitesNamesIds.forEach((key, value) {
      // names.add(key);
      ids.add(value);
    });
    ids.forEach((element) {
      print(element);
    });
    fetchingDistance();
  }

  createUrlString()
  {
    String x="placeIds=[";
    ids.forEach((element) {
      if(ids.indexOf(element) != ids.length-1)
        x += "\"" + element +"\",";
      else
        x += "\"" + element +"\"";
    });
    x += "]";
    return x;
  }

  Future<void> fetchingDistance() async {
    var uri = 'https://bon-voyage1.herokuapp.com/get-distance?' + createUrlString();
    // print(uri);
    final response = await http.get(
        Uri.parse(uri));
    final responseJson = jsonDecode(response.body);
    setState(() {
      print(responseJson);
      // print("heyyyyyy");
      // print(responseJson['time']);
      responseJson['result'].forEach((item) {
        var id = item;
        widget.finalTouristSitesNamesIds.forEach((key, value) {
          if(value==item){
            names.add(key);
          }
        });
      });
      time=responseJson['time'];
      // print(time);
      print(names.length);
      print(names[0]);
      names.remove(names[0]);
      for(int i=0;i<names.length;i++){
        print(names[i]);
      }
    });
  }
// CAPF Personnel
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,

      body:
      Stack(
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
            margin: EdgeInsets.only(top:screenHeight*.2,left:20,right:20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:10, right:10),
                    child: Text(
                      "Your plan for the trip (Places to visit in order)",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'SpecialElite',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  names.length == 0?
                  Column(children: [
                    SizedBox(height: screenHeight*.15,),
                    Container(child: CircularProgressIndicator(),
                      alignment:Alignment.center,),
                    SizedBox(height: screenHeight*.1,)],)
                      :
                  Container(
                    margin: EdgeInsets.only(left:10, right:10,top:10),
                    decoration:BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: .3, color: Colors.white),
                      ),
                      color: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: names.map((place){
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left:10, right:20),
                              child: Text(
                                  (names.indexOf(place)+1).toString(),
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
                                    place,
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
                  names.length == 0?
                  Column(children: [
                    SizedBox(height: screenHeight*.001,),],)
                      :
                  Container(
                    margin: EdgeInsets.only(top:10,bottom: 20),
                    height: screenHeight*.06,
                    child: RaisedButton(
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page5(places: names.length,seconds: time),));
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
                    height: 20.0,
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
