import 'package:flutter/material.dart';
import 'package:gnp_movil/TramitesAutosModule/CFDI/utils/constantesAutosDeducible.dart';

class BarraBusquedaFormat extends StatefulWidget {

 final String hint;

  BarraBusquedaFormat({Key key, this.hint,}) : super(key: key);

  @override
  _BarraBusquedaFormatState createState() => _BarraBusquedaFormatState();
}

class _BarraBusquedaFormatState extends State<BarraBusquedaFormat> {

  TextEditingController controller = TextEditingController();
  bool wasTap=false;
  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
     return  
   
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Container(
                   
                              decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(4),
  color: Colors.white,
     boxShadow: [
      BoxShadow(color: wasTap==false ? greyColorGNP : naranjaColorGNP, spreadRadius: 1),
    ], 
  ),

           /*       width: size.width*0.90,
                  height: size.height*0.1, */
                  
                 
    child: Row(

                  children: [
    
     

        Container(
           width: 328, 
              height: 48,
                  color: Colors.transparent,
                  
                     child: TextField(
                       controller: controller,
                            decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
  
        hintText: widget.hint!=null ? widget.hint : ""),

        onTap: (){
          setState(() {
            
          });
          wasTap=true;

        },
        onSubmitted: (String value){
          setState(() {
            
          });
          wasTap=false;
        },
                     ),
                   ), 

                 GestureDetector(
                       onTap: (){
                            wasTap=false;
                       },
                       child: Container(
             
                         
                         child: Icon(Icons.search),
                                       decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topRight:Radius.circular(4),
    bottomRight: Radius.circular(4), 
    ),
/*   color: Color.fromRGBO(246, 249, 253, 1), */

  ),
                       ),
                     ),
                  ],
    ),
                 ),
               );
   
         
 
  }
}
