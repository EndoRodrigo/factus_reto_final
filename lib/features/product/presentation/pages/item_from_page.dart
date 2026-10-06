import 'package:factus_reto_final/features/product/presentation/Provider/item_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductFormPage extends ConsumerStatefulWidget {
  final int? productId;

  const ProductFormPage({super.key, this.productId});

  bool get isEditing => productId != null;

  @override
  ConsumerState<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends ConsumerState<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');
  final _discountController = TextEditingController(text: '0');
  final _unitMeasureCodeController = TextEditingController(text: '94');
  final _standardCodeController = TextEditingController(text: '999');

  bool _loadingProduct = false;

  @override
  void initState() {
    super.initState();

    // Por ahora solamente dejamos preparada
    // la estructura para edición.
    //
    // Si widget.productId != null, posteriormente
    // aquí podremos cargar el producto.
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _discountController.dispose();
    _unitMeasureCodeController.dispose();
    _standardCodeController.dispose();

    super.dispose();
  }

  Future<void> _saveProduct() async {
    print('1. Entrando a _saveProduct');

    if (!_formKey.currentState!.validate()) {
      print('2. Formulario inválido');
      return;
    }

    print('3. Formulario válido');

    final name = _nameController.text.trim();
    final code = _codeController.text.trim();

    final price = double.parse(_priceController.text.trim());
    final quantity = double.parse(_quantityController.text.trim());
    final discount = double.parse(_discountController.text.trim());

    print('4. Datos convertidos correctamente');

    final notifier = ref.read(itemNotifierProvider.notifier);

    print('5. Antes de itemCreate');

    final success = await notifier.itemCreate(
      codeReference: code,
      name: name,
      quantity: quantity,
      discountRate: discount,
      price: price,
      unitMeasureCode: _unitMeasureCodeController.text.trim(),
      standardCode: _standardCodeController.text.trim(),
    );

    print('6. Después de itemCreate: $success');

    if (!mounted) {
      print('7. Widget desmontado');
      return;
    }

    print('8. Widget sigue montado');

    if (success) {
      print('9. Producto creado');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto creado correctamente')),
      );

      Navigator.pop(context, true);
    } else {
      print('9. Error creando producto');

      final state = ref.read(itemNotifierProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error ?? 'No se pudo guardar el producto'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing ? 'Editar producto' : 'Nuevo producto',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: _loadingProduct
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      labelText: 'Nombre del producto',
                      hintText: 'Ej. Camiseta básica',
                      prefixIcon: Icon(Icons.inventory_2_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Ingresa el nombre del producto';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _codeController,
                    textCapitalization: TextCapitalization.characters,
                    decoration: const InputDecoration(
                      labelText: 'Código de referencia',
                      hintText: 'Ej. CAM-001',
                      prefixIcon: Icon(Icons.qr_code_2_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Ingresa el código del producto';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _priceController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Precio',
                            hintText: 'Ej. 50000',
                            prefixIcon: Icon(Icons.attach_money),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Ingresa el precio';
                            }

                            final price = double.tryParse(value);

                            if (price == null || price <= 0) {
                              return 'Ingresa un precio válido';
                            }

                            return null;
                          },
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: TextFormField(
                          controller: _quantityController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Cantidad',
                            hintText: 'Ej. 1',
                            prefixIcon: Icon(Icons.numbers),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Ingresa la cantidad';
                            }

                            final quantity = double.tryParse(value);

                            if (quantity == null || quantity < 0) {
                              return 'Ingresa una cantidad válida';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _discountController,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          decoration: const InputDecoration(
                            labelText: 'Descuento (%)',
                            hintText: 'Ej. 0',
                            prefixIcon: Icon(Icons.percent),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Ingresa el descuento';
                            }

                            final discount = double.tryParse(value);

                            if (discount == null ||
                                discount < 0 ||
                                discount > 100) {
                              return 'Descuento entre 0 y 100';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _unitMeasureCodeController,
                          decoration: const InputDecoration(
                            labelText: 'Unidad de medida',
                            hintText: 'Ej. 94',
                            prefixIcon: Icon(Icons.straighten_outlined),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Ingresa la unidad';
                            }

                            return null;
                          },
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: TextFormField(
                          controller: _standardCodeController,
                          decoration: const InputDecoration(
                            labelText: 'Código estándar',
                            hintText: 'Ej. 999',
                            prefixIcon: Icon(Icons.code_outlined),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Ingresa el código estándar';
                            }

                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: state.isLoading ? null : _saveProduct,
                      icon: state.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.save_outlined),
                      label: Text(
                        widget.isEditing ? 'Guardar cambios' : 'Crear producto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
