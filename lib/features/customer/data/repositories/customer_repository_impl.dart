import '../../domain/entities/customer.dart';
import '../../domain/repositories/customer_repository.dart';
import '../datasources/customer_data_source_local.dart';
import '../mappers/customer_mapper.dart';
import '../models/customer_model.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDataSourceLocal dataSource;

  CustomerRepositoryImpl({required this.dataSource});

  @override
  Future<int> addCustomer(Customer customer) async {
    final model = CustomerMapper.toModel(customer);
    return await dataSource.insertCustomerMap(model.toMap());
  }

  @override
  Future<List<Customer>> getCustomers({int limit = 50, int offset = 0}) async {
    final maps = await dataSource.getCustomers(limit: limit, offset: offset);
    return maps
        .map((map) => CustomerMapper.toEntity(CustomerModel.fromMap(map)))
        .toList();
  }

  @override
  Future<Customer?> getCustomerById(int id) async {
    final map = await dataSource.getCustomerById(id);
    if (map == null) return null;
    return CustomerMapper.toEntity(CustomerModel.fromMap(map));
  }

  @override
  Future<Customer?> getCustomerByIdentification(String identification) async {
    final map = await dataSource.getCustomerByIdentification(identification);
    if (map == null) return null;
    return CustomerMapper.toEntity(CustomerModel.fromMap(map));
  }

  @override
  Future<List<Customer>> searchCustomers(String query) async {
    final maps = await dataSource.searchCustomers(query);
    return maps
        .map((map) => CustomerMapper.toEntity(CustomerModel.fromMap(map)))
        .toList();
  }

  @override
  Future<bool> updateCustomer(Customer customer) async {
    if (customer.id == null) return false;
    final model = CustomerMapper.toModel(customer);
    final count = await dataSource.updateCustomerMap(
      customer.id!,
      model.toMap(),
    );
    return count > 0;
  }

  @override
  Future<bool> deleteCustomer(int id) async {
    final count = await dataSource.deleteCustomer(id);
    return count > 0;
  }
}
