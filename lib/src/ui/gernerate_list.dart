import 'package:flutter/material.dart';
import 'package:preperlist/src/ui/flood_supply.dart';
import 'package:preperlist/src/ui/wild_fire_supply.dart';
import 'package:preperlist/src/ui/earth_quake_supply.dart';

class GenerateListPage extends StatefulWidget {
  // define any variables we may need
  const GenerateListPage({super.key, required this.title});

  final String title;

  // create the state
  @override
  State<GenerateListPage> createState() => _GenerateListState();
}

class _GenerateListState extends State<GenerateListPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle ourButtonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        elevation: 15.0,
        padding: const EdgeInsets.all(20.0));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          // Title
          Container(
            margin: const EdgeInsets.all(30),
            child: Title(
                color: Colors.black,
                child: const Text("Choose your disaster:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold))),
          ),
          // buttons
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ourButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ViewFloodSupplyListPage(title: 'Back')));
              },
              child: const Text("Flood"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ourButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ViewWildFireSupplyListPage(title: 'Back')));
              },
              child: const Text("Wild Fire"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ourButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ViewEarthQuakeSupplyListPage(title: 'Back')));
              },
              child: const Text("Earth Quake"),
            ),
          )
        ],
      )),
    );
  }
}
