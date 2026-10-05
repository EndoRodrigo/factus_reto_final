import '../../domain/entities/item.dart';

class ItemMapper {
  /// Convierte un Map de SQLite a la entidad del Dominio (Item)
  static Item toEntity(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int?,
      codeReference: map['codeReference']?.toString() ?? '',
      name: map['name']?.toString() ?? '',
      quantity: map['quantity']?.toString() ?? '1',
      discountRate: map['discountRate']?.toString() ?? '0',
      price: map['price']?.toString() ?? '0',
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
      'quantity': double.tryParse(item.quantity) ?? 1.0,
      'discountRate': double.tryParse(item.discountRate) ?? 0.0,
      'price': double.tryParse(item.price) ?? 0.0,
      'unitMeasureCode': item.unitMeasureCode,
      'standardCode': item.standardCode,
    };
  }
}
