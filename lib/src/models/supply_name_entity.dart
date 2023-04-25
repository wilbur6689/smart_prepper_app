class SupplyNameEntity {
  final String category;
  final String supplyName;

  SupplyNameEntity({required this.category, required this.supplyName});

  factory SupplyNameEntity.fromRTDB(Map<String, dynamic> data) {
    return SupplyNameEntity(
        category: data['category'] ?? 'default category',
        supplyName: data['supplyName'] ?? 'supply name');
  }

  String fancyDescription() {
    return 'This is your supply item with a category of: $category and a name of $supplyName';
  }
}
