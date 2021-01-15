import 'package:flutter/material.dart';
import 'package:tft_app/services/data.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:tft_app/services/page_indicator.dart';

import '../main.dart';

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  PageController _controller;

  int currentpage = 0;
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentpage);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.lightGreenAccent[400], Colors.amber[800]],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        tileMode: TileMode.clamp,
        stops: [0.0, 1.0],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentpage = index;
                  if(currentpage == pageList.length - 1) {
                    lastPage = true;
                  } else{
                    lastPage = false;
                  }
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        var page = pageList[index];
                        var delta;
                        var y = 1.0;

                        if(_controller.position.haveDimensions) {
                          delta = _controller.page - index;
                          y = 1 - delta.abs().clamp(0.0, 1.0);
                        }
                        return Container(
                          decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: page.titleGradient,
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        tileMode: TileMode.clamp,
        stops: [0.0, 1.0],
      )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                child: Image.asset(page.imageAsset),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12.0,),
                                  height: 100.0,
                                  child: Stack(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: .1,
                                        child: GradientText(
                                          page.title,
                                          gradient: LinearGradient(
                                              colors: [Colors.white, Colors.grey]),
                                          style: TextStyle(
                                            fontSize: 80.0,
                                            letterSpacing: 1.0,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:30.0, left: 20.0),
                                        child: GradientText(
                                            page.title,
                                            gradient: LinearGradient(
                                                colors: [Colors.white, Colors.grey[200]]),
                                            style: TextStyle(
                                              fontSize: 70.0,
                                              letterSpacing: 1.0,
                                            ),
                                          ),
                                      ),
                                    ],
                                  ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top:12.0, left: 34.0),
                                    child: Transform(
                                      transform: Matrix4.translationValues(0.0, 50*(1-y), 0.0),
                                                                          child: Text(
                                        page.body,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black
                                        ),
                                      ),
                                    ),
                                  )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(
                width: 160.0,
                child: PageIndicator(currentpage, pageList.length),
              )
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: lastPage ? FloatingActionButton(
                backgroundColor: Colors.white,
                child: Icon(Icons.home, color: Colors.black),
                onPressed: (){
                  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')));
                },
              ): Container(),
            )
          ],
        ),
      ),
    );
  }
}
