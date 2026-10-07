import 'package:factus_reto_final/features/product/domain/usecases/create_item_usecase.dart';
import 'package:factus_reto_final/features/product/domain/usecases/get_items_usecase.dart';
import 'package:factus_reto_final/features/product/presentation/Provider/item_provider.dart';
import 'package:factus_reto_final/features/product/presentation/Provider/item_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemNotifier extends Notifier<ItemState> {
  late final CreateItemUsecase _createItemUseCase;
  late final GetItemsUsecase _getItemsUseCase;

  @override
  ItemState build() {
    _createItemUseCase = ref.watch(itemUseCasesProvider);
    _getItemsUseCase = ref.watch(getItemsUseCaseProvider);
    loadItems();
    return ItemState();
  }

  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final items = await _getItemsUseCase();
      state = state.copyWith(isLoading: false, items: items);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> itemCreate({
    required String codeReference,
    required String name,
    required double quantity,
    required double discountRate,
    required double price,
    required String unitMeasureCode,
    required String standardCode,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _createItemUseCase(
        codeReference: codeReference,
        name: name,
        quantity: quantity,
        discountRate: discountRate,
        price: price,
        unitMeasureCode: unitMeasureCode,
        standardCode: standardCode,
      );
      await loadItems();
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
}

final itemNotifierProvider = NotifierProvider<ItemNotifier, ItemState>(() {
  return ItemNotifier();
});
