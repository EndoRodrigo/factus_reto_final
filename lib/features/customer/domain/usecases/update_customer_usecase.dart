import '../entities/customer.dart';
import '../repositories/customer_repository.dart';

class UpdateCustomerUsecase {
  final CustomerRepository repository;

  UpdateCustomerUsecase({required this.repository});

  Future<bool> call(Customer customer) {
    return repository.updateCustomer(customer);
  }
}
