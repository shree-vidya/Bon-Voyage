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
  })

  function findCommonElements(arr1, arr2) {
    return arr1.some(item => arr2.includes(item))
}

  app.get('/get-place-preference', (req, res) => {
    // var arr = JSON.parse(req.query.array);
    // console.log(arr);
    var cityList = JSON.parse(req.query.cityList);
    var placePreference = JSON.parse(req.query.placePreference);
    var ans =[];
    cityList.forEach(city => {
        request({
            url:'https://maps.googleapis.com/maps/api/place/textsearch/xml?query=tourist_attraction+in+'+city+'&key=AIzaSyCS90XB-jQMIhQbA2C9vzfWKETNaxpjWJo',
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
                            console.log(ans);
                    })                   
            }
        })
    });
    wait((5)*1000).then(() => res.status(200).json({
        ans
    }));     
  })

  module.exports = app;