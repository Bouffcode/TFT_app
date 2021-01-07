
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:tft_app/screens/items_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
    
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

Future<String>_loadFromAsset() async { //Fonction jebtha men Stacksoverflow pour ouvrir un JSON local, je comprend pas/jveux pas comprendre
  return await DefaultAssetBundle.of(context).loadString("assets/items.json");
}

void itemJson() async { //Fonction pour wait le decode du Json, ensuite push la page des Items avec les données comme arguments
    String jsonString = await _loadFromAsset();
    final itemResponse = jsonDecode(jsonString);
    Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ItemsScreen(data: itemResponse), //les données du Json sont dan't l'argument
    ));

}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
  
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            color: Colors.grey,
            onPressed: (){},
            child: Text('champions')
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: itemJson, // la fonction qui traite le Json et push la page des Items
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      
    );
  }
}


