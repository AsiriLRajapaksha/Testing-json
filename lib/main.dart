import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import "package:http/http.dart" as http;

void main() async {
  List _body = await getJson();

  for (int i = 0; i < _body.length; i++) {
    print(_body[i]['title']);
    print(_body[i]['body']);
  }

  runApp(new MaterialApp(
      title: "Json",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Json"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: new Center(
          child: new ListView.builder(
              itemCount: _body.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (BuildContext context, int position) {
                if (position.isOdd) return new Divider();
                return ListTile(
                  title: new Text(
                    "${_body[position]['title']}",
                    style: new TextStyle(fontSize: 19.9),
                  ),
                  subtitle: new Text("${_body[position]['body']}"),
                  leading: new CircleAvatar(
                    backgroundColor: Colors.green,
                    child: new Text("${_body[position]['title'][0].toString().toUpperCase()}",
                    style: new TextStyle(color: Colors.white, fontSize: 19.0),),
                  ),
                );
              }),
        ),
      )));
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}
