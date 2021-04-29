
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import 'Models/pagoPolizaCFDI.dart';
import 'package:http/http.dart' as http;


//GET SIMPLE
Future<PagoPolizaCfdi> getPagoCFDI() async {
    var headers = {
      "Content-Type": "application/json",
      "Authorization": sessionToken
    };

    final url = "https://us-central1-gnp-soycliente.cloudfunctions.net/pagoDeducibleAuto/detallePago?codSiniestro=0037562899";
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final pagoPendienteCFDI = new PagoPolizaCfdi.fromJson(decodedData);
    print(pagoPendienteCFDI);
    return pagoPendienteCFDI;
  
  }
