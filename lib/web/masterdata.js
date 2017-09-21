'use strict';

/* eslint-disable no-unused-vars, vars-on-top, quotes,prefer-arrow-callback,
no-shadow,no-irregular-whitespace,prefer-template,consistent-return*/
var pg = require('pg');
var util = require('util');
var express = require('express');

var router = express.Router();
//var xl = require('excel4node');
//var date = require('date-and-time');
//var moment = require('moment-timezone');

exports.getMasterdata = function (req, res, next) {
  var config = {
    user: process.env.USER,
    database: process.env.DATABASE,
    password: process.env.PASSWORD,
    host: process.env.HOST,
    port: process.env.DATABASE_PORT,
    idleTimeoutMillis: 30000
  };
  pg.defaults.ssl = true;
  var pool = new pg.Pool(config);

console.log ('acr');
  pool.connect(function (err, client, done) {
    if (err) throw err; 
        var query0 = client.query("BEGIN;");
        query0.on("end", function (result) {  
                var query = client.query('SELECT * from "HTSi_Owner".masterdata($1);',[req.query.date]);
                query.on("row", function (row, result) { 
                    result.addRow(row); 
                });
                query.on("end", function (result) {          
                        var mycursor = client.query("FETCH all from ref1;FETCH ALL from ref2;FETCH all from ref3;FETCH ALL from ref4;FETCH all from ref5;FETCH ALL from ref6;FETCH all from ref7;FETCH ALL from ref8;");
                        mycursor.on("end", function (result) {   
                            console.log(result.rows);
                            var query3 = client.query("COMMIT;"); 
                                query3.on("end", function () {  
                                    client.end();        
                                    //console.log(result.rows);
                                    res.writeHead(200, {'Content-Type': 'text/plain'});
                                    res.write(JSON.stringify(result.rows, null, "    ") + "\n");
                                    res.end(); 
                                });
                            });
                        });
                }); 
        });

  pool.on('error', function (err, client) {
    console.error('idle client error', err.message, err.stack);
  });
};
