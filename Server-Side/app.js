require('dotenv').config();
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var request = require('request');
require('body-parser-xml')(bodyParser);
var parseString = require('xml2js').parseString;
const wait=ms=>new Promise(resolve => setTimeout(resolve, ms));


app.use(bodyParser.urlencoded({extended: "false"}));
app.use(bodyParser.json());
app.use(bodyParser.xml());

var finalCities = [];
app.get('/get-cities/:state', (req, res) => {
    var stateGiven = req.params.state;
    request({
        url:'https://api.covid19india.org/state_district_wise.json',
        method: 'GET',
        // headers: 
        // {"X-CSCAPI-KEY": "NElkaEFZNlQxY3NBZ0NGaVFsVzN6a3RlUDNyblA3R3d4bDBkaEwwTA=="}
    } ,function(error,resp, body){
            if(!error && resp.statusCode == 200){
                 var body= JSON.parse(body);
            //  console.log(body[stateGiven])
            console.log(typeof(body[stateGiven]['districtData']));
           finalCities = Object.keys(body[stateGiven]['districtData']);
                    // console.log(finalCities);
                    wait((2)*1000).then(() => res.status(200).json({
                        finalCities
                    }));
        }else
        {
          res.status(200).json({
            "error" : error
        })
        }
    });
  })


  app.get('/get-place-preference', (req, res) => {
    var cityList = JSON.parse(req.query.cityList);
    var placePreference = JSON.parse(req.query.placePreference);
    var startCityState = JSON.parse(req.query.startCityState);
    console.log(startCityState[0])
    var ans =[];
    request({
      url:'https://maps.googleapis.com/maps/api/place/textsearch/xml?query='+startCityState[0]+'+in+'+startCityState[1]+'&key='+process.env.API_KEY,
      method: 'GET',
  } ,function(error,resp, body){
          if(!error && resp.statusCode == 200){
              parseString(body, function (err, result) {
                  JSON.stringify(result);
                  console.log(result);
                  if(result['PlaceSearchResponse']['status'][0] != 'ZERO_RESULTS')
                  {console.log(result['PlaceSearchResponse']['result']);
                          ans.push({'name' : result['PlaceSearchResponse']['result'][0]['name'][0],
                        'id' : result['PlaceSearchResponse']['result'][0]['place_id'][0]
                      });     
                      // console.log(ans);
              }
              })                   
      }
    else
    {
      res.status(200).json({
        "error" : error
    })
    }
  })
    cityList.forEach(city => {
        request({
            url:'https://maps.googleapis.com/maps/api/place/textsearch/xml?query=tourist_attraction+in+'+city+'&key='+process.env.API_KEY,
            method: 'GET',
        } ,function(error,resp, body){
                if(!error && resp.statusCode == 200){
                    parseString(body, function (err, result) {
                        JSON.stringify(result);
                        // console.log(result);
                        if(result['PlaceSearchResponse']['status'][0] != 'ZERO_RESULTS')
                            result['PlaceSearchResponse']['result'].forEach(place => {
                                if(findCommonElements(place['type'],placePreference))
                                ans.push({'name' : place['name'][0],
                              'id' : place['place_id'][0]
                            });
                            })
                            // console.log(ans);
                    })                   
            }
          else
          {
            res.status(200).json({
              "error" : error
          })
          }

        })
    });
    wait((5)*1000).then(() => res.status(200).json({
        ans
    }));     
  })


  app.get('/get-distance', (req, res) => {
    placeIds = JSON.parse(req.query.placeIds);
    var n=placeIds.length;
    var arr = [];
    var timearr=[];
    var visited=[];
    var result=[];
    let obj = {
      cost: 0,
  };

    for(let i = 0; i < n; i++) {
      arr[i] = [];
      timearr[i]=[];
      for(let j = 0; j < n; j++) {
          arr[i][j] = -1;
          timearr[i][j]=-1;
      }
  }
  for(i=0;i<n;i++){
    visited[i]=0;
  }
  
    for(let i = 0; i < n; i++) {
      for(let j = 0; j < n; j++) {
        if(i==j){
          arr[i][j]=0;
          timearr[i][j]=0;
        }
         else if(arr[i][j] == -1){
          myfunc(placeIds[i],placeIds[j],i,j,arr,timearr);
          
         }   
      }
  }
  wait((10)*1000).then(() =>{
    tsp(0,n,placeIds,visited,result,obj,arr,timearr);
    wait((5)*1000).then(() =>{
      // console.log(result);
      // console.log(cost);
    })  
  }).then(() => res.status(200).json({
    result:result,
    time:obj.cost
}));
  })

  function findCommonElements(arr1, arr2) {
    return arr1.some(item => arr2.includes(item))
}

  function myfunc(placeid1,placeid2,i,j,arr,timearr){
    request({
      url:'https://maps.googleapis.com/maps/api/distancematrix/json?origins=place_id:'+placeid1+'&destinations=place_id:'+placeid2+'&mode=driving&language=fr-FR&key='+process.env.API_KEY,
      method: 'GET',
  } ,function(error,resp, body){
          if(!error && resp.statusCode == 200){
               var body= JSON.parse(body);
              // console.log(body['rows'][0]['elements'][0]);
              // ans=body['rows'][0]['elements'][0]['distance']['value'];
              arr[i][j]=arr[j][i]=body['rows'][0]['elements'][0]['distance']['value'];
              timearr[i][j]=timearr[j][i]=body['rows'][0]['elements'][0]['duration']['value'];
              // console.log(arr[i][j]);
              
      }
      else
          {
            res.status(200).json({
              "error" : error
          })
          }
  })
  }

  function least(c,n,obj,arr,timearr,visited){
    var i,nc=Number.MAX_SAFE_INTEGER;
    var min=Number.MAX_SAFE_INTEGER,kmin;
    for(i=0;i<n;i++){
      if((arr[c][i]!=0)&&(visited[i]==0)){
        if(arr[c][i]<min){
          min=arr[i][0]+arr[c][i];
          kmin=timearr[c][i];
          nc=i;
        }
      }
    }
    if(min!=Number.MAX_SAFE_INTEGER){
      obj.cost+=kmin;
    }
    return nc;
  }

  function tsp(city,n,placeIds,visited,result,obj,arr,timearr){
    var ncity;
    visited[city]=1;
    result.push(placeIds[city]);
    // console.log("hello")
    ncity=least(city,n,obj,arr,timearr,visited);
  
    if(ncity==Number.MAX_SAFE_INTEGER){
      ncity=0;
      obj.cost+=timearr[city][ncity];
      // console.log(obj.cost);
      return;
    }
    tsp(ncity,n,placeIds,visited,result,obj,arr,timearr);
  }

  module.exports = app;