const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var request = require('request');

var result={
  "ans": [
      {
          "name": "Sri Chamarajendra Zoological Gardens",
          "id": "ChIJlXcOBCNwrzsRy79sy0wzV-o"
      },
      {
          "name": "Mysuru Rail Museum",
          "id": "ChIJ0zzdpXVwrzsRSsTggeRbyzE"
      },
      {
          "name": "Mysore Sand Sculpture Museum",
          "id": "ChIJpfe0LipwrzsRMSBPsnzs9Kk"
      },
      {
          "name": "Regional Museum of Natural History Mysore",
          "id": "ChIJM2ikQZ16rzsR05jLoAu4bPg"
      },
      {
          "name": "Folklore Museum",
          "id": "ChIJNbbbd5Z6rzsREcdCXBECuZg"
      },
      {
          "name": "Aadumalleshwara",
          "id": "ChIJGQfPHzl0ujsRXks3TtLntTY"
      },
      {
          "name": "Sri Maharshi Valmiki Museum",
          "id": "ChIJCWxqdld0ujsRhh1vrVRJv9M"
      },
      {
          "name": "Bangalore Palace",
          "id": "ChIJN1ZKKUkWrjsRzxIVM363-LE"
      },
      {
          "name": "HAL Heritage Centre and Aerospace Museum",
          "id": "ChIJg2Ir7MMTrjsR9kqAcrWsFew"
      },
      {
          "name": "Indian Military Museum",
          "id": "ChIJXx3q3WsWrjsR_Qw3odPlMXM"
      }
  ]
};

// console.log(result['ans']);

function myfunc(item){
  // console.log('place_id:'+item['id']+'|');
  return "place_id:"+item['id']+"|";
}
// console.log(result['ans'].forEach(myfunc));
// result['ans'].forEach(myfunc)

var n=result['ans'].length;
var arr = [];
for(let i = 0; i < n; i++) {
    arr[i] = [];
    for(let j = 0; j < n; j++) {
        arr[i][j] = -1;
    }
}

app.use(bodyParser.urlencoded({extended: "false"}));
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.send('Hello World!')
  });
  app.get('/get-distance', (req, res) => {
    const state = req.params.state;
    for(let i = 0; i < n; i++) {
      for(let j = 0; j < n; j++) {
          if(arr[i][j] == -1){
            request({
              url: 'https://maps.googleapis.com/maps/api/distancematrix/json?origins=place_id:ChIJ74XAbuL8DDkR-wJQ-vQyHkQ|place_id:ChIJDwI0rC13dDkRs9I9GN3k9Yc|place_id:ChIJbf8C1yFxdDkR3n12P4DkKt0&destinations=place_id:ChIJ74XAbuL8DDkR-wJQ-vQyHkQ|place_id:ChIJDwI0rC13dDkRs9I9GN3k9Yc|place_id:ChIJbf8C1yFxdDkR3n12P4DkKt0&mode=driving&language=fr-FR&key=AIzaSyCS90XB-jQMIhQbA2C9vzfWKETNaxpjWJo',
              // url:'https://maps.googleapis.com/maps/api/distancematrix/json?origins='+result['ans'].forEach(myfunc)+'&destinations='+result['ans'].forEach(myfunc)+'&mode=driving&language=fr-FR&key=AIzaSyCS90XB-jQMIhQbA2C9vzfWKETNaxpjWJo',
              method: 'GET',
          } ,function(error,resp, body){
                  if(!error && resp.statusCode == 200){
                       var body= JSON.parse(body);
              
                      res.status(200).json({
                      body
                  });
              }
          })
          arr[i][j]=arr[j][i]=0;
          }
      }
  }
    
  })

  module.exports = app;