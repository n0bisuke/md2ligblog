var moment = require('moment');
var d = new Date();
// console.log(d);
// var timezone = "Asia/Tokyo";
// var current_date_jst = moment(d).tz(timezone).format('YYYY/MM/DD HH:mm:ss');
var m1 = d;
var m2 = moment();

console.log(m1);
// console.log(m1.format());

m2._d = d;
var m3 = m2.add(9, 'hour');
console.log(m2.format());
console.log(m3.format());
// function calcTime(offset){
//   var d = new Date();
//   utc = d.getTime() + (d.getTimezoneOffset() * 60000);
//   var nd = new Date(utc + (3600000 * offset));
//   return nd;
// }
//
// var bombay = calcTime(-9);
//
// console.log(bombay);
