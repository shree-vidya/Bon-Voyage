const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var request = require('request');


app.use(bodyParser.urlencoded({extended: "false"}));
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.send('Hello World!')
  });
  app.get('/get-distance', (req, res) => {
    const state = req.params.state;
    request({
        url:'https://maps.googleapis.com/maps/api/distancematrix/json?origins=Red+Fort&destinations=Taj+Mahal&mode=driving&language=fr-FR&key=AIzaSyCS90XB-jQMIhQbA2C9vzfWKETNaxpjWJo',
        method: 'GET',
    } ,function(error,resp, body){
            if(!error && resp.statusCode == 200){
                 var body= JSON.parse(body);
        
                res.status(200).json({
                body
            });
        }
    })
  })

  module.exports = app;