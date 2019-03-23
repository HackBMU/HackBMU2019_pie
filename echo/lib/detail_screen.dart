import 'dart:async';

import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String text;

  DetailScreen({this.text});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int index = 0;
  String char;
  String image = 'assets/A.gif';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: <Widget>[
          Text(widget.text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic)),
          RaisedButton(
            child: Text('press'),
            onPressed: () {
              character();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
          )
        ],
      ),
    );
  }

  String character() {
    int index = 0;
    Timer.periodic(Duration(seconds: 2), (Timer t) {
      char = 'assets/' + '${widget.text[index].toUpperCase()}' + '.gif';
      print('Gif is : ${char}');
      setState(() {
        image = char;
      });
      ++index;

      if (index >= widget.text.length) {
        t.cancel();
      }
    });

    return char;
  }
}