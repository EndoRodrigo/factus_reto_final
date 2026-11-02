import 'package:factus_reto_final/features/Establishments/domain/entities/establishment.dart';
import 'package:factus_reto_final/features/Establishments/presentation/providers/establistme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/build_text_field.dart';
import '../providers/establishmest_provider.dart';
import '../providers/establishmest_state.dart';

class EstablistmestFormPages extends ConsumerStatefulWidget {
  const EstablistmestFormPages({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EstablistmestFormPagesState();
}

class _EstablistmestFormPagesState
    extends ConsumerState<EstablistmestFormPages> {
  final _fromKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nitController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _municipalityCodeController = TextEditingController();
  final _municipalityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(establishmentNotifierProvider);
    final isEdit = state.establishments.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? 'Editar Establecimiento' : 'Nuevo Establecimiento',
        ),
      ),
      body: _buildFrom(state),
    );
  }

  Widget _buildFrom(EstablishmestState establishment) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _fromKey,
        child: Column(
          children: [
            const Icon(Icons.business_outlined, size: 64),
            const SizedBox(height: 10),
            BuildTextField(
              controller: _nameController,
              label: 'Nombre',
              icon: Icons.business,
            ),
            const SizedBox(height: 10),
            BuildTextField(
              controller: _nitController,
              label: 'NIT',
              icon: Icons.numbers,
            ),
            const SizedBox(height: 10),
            BuildTextField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email,
            ),
            const SizedBox(height: 10),
            BuildTextField(
              controller: _phoneController,
              label: 'Teléfono',
              icon: Icons.phone,
            ),
            const SizedBox(height: 10),
            BuildTextField(
              controller: _addressController,
              label: 'Dirección',
              icon: Icons.location_on,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
