const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var request = require('request');
const wait=ms=>new Promise(resolve => setTimeout(resolve, ms));

app.use(bodyParser.urlencoded({extended: "false"}));
app.use(bodyParser.json());

var ans;
var placeIds=[];
var arr = [];
var visited=[];
var result=[];
var cost=0;


app.get('/get-distance', (req, res) => {
    placeIds = JSON.parse(req.query.placeIds);
    console.log(placeIds)
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

            res.status(200).json({
                result
            })
  })

  module.exports = app;