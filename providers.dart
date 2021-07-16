
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

//EJEMPLO DE POST
      Future<CorreoComprobanteCfdi>  notificacionCorreoComprobante(String pdf, String codSiniestro, String authCode, BuildContext context) async {
    // QA var pruebaPolia = '00000311614515';
    // UAT var pruebaPolia = '10071404997817';
    var config = AppConfig.of(context); //CONFIG DE APPS DE GNP
    var user = FirebaseAuth.instance.currentUser;
    var sessionToken = await user.getIdToken(true);
   // var bodyTratamientos = PagoPolizaCfdi(poliza: numPoliza);
    var headers = {
    "Content-Type": "application/json",
      "Authorization": sessionToken
    }; 

    showLoaderCfdi(context);
    final url = config.baseCloudFunctions+"/pagoDeducibleAuto/notificar-comprobante"; //aqui va una url normal y corriente

final msg = jsonEncode({	
      "codSiniestro": codSiniestro,
    "authorizationCode": authCode,
  "pdfComprobante": pdf
  
  
  });
    final resp = await http.post(
  
                     url,
               headers: headers,
             body: msg,
            );

  
    final decodedData = json.decode(resp.body);
    final notificacion = new CorreoComprobanteCfdi.fromJson(decodedData);
 /*    if(siniestroPendiente.siniestros[0].estatus=="Por Pagar"){
     return siniestroPendiente;
    } */
    print(notificacion);
    hideLoaderCfdi(context);
    return notificacion;
  }


//EJEMPLO DE GET

      Future<DatosFiscalesCfdi>  datosFiscalesCfdi(BuildContext context, String poliza) async {
    // QA var pruebaPolia = '00000311614515';
    // UAT var pruebaPolia = '10071404997817';
   var config = AppConfig.of(context); //CONFIG DE GNP
  showLoaderCfdi(context);
    var user = FirebaseAuth.instance.currentUser;
    var sessionToken = await user.getIdToken(true);
   // var bodyTratamientos = PagoPolizaCfdi(poliza: numPoliza);
    var headers = {
    "Content-Type": "application/json",
      "Authorization": sessionToken
    }; 


    final url = config.baseCloudFunctions+"/pagoDeducibleAuto/datosFiscales?poliza=$poliza"; //URL NORMAL


    final resp = await http.get(
                    
                     url,
               headers: headers,
      
            );

  
   
    print(resp.statusCode);
          if(resp.body.isEmpty){
              hideLoaderCfdi(context);
return null;
    }  else{
       final decodedData = json.decode(resp.body);
           if(resp.statusCode==200){
      hideLoaderCfdi(context);
    final datosFiscales = new DatosFiscalesCfdi.fromJson(decodedData);
 /*    if(siniestroPendiente.siniestros[0].estatus=="Por Pagar"){
     return siniestroPendiente;
    } */
    print(datosFiscales);

    return datosFiscales;
    } 
    }


      hideLoaderCfdi(context);
 return null;

  }
