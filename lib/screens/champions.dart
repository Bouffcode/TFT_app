import 'package:flutter/material.dart';

class ChampionsPage extends StatelessWidget {
  final List data; // le JSON est sous forme de liste et non une Map
  ChampionsPage({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:ListView.builder(
        itemCount: data.length, //TO DO length
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){},
              title: Text(data[index]['name']),
              subtitle: Text(data[index]['ability']['desc']),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/champions/${data[index]['apiName']}.png')),
                // need an other Cardtype to show the items effects
             
          ));}
      ),);}}
