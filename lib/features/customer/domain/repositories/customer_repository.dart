import '../entities/customer.dart';

abstract class CustomerRepository {
  Future<int> addCustomer(Customer customer);
  Future<List<Customer>> getCustomers({int limit = 50, int offset = 0});
  Future<Customer?> getCustomerById(int id);
  Future<Customer?> getCustomerByIdentification(String identification);
  Future<List<Customer>> searchCustomers(String query);
  Future<bool> updateCustomer(Customer customer);
  Future<bool> deleteCustomer(int id);
}
