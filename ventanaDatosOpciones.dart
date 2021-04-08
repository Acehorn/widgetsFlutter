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
    borderRadius: BorderRadius.circular(8),
  color: Colors.white,
     boxShadow: [
       
      BoxShadow(color: Colors.black12, spreadRadius: 1.9),
    ], 
  ),
          height: size.height * 0.40,
          width: size.width * 0.90,
       child: Column(
  
         children: [
        //POLIZA
             Container(
               
                           width: size.width * 0.80,
                           color: Colors.transparent,
              height: size.height*0.04,
                      child:  ListTile(

                      trailing:    Container(
                  alignment: Alignment.centerRight,
              width: size.width*0.04,
              
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
                 ),
                        title: Row(
                          children: [
                 Container(
                                   alignment: Alignment.centerLeft,
              width: size.width*0.2,
              height: size.height*0.09, 
              color: Colors.transparent,  
                              child: Text("Póliza: ", style: TextStyle(fontSize: 20, color: Color.fromRGBO(51, 68, 95, 1)))),
                            Container(
                                width: size.width*0.4,
              height: size.height*0.09, 
                              // height: size.height*0.04,
                              child: Text(widget.poliza, style: TextStyle(fontSize: 20, color: Color.fromRGBO(51, 68, 95, 1), fontWeight: FontWeight.bold))),
                          /*      Container(
                   alignment: Alignment.centerLeft,
              width: size.width*0.3,
              height: size.height*0.09, 

                 color: Colors.blue,
                   child: Text(widget.poliza, style: TextStyle(fontSize: 20),)), */


              
                          ],
                        ),
                    ),
                    ),
        
        

// SINIESTRO
             Container(
                           width: size.width * 0.80,
                           color: Colors.transparent,
              height: size.height*0.04,
                      child:  ListTile(

                       
                        title: Row(
                          children: [
                 Container(
                              // height: size.height*0.04,
                              child: Text("Siniestro: ", style: TextStyle(fontSize: 16, color: Color.fromRGBO(51, 68, 95, 1)))),
                            Container(
                              // height: size.height*0.04,
                              child: Text(widget.siniestro, style: TextStyle(fontSize: 16, color: Color.fromRGBO(51, 68, 95, 1), fontWeight: FontWeight.bold))),
                          ],
                        ),
                    ),
                    ),
                             Container(
                     color: Colors.transparent,
                     width: size.width * 0.80,
              height: size.height*0.08,
                 child: ListTile(
                   title: Container(
                   //  height: size.height*0.04,
                     child: Text("EMITIDO A", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromRGBO(51, 68, 95, 1)),)),
                   subtitle: Container(
                     height: size.height*0.04,
                     alignment: Alignment.centerLeft,
                     child: Text(widget.nombre, style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 68, 95, 1)))),
                 ),
               ),
                   Container(
                     color: Colors.transparent,
                     width: size.width * 0.80,
              height: size.height*0.08,
                 child: ListTile(
                   title: Container(
                   //  height: size.height*0.04,
                     child: Text("RFC", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromRGBO(51, 68, 95, 1)),)),
                   subtitle: Container(
                     height: size.height*0.04,
                     alignment: Alignment.centerLeft,
                     child: Text(widget.rfc, style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 68, 95, 1)))),
                 ),
               ),
                    Container(
                     color: Colors.transparent,
                     width: size.width * 0.80,
              height: size.height*0.08,
                 child: ListTile(
                   title: Container(
                   //  height: size.height*0.04,
                     child: Text("MONTO", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color.fromRGBO(51, 68, 95, 1)),)),
                   subtitle: Container(
                     height: size.height*0.04,
                     alignment: Alignment.centerLeft,
                     child: Text(currencyMXN.format(widget.monto), style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 68, 95, 1)))),
                 ),
               ),
                    Container(
                           width: size.width * 0.80,
                           color: Colors.transparent,
              height: size.height*0.08,
                      child:  ListTile(

                       
                        title: Row(
                          children: [
                            Container(
                            //  height: size.height*0.04,
                              child: Icon(Icons.circle, color: circleAlert(widget.status), size: 10,)),
                            Container(
                              // height: size.height*0.04,
                              child: Text(" "+widget.status, style: TextStyle(fontSize: 14, color: Color.fromRGBO(51, 68, 95, 1)))),
                          ],
                        ),
                    ),
                    )
                 
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
