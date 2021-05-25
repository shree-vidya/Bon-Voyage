import 'package:flutter/material.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override

  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body:  Stack(
        children: <Widget>[

          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/page1_road.jpg'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.4),
          ),
          Container(
            margin: EdgeInsets.only(top:screenHeight*.45),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      'Bon Voyage',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 80.0,
                          fontFamily : 'Ariana-Violeta',
                          // fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:screenHeight*.03),

                  child: RaisedButton(
                    color: Colors.transparent,
                onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => Page2(),));
                },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color:Colors.white)),
                    child: Text(
                      'Get Started!',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Raleway'),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
