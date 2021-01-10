import 'package:flutter/material.dart';

class ChampionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Column(
              children: [
                new Container(
                    width: 60.0,
                    height: 60.0,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image:  DecorationImage(
                            fit: BoxFit.fill,
                            image:  AssetImage(
                                "assets/champions/${data[0]['apiName']}.png")))),
                                Text(data[0]['name'], textScaleFactor: 1.5),
              ],
            ),

      ],),
    );
  }
}