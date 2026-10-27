import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'establistmest_form_pages.dart';

class EstablithmetPages extends ConsumerStatefulWidget {
  const EstablithmetPages({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EstablithmetPagesState();
}

class _EstablithmetPagesState extends ConsumerState<EstablithmetPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Establecimientos'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const EstablistmestFormPages()));
            }, child: const Text('Crear Establecimiento'))
          ],
        ),
      ),
    );
  }
}
