const express = require('express')
const app = express()
var path = require('path');
var bodyParser = require('body-parser');
var pgp = require('pg-promise')(/*options*/)
var connection = pgp('postgres://username:password@host:port/database')
var request = require("request")

app.use(express.static('public'))


//Parse data from JSON POST and insert into MYSQL



//Establish MySQL connection
connection.connect(function(err) {
   if (err) 
      throw err
   else {
       console.log('Connected to MySQL');
       // Start the app when connection is ready
       app.listen(3000);
       console.log('Server listening on port 3000');
 }
});
//http://www.opentechguides.com/how-to/article/nodejs/124/express-mysql-json.html
var url = "https://jsonplaceholder.typicode.com/albums"

request({
    url: url,
    json: true
}, function (error, response, body) {
console.log(error, response, body)
    if (!error && response.statusCode === 200) {
        console.log(body) // Print the json response
    }
})

var jsondata = request.body;
var values = [];

for(var i=0; i< jsondata.length; i++)
  values.push([jsondata[i].userId,jsondata[i].id,jsondata[i].title]);

//Bulk insert using nested array [ [a,b],[c,d] ] will be flattened to (a,b),(c,d)
connection.query('INSERT INTO testTable (userID, ID, Title) VALUES ?', [values], function(err,result) {
  if(err) {
     res.send('Error');
  }
 else {
     res.send('Success');
  }
});


app.listen(process.env.PORT || 8080, () => console.log('All is right!'))