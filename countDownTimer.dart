timerS(){
         setState(() {
                
              });
     endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 181;
    String tiempoZero="";
    String tiempoZeroSegundo="";
 return 
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (_, CurrentRemainingTime time) {
       
              if (time == null) {
             
              
                 return        Column(
                   children: [
                     Padding(
                     padding: EdgeInsets.all(16),
                      child: Container(
              
                        color:  Color.fromRGBO(248, 235, 237, 1),
                        child: ListTile(
                          leading: Icon(Icons.cancel_outlined, color: Color.fromRGBO(205, 90, 89, 1), size: 30,),
                          title: Text("Código de verificación", style: TextStyle(fontSize: 12, color: Color.fromRGBO(205, 90, 89, 1)),),
                          subtitle: Text("Expirado"), 


                        ),
                      ),
                ),
                reenviarCodigo(),
                    Container(
               alignment: Alignment.bottomCenter,
               margin: EdgeInsets.fromLTRB(16, 56, 16, 16),
               child: RaisedButton(onPressed: null,
               child: Container(
                 width: 328,
                 height: 50,
                 child: Center(child: Text("Validar", style: TextStyle(color: Colors.white),)),
               ),
               ),
             ),
               noMiNumero()
                   ],
                 );
              } 
              if(time.min==null){
                tiempoZero="0";
              } else{
                tiempoZero="";
              }
                if(time.min==null){
                tiempoZero="0";
              } else{
                tiempoZero="";
              }
              return  Column(
                children: [
                  Padding(
                     padding: EdgeInsets.all(16),
                      child: Container(
                  
                        color:  Color.fromRGBO(251, 245, 198, 1),
                        child: ListTile(
                          leading: Icon(Icons.warning_amber_outlined, color: Color.fromRGBO(236, 183, 65, 1), size: 30,),
                          title: Text("Código de verificación", style: TextStyle(fontSize: 12, color: Color.fromRGBO(177, 137, 49, 1)),),
                          subtitle: Row(
                    children: [
                      Text(
                          'Valido por: '),
                  tiempoZero=="" && time.min!=null  ? Text( '${time.min}') : Text(tiempoZero),
             tiempoZeroSegundo=="" && time.sec < 10 ? Text(':0${time.sec}'):  Text(':${time.sec}'),
             Text(" minutos"),
                    ],
                  ),


                        ),
                      ),
                    ),

                  reenviarCodigo(),
                       Container(
               alignment: Alignment.bottomCenter,
               margin: EdgeInsets.fromLTRB(16, 56, 16, 16),
               child: RaisedButton(onPressed: (){
             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RegisterSeguridadPage()),
  );  
               },
               child: Container(
                 width: 328,
                 height: 50,
                 child: Center(child: Text("Validar", style: TextStyle(color: Colors.white),)),
               ),
               ),
             ),
               noMiNumero(),
                ],
              );
              
               /* Row(
                children: [
                  Text(
                      'Valido por: '),
              tiempoZero=="" && time.min!=null  ? Text( '${time.min}') : Text(tiempoZero),
             tiempoZeroSegundo=="" && time.sec < 10 ? Text(':0${time.sec}'):  Text(':${time.sec}'),
             Text(" minutos"),
                ],
              ); */
            },
          );
}
