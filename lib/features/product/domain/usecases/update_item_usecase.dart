import 'package:factus_reto_final/features/product/domain/repositories/item_repository.dart';

import '../entities/item.dart';

class UpdateItemUsecase {
  final ItemRepository repository;

  UpdateItemUsecase({required this.repository});

  Future<bool> call({required Item item}) {
    return repository.updateItem(item: item);
  }
}
