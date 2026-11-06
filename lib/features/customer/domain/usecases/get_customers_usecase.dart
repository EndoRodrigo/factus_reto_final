import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class GetCustomersUsecase {
  final CustomerRepository repository;

  GetCustomersUsecase({required this.repository});

  Future<List<Customer>> call({int limit = 50, int offset = 0}) {
    return repository.getCustomers(limit: limit, offset: offset);
  }
}
