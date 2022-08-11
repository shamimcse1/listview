import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  var data;
  DetailsPage(this.data);

  @override
  State<DetailsPage> createState() => _DetailsPageState(this.data);
}

class _DetailsPageState extends State<DetailsPage> {
  var mData;

  _DetailsPageState(this.mData);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:Text("Title: ${mData['title']}"),
          ),
        ],
      ),
    );
  }
}
