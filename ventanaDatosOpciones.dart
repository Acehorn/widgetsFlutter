import 'package:flutter/material.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/utils/constantesAutosDeducible.dart';

class PolizaSiniestroWindow extends StatefulWidget {
final String poliza;
final String siniestro;
final String nombre;
final String rfc;
final double monto;
final String status;

  PolizaSiniestroWindow({
    Key key, @required this.poliza, this.siniestro, this.nombre, this.monto, this.status, this.rfc,

  }) : super(key: key);
  PolizaSiniestroWindowState createState() => new PolizaSiniestroWindowState();
}

class PolizaSiniestroWindowState extends State<PolizaSiniestroWindow> {
  WhyFarther selection;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
  
      children: [
        SizedBox(height: 15,),
        Container(


                        decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(4),
  color: Colors.white,
     boxShadow: [
       
      BoxShadow(color: greyColorGNP, spreadRadius: 0.5),
    ], 
  ),
          height: size.height * 0.55,
          width: size.width * 0.90,
       child: Column(
  
         children: [
        //POLIZA
           Container(
              width: size.width * 0.90,
              height: size.height*0.09,
             child: Row( 
               children: [
                 Container(
                   alignment: Alignment.centerRight,
                  width: size.width * 0.25,
              height: size.height*0.09,
                 color: Colors.transparent,
                   child: Text("Póliza: ", style: TextStyle(fontSize: 20),)),
                Container(
                   alignment: Alignment.centerLeft,
                  width: size.width * 0.55,
              height: size.height*0.09,
                 color: Colors.transparent,
                   child: Text(widget.poliza, style: TextStyle(fontSize: 20),)),
                 Container(
                          alignment: Alignment.centerRight,
                  width: size.width * 0.1,
             height: size.height*0.09,
              color: Colors.transparent,
                   child: PopupMenuButton<WhyFarther>(
                    icon: Icon(Icons.more_vert, color: naranjaColorGNP,),
  onSelected: (WhyFarther result) { setState(() {  selection = result; }); },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
    const PopupMenuItem<WhyFarther>(
      value: WhyFarther.download,
      child: Text('Descargar'),
    ),
    const PopupMenuItem<WhyFarther>(
      value: WhyFarther.cfdi,
      child: Text('Solicitar CFDI'),
    ),
  ],
),
                 )
               ],
             ),
           ),

// SINIESTRO
             Container(
              width: size.width * 0.90,
              height: size.height*0.09,
               child: Row(
                 children: [
                   Container(
                              width: size.width * 0.25,
              height: size.height*0.09,
              alignment: Alignment.centerRight,
              color: Colors.transparent,
                     child: Text("Siniestro:", style: TextStyle(fontSize: 16))),
                    Container(
                            width: size.width * 0.65,
              height: size.height*0.09,
                 color: Colors.transparent,
                  alignment: Alignment.centerLeft,
                      child: Text(" "+widget.siniestro, style: TextStyle(fontSize: 16))),
                 ],
               ),
             ),
               Container(
                     width: size.width * 0.90,
              height: size.height*0.09,
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Container(
                              color: Colors.transparent,
                               width: size.width * 0.20,
                            height: size.height*0.04,
                                 alignment: Alignment.centerRight,
                           child: Text("EMITIDO A", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromRGBO(51, 68, 95, 1)),)),
                           Container(
                                     color: Colors.transparent,
                               width: size.width * 0.70,
                            height: size.height*0.04,
                           )
                       ],
                     ),
                     Row(
                       children: [
                         Container(
                              color: Colors.transparent,
                           width: size.width*0.04,
                           height: size.height*0.04,
                         ),
                         Container(
                           color: Colors.transparent,
                                  width: size.width*0.86,
                                  height: size.height*0.04,
                 alignment: Alignment.centerLeft,
                           child: Text(widget.nombre, style: TextStyle(fontSize: 14),)),
                       ],
                     ),
                   ],
                 ),
               ),
                   Container(
                     width: size.width * 0.90,
              height: size.height*0.09,
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Container(
                              color: Colors.transparent,
                               width: size.width * 0.10,
                            height: size.height*0.04,
                                 alignment: Alignment.centerRight,
                           child: Text("RFC", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromRGBO(51, 68, 95, 1)),)),
                           Container(
                                     color: Colors.transparent,
                               width: size.width * 0.80,
                            height: size.height*0.04,
                           )
                       ],
                     ),
                     Row(
                       children: [
                         Container(
                              color: Colors.transparent,
                           width: size.width*0.04,
                           height: size.height*0.04,
                         ),
                         Container(
                           color: Colors.transparent,
                                  width: size.width*0.86,
                                  height: size.height*0.04,
                 alignment: Alignment.centerLeft,
                           child: Text(widget.rfc, style: TextStyle(fontSize: 14),)),
                       ],
                     ),
                   ],
                 ),
               ),
                  Container(
                     width: size.width * 0.90,
              height: size.height*0.09,
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Container(
                              color: Colors.transparent,
                               width: size.width * 0.15,
                            height: size.height*0.04,
                                 alignment: Alignment.centerRight,
                           child: Text("MONTO", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromRGBO(51, 68, 95, 1)),)),
                           Container(
                                     color: Colors.transparent,
                               width: size.width * 0.75,
                            height: size.height*0.04,
                           )
                       ],
                     ),
                     Row(
                       children: [
                         Container(
                              color: Colors.transparent,
                           width: size.width*0.04,
                           height: size.height*0.04,
                         ),
                         Container(
                          
                           color: Colors.transparent,
                                  width: size.width*0.86,
                                  height: size.height*0.04,
                 alignment: Alignment.centerLeft,
                           child: Text(currencyMXN.format(widget.monto), style: TextStyle(fontSize: 14),)),
                       ],
                     ),
                   ],
                 ),
               ),
                     Container(
                          width: size.width*0.90,
                            height: size.height*0.05,
                       child: Row(
                       children: [
                         Container(
                             width: size.width*0.07,
                             color: Colors.transparent,
                             alignment: Alignment.centerRight,
                           child: Icon(Icons.circle, color: circleAlert(widget.status), size: 10,)),
                         Container(
                           color: Colors.transparent,
                                width: size.width*0.83,
                           child: Text(" "+widget.status)),

                       ],
                     )),
         ],
       ),
        ),
      ],
    );
  }

  circleAlert(String status){

    if (status=="Emitido"){
      return Colors.green;

    }

    return Colors.red;
  }
  
}
enum WhyFarther { download, cfdi,  }
