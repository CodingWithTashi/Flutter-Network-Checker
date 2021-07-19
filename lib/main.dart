import 'dart:async';

import 'package:flutter/material.dart';

import 'connection_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasInterNetConnection = false;

  @override
  initState() {
    //Create instance
    ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
    //Initialize
    connectionStatus.initialize();
    //Listen for connection change
    connectionStatus.connectionChange.listen(connectionChanged);

    super.initState();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      hasInterNetConnection = hasConnection;
      //print(isOffline);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connection Checker'),
      ),
      body: Center(
        child: Text(
          hasInterNetConnection ? "Network Connected" : "No Network Connected",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
