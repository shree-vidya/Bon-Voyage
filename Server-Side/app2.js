const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var request = require('request');
const wait=ms=>new Promise(resolve => setTimeout(resolve, ms));

var ans;
var placeIds=[];
var arr = [];
var visited=[];
var result=[];
var cost=0;
// console.log(result['ans']);
function myfunc(placeid1,placeid2,i,j){
  request({
    // url: 'https://maps.googleapis.com/maps/api/distancematrix/json?origins=place_id:ChIJ74XAbuL8DDkR-wJQ-vQyHkQ|place_id:ChIJDwI0rC13dDkRs9I9GN3k9Yc|place_id:ChIJbf8C1yFxdDkR3n12P4DkKt0&destinations=place_id:ChIJ74XAbuL8DDkR-wJQ-vQyHkQ|place_id:ChIJDwI0rC13dDkRs9I9GN3k9Yc|place_id:ChIJbf8C1yFxdDkR3n12P4DkKt0&mode=driving&language=fr-FR&key=AIzaSyCS90XB-jQMIhQbA2C9vzfWKETNaxpjWJo',
    url:'https://maps.googleapis.com/maps/api/distancematrix/json?origins=place_id:'+placeid1+'&destinations=place_id:'+placeid2+'&mode=driving&language=fr-FR&key=AIzaSyCS90XB-jQMIhQbA2C9vzfWKETNaxpjWJo',
    method: 'GET',
} ,function(error,resp, body){
        if(!error && resp.statusCode == 200){
             var body= JSON.parse(body);
            // console.log(body['rows'][0]['elements'][0]);
            // ans=body['rows'][0]['elements'][0]['distance']['value'];
            arr[i][j]=arr[j][i]=body['rows'][0]['elements'][0]['distance']['value'];
            // console.log(arr[i][j]);
            
    }
})
}

function least(c,n){
  var i,nc=999;
  var min=999,kmin;
  for(i=0;i<n;i++){
    if((arr[c][i]!=0)&&(visited[i]==0)){
      if(arr[c][i]<min){
        min=arr[i][0]+arr[c][i];
        kmin=arr[c][i];
        nc=i;
      }
    }
  }
  if(min!=999){
    cost+=kmin;
  }
  return nc;
}
function tsp(city,n,placeIds){
  var ncity;
  visited[city]=1;
  result.push(placeIds[city]);
  // console.log("hello")
  ncity=least(city,n);
  if(ncity==999){
    ncity=0;
    cost+=arr[city][ncity];
    return;
  }
  tsp(ncity,n,placeIds);
}


app.use(bodyParser.urlencoded({extended: "false"}));
app.use(bodyParser.json());

// app.get('/', (req, res) => {
//   console.log(req.query)
//     res.send('Hello World!')
//   });
  app.get('/get-distance', (req, res) => {
    placeIds = JSON.parse(req.query.placeIds);
    var n=placeIds.length;
    for(let i = 0; i < n; i++) {
      arr[i] = [];
      for(let j = 0; j < n; j++) {
          arr[i][j] = -1;
      }
  }
  for(i=0;i<n;i++){
    visited[i]=0;
  }
  
    for(let i = 0; i < n; i++) {
      for(let j = 0; j < n; j++) {
        if(i==j){
          arr[i][j]=0;
        }
         else if(arr[i][j] == -1){
          myfunc(placeIds[i],placeIds[j],i,j);
          // arr[i][j]=arr[j][i]=ans;
          
         }   
          // arr[i][j]=arr[j][i]=0;
  //         }
      }
  }
  wait((10)*1000).then(() =>{
    tsp(0,n,placeIds);
    wait((10)*1000).then(() =>{
      console.log(result);
    })  
  }).then(() => res.status(200).json({
    result
}));
  })

  module.exports = app;