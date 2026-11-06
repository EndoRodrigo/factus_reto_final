import 'package:factus_reto_final/features/Establishments/domain/entities/establishment.dart';
import 'package:factus_reto_final/features/Establishments/presentation/providers/establistme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/build_filled_button.dart';
import '../../../shared/build_municipaly_field.dart';
import '../../../shared/build_text_field.dart';
import '../providers/establishmest_state.dart';

class EstablistmestFormPages extends ConsumerStatefulWidget {
  const EstablistmestFormPages({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EstablistmestFormPagesState();
}

class _EstablistmestFormPagesState
    extends ConsumerState<EstablistmestFormPages> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nitController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _municipalityCodeController = TextEditingController();
  final _municipalityNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(establishmentNotifierProvider.notifier).loadEstablishments();
      if (!mounted) return;
      final state = ref.read(establishmentNotifierProvider);
      if (state.establishments.isNotEmpty) {
        final current = state.establishments.first;
        _nameController.text = current.name;
        _nitController.text = current.nit;
        _emailController.text = current.email;
        _phoneController.text = current.phone;
        _addressController.text = current.address;
        _municipalityCodeController.text = current.municipalityCode;
        _municipalityNameController.text = current.municipalityName;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nitController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _municipalityCodeController.dispose();
    _municipalityNameController.dispose();
    super.dispose();
  }

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
      body: state.isLoading && state.establishments.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _buildForm(state),
    );
  }

  Widget _buildForm(EstablishmestState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
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
            BuildMunicipalyField(
              codeController: _municipalityCodeController,
              nameController: _municipalityNameController,
              label: 'Municipio',
              icon: Icons.location_city,
            ),
            const SizedBox(height: 32),
            BuildFilledButton(
              state: state,
              onPressed: _save,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final currentEstablishment =
        ref.read(establishmentNotifierProvider).establishments.firstOrNull;

    final establishment = Establishment(
      id: currentEstablishment?.id,
      name: _nameController.text.trim(),
      nit: _nitController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      address: _addressController.text.trim(),
      municipalityCode: _municipalityCodeController.text.trim(),
      municipalityName: _municipalityNameController.text.trim(),
      createdAt: currentEstablishment?.createdAt ??
          DateTime.now().toIso8601String(),
    );

    final notifier = ref.read(establishmentNotifierProvider.notifier);
    final success = await notifier.createEstablishment(
      establishment: establishment,
    );

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Establecimiento guardado correctamente'),
        ),
      );
      Navigator.pop(context, true);
    } else {
      final state = ref.read(establishmentNotifierProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.error ?? 'No se pudo guardar el establecimiento',
          ),
        ),
      );
    }
  }
}
