import '../repositories/customer_repository.dart';

class DeleteCustomerUsecase {
  final CustomerRepository repository;

  DeleteCustomerUsecase({required this.repository});

  Future<bool> call(int id) {
    return repository.deleteCustomer(id);
  }
}
