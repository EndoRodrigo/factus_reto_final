import 'package:factus_reto_final/features/product/domain/usecases/create_item_usecase.dart';
import 'package:factus_reto_final/features/product/presentation/Provider/item_provider.dart';
import 'package:factus_reto_final/features/product/presentation/Provider/item_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemNotifier extends Notifier<ItemState> {
  late final CreateItemUsecase _createItemUseCase;

  @override
  ItemState build() {
    _createItemUseCase = ref.watch(itemUseCasesProvider);
    return ItemState();
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
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
    return false;
  }
}

final itemNotifierProvider = NotifierProvider<ItemNotifier, ItemState>(() {
  return ItemNotifier();
});
