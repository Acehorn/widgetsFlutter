import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


var blueColorGNP =  Color.fromRGBO(51, 68, 95, 1);
var naranjaColorGNP = Color.fromRGBO(255, 107, 11, 1);
var greyColorGNP = Color.fromRGBO(206, 216, 232, 1);

var currencyMXN = NumberFormat.currency(locale: "es_MX", decimalDigits: 2, name: "" , symbol: "\u0024");



//REGEX

String emailPattern="^[a-zA-Z0-9.!#'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*";
String rfcPattern="^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1])([A-Z]|[0-9]){2}([A]|[0-9]){1})?\u0024";
