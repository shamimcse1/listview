import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:listview/DetailsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List post;
  late String fLetter;

  Future<bool> _getPost() async {
    String uri = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(Uri.parse(uri));
    post = json.decode(response.body);
    print(response.body);
    return true;
  }

  @override
  void initState() {
    super.initState();
    _getPost();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: post.length == null ? 0 : post.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(post[index]["title"][0].toString().toUpperCase()),
                ),
                title: Text(post[index]["title"]),
                onTap: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => DetailsPage(post[index]));
                  Navigator.push(context, route);
                },
              );
            }),
      ),
    );
  }
}
