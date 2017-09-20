'use strict';

var _express = require('express');

var _express2 = _interopRequireDefault(_express);

var _cirrusAuthModule = require('cirrus-auth-module');

var _cirrusAuthModule2 = _interopRequireDefault(_cirrusAuthModule);

var _test = require('../server-controllers/test');

var _test2 = _interopRequireDefault(_test);

// var _index = require('../web/index');
//
// var _index2 = _interopRequireDefault(_index);

var _masterdata = require('../web/masterdata');

var _masterdata2 = _interopRequireDefault(_masterdata);

// var _other = require('../web/other');
//
// var _other2 = _interopRequireDefault(_other);
//
// var _LesionManagement = require('../web/LesionManagement');
//
// var _LesionManagement2 = _interopRequireDefault(_LesionManagement);
//
// var _report = require('../web/report');
//
// var _report2 = _interopRequireDefault(_report);
//

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

// Importing authentication flow
var router = _express2.default.Router();

// authenticate our router

/* eslint-disable no-unused-vars */
_cirrusAuthModule2.default.authenticate(router);
console.log("check");



router.get('/getMasterdata', function (req, res, next) {
  console.log("getMasterdata");
_masterdata2.default.getMasterdata(req, res, next);
});

//other module


// router.get('/addNewmarket', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.addNewmarket(req, res, next);
// });
//
// router.get('/getmarkettypelist', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.getmarkettypelist(req, res, next);
// });
// //check
// router.get('/getmarkettypelist', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.getmarkettypelist(req, res, next);
// });
//
//
// router.get('/editmarkettypebyid', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.editmarkettypebyid(req, res, next);
// });
//
//
//
// router.get('/addnewmanufacturers', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.addnewmanufacturers(req, res, next);
// });
//
// router.get('/getmanufacturerlist', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.getmanufacturerlist(req, res, next);
// });
//
// router.get('/getmanufacturerlistbyid', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.getmanufacturerlistbyid(req, res, next);
// });
//
// router.get('/editmanufacturerbyid', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.editmanufacturerbyid(req, res, next);
// });
//
// router.get('/addtargetweight', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.addtargetweight(req, res, next);
// });
//
// router.get('/gettargetweightrangelist', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.gettargetweightrangelist(req, res, next);
// });
//
// router.get('/gettargetweightrangelistbyid', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.gettargetweightrangelistbyid(req, res, next);
// });
//
// router.get('/gettargetweightrangelist', function (req, res, next) {
//   console.log("Mike testing");
// _other2.default.gettargetweightrangelist(req, res, next);
// });
//
// //lesion module
//
// router.get('/getlesionnamelist', function (req, res, next) {
//   console.log("Mike testing");
// _LesionManagement2.default.getlesionnamelist(req, res, next);
// });
//
//
//
//
//
// router.get('/addlesions', function (req, res, next) {
//   console.log("Mike testing");
// _LesionManagement2.default.addlesions(req, res, next);
// });
//
// router.get('/editlesionbyid', function (req, res, next) {
//   console.log("Mike testing");
// _LesionManagement2.default.editlesionbyid(req, res, next);
// });
//
//
// router.get('/getlesiongroupname', function (req, res, next) {
//   console.log("Mike testing");
// _LesionManagement2.default.getlesiongroupname(req, res, next);
// });
//
// router.get('/getlisionlist', function (req, res, next) {
//   console.log("Mike testing");
// _LesionManagement2.default.getlisionlist(req, res, next);
// });
//
// router.get('/getaffliateslist', function (req, res, next) {
//   console.log("Mike testing");
// _LesionManagement2.default.getaffliateslist(req, res, next);
// });
//
//
// router.get('/getlesionbyaffliatename', function (req, res, next) {
//   console.log("Mike testing");
// _LesionManagement2.default.getlesionbyaffliatename(req, res, next);
// });
//
// router.get('/getcoustomerlists', function (req, res, next) {
//   console.log("Mike testing");
// _report2.default.getcoustomerlists(req, res, next);
// });
//
// router.get('/getcoustomerlocationlists', function (req, res, next) {
//   console.log("Mike testing");
// _report2.default.getcoustomerlocationlists(req, res, next);
// });



console.log("dsfjdjks");
module.exports = router;
