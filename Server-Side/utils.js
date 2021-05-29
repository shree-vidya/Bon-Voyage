var request = require('request');
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
  var i,nc=Number.MAX_SAFE_INTEGER;
  var min=Number.MAX_SAFE_INTEGER,kmin;
  for(i=0;i<n;i++){
    if((arr[c][i]!=0)&&(visited[i]==0)){
      if(arr[c][i]<min){
        min=arr[i][0]+arr[c][i];
        kmin=arr[c][i];
        nc=i;
      }
    }
  }
  if(min!=Number.MAX_SAFE_INTEGER){
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
  
  if(ncity==Number.MAX_SAFE_INTEGER){
    ncity=0;
    cost+=arr[city][ncity];
    return;
  }
  tsp(ncity,n,placeIds);
}


module.exports = { myfunc, tsp};