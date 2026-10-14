import '../../domain/entities/item.dart';

class ItemMapper {
  /// Convierte un Map de SQLite a la entidad del Dominio (Item)
  static Item toEntity(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int?,
      codeReference: map['codeReference']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      quantity: map['quantity'] ?? '1',
      discountRate: map['discountRate'] ?? '0',
      price: map['price'] ?? '0',
      unitMeasureCode: map['unitMeasureCode']?.toString() ?? '',
      standardCode: map['standardCode']?.toString() ?? '',
    );
  }

  /// Convierte la entidad del Dominio (Item) a un Map para SQLite
  static Map<String, dynamic> toMap(Item item) {
    return {
      if (item.id != null) 'id': item.id,
      'codeReference': item.codeReference,
      'name': item.name,
      'quantity': item.quantity,
      'discountRate': item.discountRate,
      'price': item.price,
      'unitMeasureCode': item.unitMeasureCode,
      'standardCode': item.standardCode,
    };
  }
}
