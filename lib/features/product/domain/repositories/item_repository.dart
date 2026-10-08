import '../entities/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();

  Future<Item?> getItemById(int id);

  Future<int> createItem({
    required String codeReference,
    required String name,
    required double quantity,
    required double discountRate,
    required double price,
    required String unitMeasureCode,
    required String standardCode,
  });

  Future<bool> updateItem({required Item item});

  Future<bool> deleteItem(int id);
}
