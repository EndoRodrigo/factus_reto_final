import 'package:factus_reto_final/features/product/domain/repositories/item_repository.dart';

class CreateItemUsecase {
  final ItemRepository repository;

  CreateItemUsecase({required this.repository});

  Future<int> call({
    required String codeReference,
    required String name,
    required double quantity,
    required double discountRate,
    required double price,
    required String unitMeasureCode,
    required String standardCode,
  }) {
    return repository.createItem(
      codeReference: codeReference,
      name: name,
      quantity: quantity,
      discountRate: discountRate,
      price: price,
      unitMeasureCode: unitMeasureCode,
      standardCode: standardCode,
    );
  }
}
