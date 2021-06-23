import 'package:flutter/material.dart';

class DropDownRegister extends StatefulWidget {
  final String titleDropHint;
  final String opcion1;
  final String opcion2;
  final String opcion3;
  final String opcion4;
  final onChanged;


  const DropDownRegister({ Key key, @required this.titleDropHint,@required this.opcion1,@required this.opcion2, @required this.opcion3,@required this.opcion4, @required this.onChanged,   }) : super(key: key);

  @override
  _DropDownRegisterState createState() => _DropDownRegisterState();
}

class _DropDownRegisterState extends State<DropDownRegister> {
  String dropDown;
  @override
  Widget build(BuildContext context) {
    return     Container(
       width: 340,
       height: 60,
       child: DropdownButton<String>(
        value: dropDown,
        hint: Text(widget.titleDropHint),
      /*   disabledHint: Text("Pregunta 1"), */
        
       // icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        isExpanded: true,
        elevation: 16,
    
        underline: Container(
          height: 2,

          color: Color.fromRGBO(170, 195, 238, 1),
        ),
        onChanged: widget.onChanged,
        items: <String>[widget.opcion1, widget.opcion2, widget.opcion3, widget.opcion4]
            .map<DropdownMenuItem<String>>((String value) {

          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
    ),
     );
  }
}
