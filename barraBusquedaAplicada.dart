import 'package:flutter/material.dart';
import 'package:gnp_movil/PagoPolizaModule/ExraViews/ImporteView.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Commons/polizasSiniestroVentana.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/generar_cfdi.dart';
import 'package:gnp_movil/Utils/AppColors.dart';
import 'package:gnp_movil/UtilsPagos/AllFormField.dart';

import 'Commons/CuadrosDatosAutos.dart';
import 'Commons/TitulosText.dart';
import 'Commons/barraBusquedaAutos.dart';
import 'Commons/buttonDescargaArchivo.dart';
import 'utils/constantesAutosDeducible.dart';

class AutosCFDIPage extends StatefulWidget {
  AutosCFDIPage({Key key}) : super(key: key);

  @override
  _AutosCFDIPageState createState() => _AutosCFDIPageState();
}

class _AutosCFDIPageState extends State<AutosCFDIPage> {

List <UsuariosPrueba> list = [
  UsuariosPrueba(
"Emitido", "Luis Castillo", "00002", "ACDC3234", 232323323 ,"345345677"
  ),
    UsuariosPrueba(
"Emitido", "Fernando Valenzuela", "00003", "SDFWEF", 232323323, "456546456"
  ),
    UsuariosPrueba(
"No Emitido", "Yur Vak", "00004", "324234234", 232323323, "23423423454"
  ),
  UsuariosPrueba(
"Emitido", "Luis Castillo", "4354356435", "ACDC3234", 232323323 ,"345345677"
  ),
    UsuariosPrueba(
"Emitido", "Fernando Valenzuela", "546456546234", "SDFWEF", 232323323, "456546456"
  ),
    UsuariosPrueba(
"No Emitido", "Yur Vak", "4354523434", "FSDFDSVEASDR", 232323323, "23423423454"
  ),
    UsuariosPrueba(
"Emitido", "Jose Canuto", "34643534534", "ACDC3234", 232323323 ,"345345677"
  ),
    UsuariosPrueba(
"Emitido", "Fernando Valenzuela", "546456546234", "SDFWEF", 232323323, "456546456"
  ),
    UsuariosPrueba(
"No Emitido", "Yur Vak", "4354523434", "FSDFDSVEASDR", 232323323, "23423423454"
  ),

];

List <UsuariosPrueba> listFilter = [];
String busqueda ="";
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Text(
          "Autos", style: TextStyle(color: blueColorGNP),
        ),

         iconTheme:IconThemeData(
          color: Colors.orange

        ) ,
      ),
      body:  SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
                height: size.height*0.99,
          width: size.width*0.99,
            child: Column(
     
                children: [
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.center,
                     color: Colors.transparent,
                    height: size.height*0.07,
                    child: Text("Consulta tus trámites en procesos y finalizados ", style: TextStyle(fontSize: 14),),),
                 Container(
                   alignment: Alignment.center,
                   color: Colors.transparent,
                   height: size.height*0.11,
                   child: BarraBusquedaAutos(
                      onChanged: (String value){
                        setState(() {
                          
                        });
                  
                      busqueda=value;
                         for (var i = 0; i < list.length; i++) {
                            if(list[i].poliza.startsWith(value)){  
                              if(!listFilter.contains(list[i])){
                                 listFilter.add(list[i]);
                              }
                              
                            } else{
                              listFilter.remove(list[i]);
                            }
                            
                         }
                         if(value==""){
                           listFilter.clear();
                          busqueda="";
                         }

                      },
                      onChanged2: (String value){
                        setState(() {
                          
                        });
                     
                        busqueda=value;
                          for (var i = 0; i < list.length; i++) {
                            if(list[i].siniestro.startsWith(value)){  
                              if(!listFilter.contains(list[i])){
                                 listFilter.add(list[i]);
                              }
                              
                            } else{
                              listFilter.remove(list[i]);
                            }
                            
                         }
                         if(value==""){
                           listFilter.clear();
                          busqueda="";
                         }
                      },
                      onChanged3: (String value){
                          setState(() {
                          
                        });
                        print("HOLA3"+value);
                              busqueda=value;
                          for (var i = 0; i < list.length; i++) {
                            if(list[i].nombre.startsWith(value)){  
                              if(!listFilter.contains(list[i])){
                                 listFilter.add(list[i]);
                              }
                              
                            } else{
                              listFilter.remove(list[i]);
                            }
                            
                         }
                         if(value==""){
                           listFilter.clear();
                          busqueda="";
                         }
                      },
                   ),
                 ), 

SizedBox(
  height: size.height*0.65,
  child:   Container(
    
  height: size.height*0.65,
    child:   
  listFilter.isEmpty && busqueda=="" ?  ListView.builder(  
            
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                   itemCount: list.length,
                        itemBuilder: (context, index) {
                           return   PolizaSiniestroWindow(
                           poliza: list[index].poliza,
                            siniestro: list[index].siniestro,
                            monto: list[index].monto,
                            nombre: list[index].nombre,
                            status: list[index].status,
                            rfc: list[index].rfc,
                         );
                        }
          ) : ListView.builder(  
            
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                   itemCount: listFilter.length,
                        itemBuilder: (context, index) {
                           return   PolizaSiniestroWindow(
                           poliza: listFilter[index].poliza,
                            siniestro: listFilter[index].siniestro,
                            monto: listFilter[index].monto,
                            nombre: listFilter[index].nombre,
                            status: listFilter[index].status,
                            rfc: listFilter[index].rfc,
                         );
                        }
          )
        ),
  ),

  
               
  
                ],
              ),
          ),
      ),
      );
   

  }
}


Widget importeRow(BuildContext context) {
  return Container(
      height: 40,
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(children: [
        Expanded(
            child: Text(
                //this.importe ?? "",
                "\u0024 123,332.43" ?? "",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 34,
                    letterSpacing: 0.25,
                    color: AppColors.primary700)))
      ]));
}

Widget bottomLine() {
  return Container(
      margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
      height: 2,
      color: AppColors.gnpBackLight2);
}

Widget subtitleRow(BuildContext context) {
  return Container(
      height: 24,
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        circleView(),
        SizedBox(width: 8),
        Text(
            // estatusPago(this.estatus),
            estatusPago(EstatusPago.Pendiente),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5.copyWith(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                letterSpacing: 0.25,
                color: AppColors.gnpTextSystem2))
      ]));
}

Widget circleView() {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          // color: colorEstatus(this.estatus)),
          color: colorEstatus(EstatusPago.Pendiente)),
      width: 8,
      height: 8);
}

String estatusPago(EstatusPago estatus) {
  switch (estatus) {
    case EstatusPago.Pagado:
      return "Pagado";
    case EstatusPago.Pendiente:
      return "Pendiente de pago";
    default:
      return "";
  }
}

HexColor colorEstatus(EstatusPago estatus) {
  switch (estatus) {
    case EstatusPago.Pagado:
      return AppColors.stateVali;
    case EstatusPago.Pendiente:
      return AppColors.gnpStateAlert;
    default:
      return AppColors.gnpStateAlert;
  }
}
