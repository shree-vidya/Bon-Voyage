import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'page6.dart';
import 'pop_up.dart';

final List<int> hourList=[
1,2,3,4,5,6,7,8,9,10
];


int hoursPerDay;
int hoursPerPlace;
double totalDays;

class Page5 extends StatefulWidget {
  final int places;
  final int seconds;
  Page5({this.places,this.seconds});

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {

  int calculate(){
    totalDays=((widget.places*hoursPerPlace)+(widget.seconds/3600))/hoursPerDay;
    print(totalDays);
    return totalDays.round();
  }

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
                  image: AssetImage('images/page5_watercity.jpg'),
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
                      "Lets find out the duration of your trip!",
                      style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'SpecialElite',
                          color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                    height: 40.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:10, right:10),
                    child: Text(
                      "How many hours would you like to spend sightseeing per day?",
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'SpecialElite',
                          color: Colors.white
                      ),
                    ),
                  ),

                  Container(
                    width: screenWidth*0.8,
                    margin : EdgeInsets.only(top: 15,right: 10),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      value: hoursPerDay ,
                      hint: Text('Select no. of hours'),
                      items: hourList.map((hour) {
                        return DropdownMenuItem(
                          value: hour,
                          child: Text(
                            '$hour',
                          ),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => hoursPerDay = val),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          filled: true,
                          fillColor: Colors.white54,
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
                    height: 30.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left:10, right:10,top:20),
                    child: Text(
                      "How many hours would you like to spend at each place?",
                      style: TextStyle(
                          fontFamily: 'SpecialElite',
                          fontSize: 23,
                          // fontWeight: FontWeight.w100,
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth*0.8,
                    margin : EdgeInsets.only(top: 15,right: 10),
                    child: DropdownButtonFormField(
                      isExpanded: true,
                      value: hoursPerPlace ,
                      hint: Text('Select no. of hours'),
                      items: hourList.map((hour) {
                        return DropdownMenuItem(
                          value: hour,
                          child: Text(
                            '$hour',
                          ),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => hoursPerPlace = val),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          filled: true,
                          fillColor: Colors.white54,
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
                    height: 30.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top:10,bottom: 20),
                    height: screenHeight*.06,
                    child: RaisedButton(
                      color: Colors.transparent,
                      onPressed: () {
                        if( hoursPerDay == null || hoursPerPlace == null)
                          showMyDialogBox(context);
                        else
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page6(days:calculate()),));
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
          ),

        ],
      ),
    );
  }
}
