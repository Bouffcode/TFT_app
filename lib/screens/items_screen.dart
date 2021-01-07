import 'package:flutter/material.dart';


class ItemsScreen extends StatelessWidget {
  final List data; // le JSON est sous forme de liste et non une Map
  final List<String> itemsAssetnumber = [
    "01", "02", "03", "04", "05", "06", "07", "08", "09",
    "11", "12", "13", "14", "15", "16", "17", "18", "19",
     "22", "23", "24", "25", "26", "27", "28", "29", "33",
      "34", "35", "36", "37", "38", "39", "44", "45", "46",
       "47", "48", "49", "55", "57", "58", "59", "66", "67",
        "68", "69", "77", "78", "79", "88", "89", "99"]; // une Liste avec les nom des item dans Assets
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
                backgroundImage: AssetImage('assets/items/${itemsAssetnumber[index]}.png')),
             
          ));
        },
      ),
    );
  }
}