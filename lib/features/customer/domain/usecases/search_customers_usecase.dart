import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class SearchCustomersUsecase {
  final CustomerRepository repository;

  SearchCustomersUsecase({required this.repository});

  Future<List<Customer>> call(String query) {
    return repository.searchCustomers(query);
  }
}
