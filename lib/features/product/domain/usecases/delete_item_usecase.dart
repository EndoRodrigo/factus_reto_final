import 'package:factus_reto_final/features/product/domain/repositories/item_repository.dart';

class DeleteItemUsecase {
  final ItemRepository repository;

  new({required this.repository});

  Future<bool> call({required int id}) {
    return repository.deleteItem(id);
  }
}
