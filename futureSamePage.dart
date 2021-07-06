import 'package:flutter/material.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Providers/Models/pagoPolizaCFDI.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Providers/Models/siniestroPendientes.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Providers/providersCFDI.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/Widgets/textoIconoBoton.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/datosPagoDeducible.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/utils/constantesAutosDeducible.dart';
import 'package:gnp_movil/Utils/AppColors.dart';

class CardSeguimientoSiniestro extends StatefulWidget {
  final String numeroPoliza;
  final String codSiniestroPadre;
  final String status;
  final GestureTapCallback onPressed;
  final String color;
  final String fechaSiniestro;


  CardSeguimientoSiniestro(
      {@required this.numeroPoliza,
      @required this.codSiniestroPadre,
      @required this.status,
      @required this.color,
      @required this.fechaSiniestro,
      @required this.onPressed});

  @override
  _CardSeguimientoSiniestroState createState() => _CardSeguimientoSiniestroState();
}

class _CardSeguimientoSiniestroState extends State<CardSeguimientoSiniestro> {
Future<SiniestrosPendientes> post;
  @override
  void initState() { 
    super.initState();
    post = pendientePagoSiniestro(widget.codSiniestroPadre);
  }
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
        onTap: this.widget.onPressed,
        child: Card(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 24),
          elevation: 4,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               
             cintilloSiniestroPendiente(context, widget.codSiniestroPadre),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text("Póliza: ${widget.numeroPoliza}",
                      style: TextStyle(
                        color: AppColors.gnpTextSystem,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 0.15,
                        height: 2,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    children: [
                      Text("Siniestro:",
                        style: TextStyle(
                          fontFamily: "Open Sans",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: AppColors.gnpTextSystem,
                        )),
                      SizedBox(width: 5.0,),
                      Text("${widget.codSiniestroPadre}",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: 0.15,
                          color: AppColors.gnpTextSystem,
                      )),
                    ],
                  )),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                   child: Column(
                     children: [
                     Text("FECHA DE OCURRENCIA",
                       style: TextStyle(
                         fontFamily: "Roboto",
                         fontStyle: FontStyle.normal,
                         fontWeight: FontWeight.w500,
                         fontSize: 10,
                         height: 1.6,
                         letterSpacing: 1.5,
                         color: AppColors.gnpTextSystem,
                     )),
                    Text("${widget.fechaSiniestro}".replaceAll("-", "/"),
                       style: TextStyle(
                         fontFamily: "Roboto",
                         fontStyle: FontStyle.normal,
                         fontWeight: FontWeight.normal,
                         fontSize: 12,
                         height: 1.5,
                         letterSpacing: 0.4,
                         color: AppColors.gnpTextSystem2,
                     )),
                     ],
                     crossAxisAlignment: CrossAxisAlignment.start
                   ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 7),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 6, 0, 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: "${widget.color}".contains("V")
                                      ? AppColors.stateVali
                                      : "${widget.color}".contains("A")
                                      ?AppColors.primary700
                                      :AppColors.secondary600,
                                  shape: BoxShape.circle)),
                          Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text("${widget.status}",
                                style: TextStyle(
                                  fontFamily: "Open Sans",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  height: 1.6,
                                  letterSpacing: 0.4,
                                  color: AppColors.gnpTextSystem2,
                                )),
                          ),
                        ]))
              ]),
        ));
  }

cintilloSiniestroPendiente(context, String siniestro)    {
print(post.toString());
bool pendienT=true;

return FutureBuilder<SiniestrosPendientes>(
            future: post,
            builder: (context, snapshot) {
              if(snapshot.hasData){
  if (snapshot.data.siniestros[0].estatus=="Por Pagar") {
                return Container(
    height: 50,
    margin: EdgeInsets.only(bottom: 5, top: 5),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(8),
      topLeft: Radius.circular(8)
    ),
  color: yellowColorGNP,
    
  ),// width: size.width*0.90,
            child: ListTile(
    // tileColor: Colors.red,
   leading: Icon(Icons.warning_amber_outlined, color: Color.fromRGBO(236, 183, 65, 1),),
    title: Text("SINIESTRO PENDIENTE\nDE PAGO DEDUCIBLE",style: TextStyle(fontSize: 10,)),
     trailing: GestureDetector(
     onTap: () async {
    
    showLoaderCfdi(context);
var providerC = await getPagoCFDI(context,siniestro);

    if(providerC!=null){
 hideLoaderCfdi(context);
    Navigator.push(context,MaterialPageRoute(builder: (context) => DatosPagoDeducible(

        pagoPoliza: providerC,
      )),); 
    //  hideLoaderCfdi(context);
    } else{
       hideLoaderCfdi(context);
      showAlertCustomCFDI(context: context, message: "No es posible realizar este procedimiento por el momento, favor de intentar mas tarde", textButtonOK: "Aceptar", title: "Servicio no disponible");
    } 


                                      },
      child: Text("Ver más", style: TextStyle(
      color: naranjaColorGNP,
    decoration: TextDecoration.underline,
                                      ),),
                                    ),
                                  ),

                               );
              } else{
                return Container();
              }
              }
            else if (snapshot.hasError) {
                return Container();
              }

             
              return Container();
            },
          );
}
}


progressIndc(context){

   showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          color: Colors.transparent,
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,

          ),
        ),
      );
    },
  );
  Navigator.pop(context);
    
}




