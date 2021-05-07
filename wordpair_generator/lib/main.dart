import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepPurple[700]),
      home: Scaffold(
        appBar:  AppBar(
          centerTitle: true,
          title: Text("WordPair Generator", textAlign: TextAlign.center,),
          
        ),
        body: Center(
          child: Text("Heleleews again and again")
        )
      )
    );
  }
}
