const express = require('express')
const app = express()
var path = require('path');
var bodyParser = require('body-parser');
var pgp = require('pg-promise')(/*options*/)
var connection = pgp('postgres://postgres:shahabbas9@localhost:5432/postgres')
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
var jsondata = "";
request({
    url: url,
    json: true
}, function (error, response, body) {
    if (!error && response.statusCode === 200) {
        //console.log(body); // Print the json response
        jsondata = body;
         for(var i=0; i<  jsondata.length; i++)
    {
       
//values.push([jsondata[i].userId,jsondata[i].id,jsondata[i].title]);
       // console.log(jsondata[i].userId,jsondata[i].id,jsondata[i].title);
        
//Bulk insert using nested array [ [a,b],[c,d] ] will be flattened to (a,b),(c,d)
connection.query('INSERT INTO public."testTable" ("userID", "ID", "Title") VALUES($1, $2, $3)',[jsondata[i].userId,jsondata[i].id,jsondata[i].title]);
    }
    }
})


//var values = [];



app.listen(process.env.PORT || 8080, () => console.log('All is right!'))