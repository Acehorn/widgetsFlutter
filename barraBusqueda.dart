import 'package:flutter/material.dart';

class BarraBusquedaAutos extends StatefulWidget {

  BarraBusquedaAutos({Key key,}) : super(key: key);

  @override
  _BarraBusquedaAutosState createState() => _BarraBusquedaAutosState();
}

class _BarraBusquedaAutosState extends State<BarraBusquedaAutos> {
  String dropdownValue = 'No. Póliza';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
     return  
         Center(
           child: Column(
      
             children: [
               Container(
              decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(4),
  color: Colors.white,
     boxShadow: [
      BoxShadow(color: Colors.grey, spreadRadius: 1),
    ], 
  ),
                 width: size.width*0.90,
                height: size.height*0.1,
                
               
    child: Row(

                children: [
        Container(
           height: size.height*0.1,
                         width: size.width*0.35, 
    
          alignment: Alignment.center,
                                           decoration: BoxDecoration(

    borderRadius: BorderRadius.only(
    topLeft:Radius.circular(4),
    bottomLeft: Radius.circular(4),
    ),

  
  ),
            
            
                   child:  DropdownButton<String>(
            
                   underline: Container(
          height: 1,
          color: Colors.transparent,
        ),
                   isDense: true,
                value: dropdownValue,
    
 
   
                onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                },

                style: TextStyle(fontSize: 16, color: Color.fromRGBO(51, 68, 95, 1)),
                items: <String>['No. Póliza', 'Siniestro', 'Nombre']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                }).toList(),
    ),
                   ),
              

        Container(
           width: size.width*0.40, 
              height: size.height*0.1,
                color: Colors.transparent,
                
                   child: TextField(
                          decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
  
        hintText: "Hint here"),
                   ),
                 ), 

                 Container(
                     width: size.width*0.15, 
                        height: size.height*0.1,
                   
                   child: Icon(Icons.search),
                                 decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topRight:Radius.circular(4),
    bottomRight: Radius.circular(4),
    ),
  color: Color.fromRGBO(246, 249, 253, 1),

  ),
                 )
                ],
    ),
               ),
             ],
           ),
         );
   
         
 
  }
}
