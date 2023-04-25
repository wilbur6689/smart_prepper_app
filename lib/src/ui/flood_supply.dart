import 'package:flutter/material.dart';

class ViewFloodSupplyListPage extends StatefulWidget {
  // define any variables we may need
  const ViewFloodSupplyListPage({super.key, required this.title});

  final String title;

  // create the state
  @override
  State<ViewFloodSupplyListPage> createState() => _FloodSupplyListPageState();
}

class _FloodSupplyListPageState extends State<ViewFloodSupplyListPage> {
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
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(30),
          child: Title(
              color: Colors.black,
              child: const Text("- Flood Supply List -",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold))),
        ),
      ])),
    );
  }
}
