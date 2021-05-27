import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool expanded=false;
   final List<Item> _data = generateItems(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Color.fromRGBO(255, 107, 11, 1),),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("Registro", style: TextStyle(color: Color.fromRGBO(51, 68, 95, 1)),),
      ),
      body: Column(
        children: [
     _buildPanel(),
        ],
      ),
    );
  }

   Widget _buildPanel() {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 2,
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
            value: item.id,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
                title: Text(item.expandedValue),
                subtitle:
                    const Text('To delete this panel, tap the trash can icon'),
                trailing: const Icon(Icons.delete),
                onTap: () {
                  setState(() {
                    _data
                        .removeWhere((Item currentItem) => item == currentItem);
                  });
                }));
      }).toList(),
    );
  }
}


// stores ExpansionPanel state information
class Item {
  Item({
    @required this.id,
    @required this.expandedValue,
    @required this.headerValue,
  });

  int id;
  String expandedValue;
  String headerValue;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      id: index,
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
