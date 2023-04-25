// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:preperlist/src/models/supply_item.dart';

class SupplyListRepo {
  final supplyDatabase = FirebaseDatabase.instance.ref();

  void pushSupplyData(SupplyItem supplyItem) {
    final supplyItemRef = supplyDatabase.child('supplyItem');

    if (supplyItem != null) {
      print(Text("Here is the supplyItem category: ${supplyItem.category}"));
      print(
          Text("Here is the supplyItem supplyName: ${supplyItem.supplyName}"));
      supplyItemRef.push().set(supplyItem.toJson());
    } else {
      print(const Text("the supplyItem was null"));
    }
  }
}
