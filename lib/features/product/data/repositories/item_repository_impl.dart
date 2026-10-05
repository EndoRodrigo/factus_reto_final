import 'package:factus_reto_final/features/product/data/datasources/item_local_data_source.dart';
import 'package:factus_reto_final/features/product/domain/entities/item.dart';
import 'package:factus_reto_final/features/product/domain/repositories/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemLocalDataSource dataSource;

  new({required this.dataSource});

  @override
  Future<int> createItem({
    required String codeReference,
    required String name,
    required double quantity,
    required double discountRate,
    required double price,
    required String unitMeasureCode,
    required String standardCode,
  }) async{
    return await dataSource.addItem(
        codeReference: codeReference,
        name: name,
        quantity: quantity,
        discountRate: discountRate,
        price: price,
        unitMeasureCode: unitMeasureCode,
        standardCode: standardCode
    );
  }

  @override
  Future<bool> deleteItem(int id) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<Item?> getItemById(int id) {
    // TODO: implement getItemById
    throw UnimplementedError();
  }

  @override
  Future<List<Item>> getItems() {
    // TODO: implement getItems
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem({
    required int id,
    required String codeReference,
    required String name,
    required double quantity,
    required double discountRate,
    required double price,
    required String unitMeasureCode,
    required String standardCode,
  }) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
