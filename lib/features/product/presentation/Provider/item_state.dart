import 'package:factus_reto_final/features/product/domain/entities/item.dart';

class ItemState {
  final bool isLoading;
  final List<Item> items;
  final Item? selectItem;
  final String? error;

  new({
    this.isLoading = false,
    this.items = const [],
    this.selectItem,
    this.error,
  });

  ItemState copyWith({
    bool? isLoading,
    List<Item>? items,
    Item? selectItem,
    String? error,
  }) {
    return ItemState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
      selectItem: selectItem ?? this.selectItem,
      error: error ?? this.error,
    );
  }
}
