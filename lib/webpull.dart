import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class WebText extends StatelessWidget{

  TextEditingController controller = TextEditingController();

  var url = 'http://www.script-o-rama.com/movie_scripts/s/shrek-script-transcript-mike-myers.html';

  ///This would pull data from an html page, although the parsing does
  ///not currently work.
  void getData()async {
    //http.Response response = await http.get(url);
    var document = parse(url);
    var element = parse(document.body.text).documentElement.text;
    controller.text = element;
  }


  @override
  Widget build(BuildContext context){
    getData();
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("Web Text"),
      ),
      body: Center(
        child: TextField(
          maxLines: 10,
          maxLengthEnforced: true,
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            fillColor: Colors.grey,
            filled: true,
        ),
        ),
      ),
    );
  }

}