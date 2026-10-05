import 'package:factus_reto_final/features/product/presentation/pages/item_from_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProductFormPage renders the creation fields', (tester) async {
    await tester.pumpWidget(
      ProviderContainer(
        child: MaterialApp(home: Scaffold(body: ProductFormPage())),
      ),
    );

    expect(find.text('Crear producto'), findsOneWidget);
    expect(
      find.widgetWithText(TextFormField, 'Nombre del producto'),
      findsOneWidget,
    );
    expect(find.widgetWithText(TextFormField, 'Código'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Precio'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Cantidad'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'Descuento (%)'), findsOneWidget);
    expect(
      find.widgetWithText(TextFormField, 'Unidad de medida'),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(TextFormField, 'Código estándar'),
      findsOneWidget,
    );
  });
}
