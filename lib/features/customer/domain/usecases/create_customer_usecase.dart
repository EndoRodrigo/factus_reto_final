import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class CreateCustomerUsecase {
  final CustomerRepository repository;

  CreateCustomerUsecase({required this.repository});

  Future<int> call(Customer customer) {
    return repository.addCustomer(customer);
  }
}
