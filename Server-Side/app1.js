const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var request = require('request');


app.use(bodyParser.urlencoded({extended: "false"}));
app.use(bodyParser.json());

app.get('/get-cities/:state', (req, res) => {
    const state = req.params.state;
    request({
        url:'https://api.countrystatecity.in/v1/countries/IN/states/'+state+'/cities',
        method: 'GET',
        headers: 
        {"X-CSCAPI-KEY": "NElkaEFZNlQxY3NBZ0NGaVFsVzN6a3RlUDNyblA3R3d4bDBkaEwwTA=="}
    } ,function(error,resp, body){
            if(!error && resp.statusCode == 200){
                 var body= JSON.parse(body);
        
                res.status(200).json({
                body
            });
        }
    }) .catch(err => {
        console.log(err)
        res.status(500).json({
            error: err
        })
    })
  });


  app.get('/get-place-preference', (req, res) => {
    var arr = JSON.parse(req.query.array);
    console.log(arr);
    res.send("success");
  });

  module.exports = app;