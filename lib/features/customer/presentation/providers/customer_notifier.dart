import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/customer.dart';
import '../../domain/usecases/create_customer_usecase.dart';
import '../../domain/usecases/delete_customer_usecase.dart';
import '../../domain/usecases/get_customers_usecase.dart';
import '../../domain/usecases/search_customers_usecase.dart';
import '../../domain/usecases/update_customer_usecase.dart';
import 'customer_provider.dart';
import 'customer_state.dart';

class CustomerNotifier extends Notifier<CustomerState> {
  late final CreateCustomerUsecase _createCustomerUsecase;
  late final GetCustomersUsecase _getCustomersUsecase;
  late final SearchCustomersUsecase _searchCustomersUsecase;
  late final UpdateCustomerUsecase _updateCustomerUsecase;
  late final DeleteCustomerUsecase _deleteCustomerUsecase;

  @override
  CustomerState build() {
    _createCustomerUsecase = ref.watch(createCustomerUsecaseProvider);
    _getCustomersUsecase = ref.watch(getCustomersUsecaseProvider);
    _searchCustomersUsecase = ref.watch(searchCustomersUsecaseProvider);
    _updateCustomerUsecase = ref.watch(updateCustomerUsecaseProvider);
    _deleteCustomerUsecase = ref.watch(deleteCustomerUsecaseProvider);

    Future.microtask(() => loadCustomers());
    return const CustomerState();
  }

  Future<void> loadCustomers() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final customers = await _getCustomersUsecase();
      state = state.copyWith(isLoading: false, customers: customers);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> searchCustomers(String query) async {
    if (query.trim().isEmpty) {
      await loadCustomers();
      return;
    }
    state = state.copyWith(isLoading: true, error: null);
    try {
      final results = await _searchCustomersUsecase(query);
      state = state.copyWith(isLoading: false, customers: results);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> createCustomer(Customer customer) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _createCustomerUsecase(customer);
      await loadCustomers();
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> updateCustomer(Customer customer) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final updated = await _updateCustomerUsecase(customer);
      if (!updated) {
        state = state.copyWith(
          isLoading: false,
          error: 'No se pudo actualizar el cliente en la base de datos',
        );
        return false;
      }
      await loadCustomers();
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> deleteCustomer(int id) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _deleteCustomerUsecase(id);
      await loadCustomers();
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  void selectCustomer(Customer? customer) {
    state = state.copyWith(selectedCustomer: customer);
  }
}

final customerNotifierProvider =
    NotifierProvider<CustomerNotifier, CustomerState>(() {
  return CustomerNotifier();
});
