import 'package:factus_reto_final/features/product/data/datasources/item_local_data_source.dart';
import 'package:factus_reto_final/features/product/data/mappers/item_mapper.dart';
import 'package:factus_reto_final/features/product/domain/entities/item.dart';
import 'package:factus_reto_final/features/product/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource dataSource;

  ItemRepositoryImpl({required this.dataSource});

  @override
  Future<int> createItem({
    required String codeReference,
    required String name,
    required double quantity,
    required double discountRate,
    required double price,
    required String unitMeasureCode,
    required String standardCode,
  }) async {
    return await dataSource.addItem(
      codeReference: codeReference,
      name: name,
      quantity: quantity,
      discountRate: discountRate,
      price: price,
      unitMeasureCode: unitMeasureCode,
      standardCode: standardCode,
    );
  }

  @override
  Future<bool> deleteItem(int id) async {
    final result = await dataSource.deleteItem(id);
    return result > 0;
  }

  @override
  Future<Item?> getItemById(int id) async {
    final map = await dataSource.getItemById(id);
    if (map == null) return null;
    return ItemMapper.toEntity(map);
  }

  @override
  Future<List<Item>> getItems() async {
    final maps = await dataSource.getItems();
    return maps.map((map) => ItemMapper.toEntity(map)).toList();
  }

  @override
  Future<bool> updateItem({required Item item}) async {
    final result = await dataSource.updateItem(
      id: item.id!,
      codeReference: item.codeReference,
      name: item.name,
      quantity: item.quantity,
      discountRate: item.discountRate,
      price: item.price,
      unitMeasureCode: item.unitMeasureCode,
      standardCode: item.standardCode,
    );
    return result > 0;
  }
}
