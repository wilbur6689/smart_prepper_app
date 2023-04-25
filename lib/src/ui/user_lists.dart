import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:preperlist/src/models/supply_name_entity.dart';

class ViewMyListPage extends StatefulWidget {
  // define any variables we may need
  const ViewMyListPage({super.key, required this.title});

  final String title;

  // create the state
  @override
  State<ViewMyListPage> createState() => _ViewMyListState();
}

class _ViewMyListState extends State<ViewMyListPage> {
  List _supplylist = [];
  final _database = FirebaseDatabase.instance.ref();
  late StreamSubscription _itemSupplySpecialStream;

  @override
  void initState() {
    super.initState();
    _activateListerners();
  }

  void _activateListerners() {
    var supplylist = [];
    _itemSupplySpecialStream =
        _database.child("supplyItem").onValue.listen((event) {
      for (var element in event.snapshot.children) {
        final supplyNameEntity =
            SupplyNameEntity.fromRTDB(element.value as Map<String, dynamic>);
        supplylist.add(supplyNameEntity);
      }
      //final item = Map<String, dynamic>.from(event.snapshot.value);
      setState(() {
        _supplylist = supplylist;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: ListView(children: <Widget>[
              const Text('Catagory: Flood',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              for (SupplyNameEntity supplyNameEntity in _supplylist)
                Container(
                    child: (supplyNameEntity.category.contains('flood'))
                        ? Text('Item: ${supplyNameEntity.supplyName}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ))
                        : null),
              const SizedBox(height: 30),
              const Text('Catagory: Earth Quake',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
              for (SupplyNameEntity supplyNameEntity in _supplylist)
                Container(
                    child: (supplyNameEntity.category.contains('earth quake'))
                        ? Text('Item: ${supplyNameEntity.supplyName}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ))
                        : null),
            ]),
          ),
        ));
  }

  @override
  void deactivate() {
    _itemSupplySpecialStream.cancel();
    super.deactivate();
  }
}
