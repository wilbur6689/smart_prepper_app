import 'package:firebase_database/firebase_database.dart';

class SupplyItem {
  String? key;
  String? category;
  String? supplyName;

  SupplyItem(this.category, this.supplyName);

  SupplyItem.fromSnapshot(DataSnapshot snapshot) {
    key = snapshot.key!;
    var data = snapshot.value as Map?;

    if (data != null) {
      category = data["category"];
      supplyName = data["supplyName"];
    }
  }

  toJson() {
    return {
      "category": category,
      "supplyName": supplyName,
    };
  }
}
