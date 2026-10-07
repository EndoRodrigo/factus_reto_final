import 'package:factus_reto_final/features/product/domain/entities/item.dart';
import 'package:factus_reto_final/features/product/domain/repositories/item_repository.dart';

class GetItemsUsecase {
  final ItemRepository repository;

  GetItemsUsecase({required this.repository});

  Future<List<Item>> call() {
    return repository.getItems();
  }
}
