import 'package:flutter/material.dart';

class ViewWildFireSupplyListPage extends StatefulWidget {
  // define any variables we may need
  const ViewWildFireSupplyListPage({super.key, required this.title});

  final String title;

  // create the state
  @override
  State<ViewWildFireSupplyListPage> createState() =>
      _WildFireSupplyListPageState();
}

class _WildFireSupplyListPageState extends State<ViewWildFireSupplyListPage> {
  @override
  Widget build(BuildContext context) {
    // final ButtonStyle ourButtonStyle = ElevatedButton.styleFrom(
    //     textStyle: const TextStyle(fontSize: 20),
    //     elevation: 15.0,
    //     padding: const EdgeInsets.all(20.0));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(30),
          child: Title(
              color: Colors.black,
              child: const Text("- Wild Fire Supply List -",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold))),
        )
      ])),
    );
  }
}
