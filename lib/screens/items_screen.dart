import 'package:flutter/material.dart';


class ItemsScreen extends StatelessWidget {
  final List data; // le JSON est sous forme de liste et non une Map
  ItemsScreen({Key key, this.data}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: data.length, //TO DO length
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){},
              title: Text(data[index]['name']),
              subtitle: Text(data[index]['description']),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/items/${data[index]['id'].toString()}.png')),
                // need an other Cardtype to show the items effects
             
          ));
        },
      ),
    );
  }
}