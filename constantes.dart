import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


var blueColorGNP =  Color.fromRGBO(51, 68, 95, 1);
var naranjaColorGNP = Color.fromRGBO(255, 107, 11, 1);
var greyColorGNP = Color.fromRGBO(206, 216, 232, 1);

var currencyMXN = NumberFormat.currency(locale: "es_MX", decimalDigits: 2, name: "" , symbol: "\u0024");



//REGEX

String email="^[a-zA-Z0-9.!#'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*";
