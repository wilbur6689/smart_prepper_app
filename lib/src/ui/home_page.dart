import 'package:flutter/material.dart';
import 'package:preperlist/src/ui/home_page.dart';
import 'package:preperlist/src/ui/gernerate_list.dart';
import 'package:preperlist/src/ui/add_supply.dart';
import 'package:preperlist/src/ui/user_lists.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          child: Column(children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGwApTqkMvtO4vVL92vT-k_D0FjuyKsnJRomuK042skSmXGWhyB_GaEhvoT1HsfGFjTaQ&usqp=CAU",
                ),
                radius: 80.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              style: ourButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const GenerateListPage(title: 'Back')));
              },
              child: const Text(
                "Generate Prepper List",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ourButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const AddSupplyPage(title: 'Back')));
              },
              child: const Text(
                "Add Supply",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ourButtonStyle,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ViewMyListPage(title: 'Back')));
              },
              child: const Text(
                "My Lists",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ));
  }
}
