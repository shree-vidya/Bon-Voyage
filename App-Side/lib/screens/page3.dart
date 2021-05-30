import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'page4.dart';
import 'pop_up.dart';
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

Map<String,dynamic> finalTouristSitesCheckBox = Map();
Map<String,dynamic> touristSitesNamesIds = Map();
List finalPlacesPreference = List();
Map<String,dynamic> finalTouristSitesNamesIds = Map();
var firstPoint;


class Page3 extends StatefulWidget {
  @override

  List selectedCities;
  List selectedPlacesPreference;

  List initStateCity = ['state','city'];
  var state;
  var district;
  Page3({this.selectedCities,this.selectedPlacesPreference,this.state,this.district});
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override

  void initState() {
    super.initState();
    finalPlacesPreference = [];
    finalTouristSitesNamesIds = {};
    finalTouristSitesCheckBox = {};
    widget.initStateCity[0] = widget.district;
    widget.initStateCity[1] = widget.state;
    widget.selectedPlacesPreference.forEach((element) {
      // print(element);
        if (element == 'Temple' && !finalPlacesPreference.contains('hindu_temple')) {
          finalPlacesPreference.add('hindu_temple');
        }
        else if (element == 'Amusement Parks' && !finalPlacesPreference.contains('amusement_park'))
          finalPlacesPreference.add('amusement_park');
        else if (element != 'Tourist Attractions'&& !finalPlacesPreference.contains(element.toLowerCase()))
          finalPlacesPreference.insert(0, element.toLowerCase());

    });

    fetchingRoute();
  }

  createUrlString()
  {
    String x="startCityState=[";
    widget.initStateCity.forEach((element) {
      if(widget.initStateCity.indexOf(element) != widget.initStateCity.length-1)
        x += "\"" + element +"\",";
      else
        x += "\"" + element +"\"";
    });
    x += "]&cityList=[";
    widget.selectedCities.forEach((element) {
      if(widget.selectedCities.indexOf(element) != widget.selectedCities.length-1)
        x += "\"" + element +"\",";
      else
        x += "\"" + element +"\"";
    });
    x += "]&placePreference=[";
    finalPlacesPreference.forEach((element) {
      if(finalPlacesPreference.indexOf(element) != finalPlacesPreference.length-1)
        x += "\"" + element +"\",";
      else
        x += "\"" + element +"\"";
    });
    x += "]";
    return x;
  }

  Future<void> fetchingRoute() async {
    var uri = 'https://bon-voyage1.herokuapp.com/get-place-preference?' + createUrlString();
    // print(uri);
    final response = await http.get(
        Uri.parse(uri));
    final responseJson = jsonDecode(response.body);
    setState(() {
      firstPoint = responseJson['ans'][0];
      finalTouristSitesNamesIds[firstPoint['name']] = firstPoint['id'];
      responseJson['ans'].remove(responseJson['ans'][0]);
      responseJson['ans'].forEach((item)
      {
        var name = item['name'];
        finalTouristSitesCheckBox[name] = false;
      });
      responseJson['ans'].forEach((item)
      {
        var name = item['name'];
        touristSitesNamesIds[name] = item['id'];
      });
    });

    // print(finalTouristSitesCheckBox);
    // print("hellooo");
  }
  @override
  Widget build(BuildContext context) {

    print(finalPlacesPreference);

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
              child:
              finalTouristSitesCheckBox.length == 0?
              Column(children: [
                SizedBox(height: screenHeight*.3,),
                Container(child: CircularProgressIndicator(),
                alignment:Alignment.center,),
                SizedBox(height: screenHeight*.1,)],)
                  :
              Column(
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
                      children: finalTouristSitesCheckBox.entries.map((entry)
                      {
                        return CheckboxListTile(
                          title:  Text(entry.key, style: TextStyle(fontFamily: 'SpecialElite', fontSize: 21, fontWeight: FontWeight.w600,),),
                          value: entry.value,
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          onChanged: (bool value) {
                            if(value == true) {
                            finalTouristSitesNamesIds[entry.key] = touristSitesNamesIds[entry.key];
                            }else
                            {
                              finalTouristSitesNamesIds.remove(entry.key);
                            }
                            setState(() {
                              finalTouristSitesCheckBox[entry.key] = value;
                            });
                            print(finalTouristSitesNamesIds);
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
                        print("hello");
                        print(finalTouristSitesNamesIds);
                        if(finalTouristSitesNamesIds.length == 1)
                          showMyDialogBox(context);
                        else
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page4(finalTouristSitesNamesIds:finalTouristSitesNamesIds),));
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



