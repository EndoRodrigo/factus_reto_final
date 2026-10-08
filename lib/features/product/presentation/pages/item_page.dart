import 'package:factus_reto_final/features/product/presentation/Provider/item_notifier.dart';
import 'package:factus_reto_final/features/product/presentation/pages/item_from_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/item.dart';
import '../Provider/item_state.dart';
import '../widgets/item_card.dart';

class ItemPage extends ConsumerStatefulWidget {
  const ItemPage({super.key});

  @override
  ConsumerState<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends ConsumerState<ItemPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(itemNotifierProvider.notifier).loadItems();
    });
  }

  Future<void> _openCreateProduct() async {
    final created = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const ItemFromPage()),
    );

    if (created == true && mounted) {
      ref.read(itemNotifierProvider.notifier).loadItems();
    }
  }

  Future<void> _openEditProduct(Item item) async {
    final update = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => ItemFromPage(item: item,)),
    );

    if (update == true && mounted) {
      ref.read(itemNotifierProvider.notifier).loadItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis Items',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: _buildBody(state),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openCreateProduct,
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Item'),
      ),
    );
  }

  Widget _buildBody(ItemState state) {
    if (state.isLoading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 16),
              Text(state.error!, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  ref.read(itemNotifierProvider.notifier).loadItems();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      );
    }

    if (state.items.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(itemNotifierProvider.notifier).loadItems();
      },
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        itemCount: state.items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final item = state.items[index];
          print('Numero del producto ${item.id}');
          return ItemCard(
              item: item,
              onEdit: () => _openEditProduct(item),

            //onDelete: () => ref.read(itemNotifierProvider.notifier).deleteItem(item.id),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 72,
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),
            const SizedBox(height: 20),
            const Text(
              'No tienes items registrados',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Crea tu primer item para comenzar a utilizarlo en tus facturas.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _openCreateProduct,
              icon: const Icon(Icons.add),
              label: const Text('Crear primer item'),
            ),
          ],
        ),
      ),
    );
  }
}
