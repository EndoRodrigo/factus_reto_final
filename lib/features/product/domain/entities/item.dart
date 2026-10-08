class Item {
  final int? id;
  final String codeReference;
  final String name;
  final double quantity;
  final double discountRate;
  final double price;
  final String unitMeasureCode;
  final String standardCode;

  Item({
    this.id,
    required this.codeReference,
    required this.name,
    required this.quantity,
    required this.discountRate,
    required this.price,
    required this.unitMeasureCode,
    required this.standardCode,
  });
}
