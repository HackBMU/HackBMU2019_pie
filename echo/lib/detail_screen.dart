import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translator/translator.dart';

class DetailScreen extends StatefulWidget {
  String text;

  DetailScreen({this.text});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  FlutterTts flutterTts = new FlutterTts();
  GoogleTranslator translator = GoogleTranslator();
  int index = 0;
  String char, letter;
  String image = '';
  var current;
  var _languages = ["English", "French" , "Indonesian", "Romanian", "Vietnamese"];

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
         Row(
           children: <Widget>[
             image != null ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image:  AssetImage(image), fit: BoxFit.cover)),
                ),
              ) : Container(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: letter != null ? Text(letter, style:TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.bold,
                  fontSize: 30
                )) : Container(),
              )
           ],
         ),
          Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: DropdownButton<String>(
                items: _languages.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (String newItemSelected) {
                  setState(() {
                    current = newItemSelected;
                    // translateAndSpeak(data, current);
                  });
                },
                value: current,
              ),
            
            ),
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
        letter = widget.text[index].toUpperCase();
      });
      ++index;

      if (index >= widget.text.length) {
        _speak(widget.text, current);
      }

      if (index >= widget.text.length) {
        t.cancel();
      }
    });

    return char;
  }

  void _speak(String data, String currentLanguage) async {
    if(currentLanguage == null) {
      print("Current Languge Null");
    }
    print("Current Language : $currentLanguage");
    if (currentLanguage == "English") {
      await flutterTts.speak(data);
    } else if (currentLanguage == "French") {
      translator.translate(data, to: 'fr').then((s) {
        print("Source: " +
            data +
            "\n"
            "Translated: " +
            s +
            "\n");
        flutterTts.speak(s);
      });
    } else if (currentLanguage == "Indonesian") {
      translator.translate(data, to: 'id').then((s) {
        print("Source: " +
            data +
            "\n"
            "Translated: " +
            s +
            "\n");
        flutterTts.speak(s);
      });
    } else if (currentLanguage == "Romanian") {
      translator.translate(data, to: 'ro').then((s) {
        print("Source: " +
            data +
            "\n"
            "Translated: " +
            s +
            "\n");
        flutterTts.speak(s);
      });
    } else if (currentLanguage == "Vietnamese") {
      translator.translate(data, to: 'vi').then((s) {
        print("Source: " +
            data +
            "\n"
            "Translated: " +
            s +
            "\n");
        flutterTts.speak(s);
      });
    }


     flutterTts.getLanguages.then((onValue) {
       
       print('Languages list : ${onValue.toString()}');
     });

  
  }

}