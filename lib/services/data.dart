import 'package:flutter/material.dart';

class PageModel {
  var imageAsset;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageAsset, this.title, this.body, this.titleGradient});
}

List<List<Color>> gradients = [
  [Colors.orange[600], Colors.orange[900]],
  [Colors.blue[200],Colors.blue[800]],
  [Colors.purple[200],Colors.purple[800]]
];


var pageList = [
  PageModel(
    imageAsset: "assets/tips/carousel.png",
    title: "Carousel",
    body: "Always know what you want on the next carousel, and always have 1 or 2 backup plans in case you can't get it.)", 
    titleGradient: gradients[0]
    ),
    PageModel(
    imageAsset: "assets/tips/pairs_final.png",
    title: "Pairs",
    body:"It's often better to hold pairs on early game (getting lvl 2 champions early can save you few HP's when you don't have a solid team)",
    titleGradient: gradients[1]
    ),
    PageModel(
    imageAsset: "assets/tips/items.png",
    title: "Items",
    body: "Leaving your item components on the bench and waiting for the perfect components to combine your perfect items can be worse than slaming a strong items that can get your through early game, even if this item is bad in late game.",
    titleGradient: gradients[2]
    ),
];