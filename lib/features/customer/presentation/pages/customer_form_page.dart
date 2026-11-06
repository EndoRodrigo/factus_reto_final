import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/build_municipaly_field.dart';
import '../../../shared/build_text_field.dart';
import '../../domain/entities/customer.dart';
import '../providers/customer_notifier.dart';

class CustomerFormPage extends ConsumerStatefulWidget {
  final Customer? customer;

  const CustomerFormPage({super.key, this.customer});

  bool get isEditing => customer?.id != null;

  @override
  ConsumerState<CustomerFormPage> createState() => _CustomerFormPageState();
}

class _CustomerFormPageState extends ConsumerState<CustomerFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _namesController = TextEditingController();
  final _identificationController = TextEditingController();
  final _dvController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _companyController = TextEditingController();
  final _tradeNameController = TextEditingController();
  final _municipalityCodeController = TextEditingController();
  final _municipalityNameController = TextEditingController();

  int _identificationDocumentId = 3;
  String _legalOrganizationId = '2';
  String _tributeId = '21';

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      final c = widget.customer!;
      _namesController.text = c.names;
      _identificationController.text = c.identification;
      _dvController.text = c.dv ?? '';
      _emailController.text = c.email;
      _phoneController.text = c.phone;
      _addressController.text = c.address;
      _companyController.text = c.company ?? '';
      _tradeNameController.text = c.tradeName ?? '';
      _municipalityCodeController.text = c.municipalityId;
      _municipalityNameController.text = c.municipalityId;
      _identificationDocumentId = c.identificationDocumentId;
      _legalOrganizationId = c.legalOrganizationId;
      _tributeId = c.tributeId;
    }
  }

  @override
  void dispose() {
    _namesController.dispose();
    _identificationController.dispose();
    _dvController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _companyController.dispose();
    _tradeNameController.dispose();
    _municipalityCodeController.dispose();
    _municipalityNameController.dispose();
    super.dispose();
  }

  Future<void> _saveCustomer() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final newCustomer = Customer(
      id: widget.customer?.id,
      identification: _identificationController.text.trim(),
      dv: _dvController.text.trim().isEmpty ? null : _dvController.text.trim(),
      company: _companyController.text.trim().isEmpty
          ? null
          : _companyController.text.trim(),
      tradeName: _tradeNameController.text.trim().isEmpty
          ? null
          : _tradeNameController.text.trim(),
      names: _namesController.text.trim(),
      address: _addressController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      legalOrganizationId: _legalOrganizationId,
      tributeId: _tributeId,
      identificationDocumentId: _identificationDocumentId,
      municipalityId: _municipalityCodeController.text.trim(),
      createdAt: widget.customer?.createdAt,
    );

    final notifier = ref.read(customerNotifierProvider.notifier);
    final bool success;

    if (widget.isEditing) {
      success = await notifier.updateCustomer(newCustomer);
    } else {
      success = await notifier.createCustomer(newCustomer);
    }

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isEditing
                ? 'Cliente actualizado correctamente'
                : 'Cliente creado correctamente',
          ),
        ),
      );
      Navigator.pop(context, true);
    } else {
      final state = ref.read(customerNotifierProvider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error ?? 'Error al guardar el cliente'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(customerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing ? 'Editar Cliente' : 'Nuevo Cliente',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Icon(Icons.person_add_alt_1_outlined, size: 60),
            const SizedBox(height: 16),
            BuildTextField(
              controller: _namesController,
              label: 'Nombre o Razón Social',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: BuildTextField(
                    controller: _identificationController,
                    label: 'Identificación / NIT',
                    icon: Icons.badge_outlined,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: _dvController,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: const InputDecoration(
                      labelText: 'DV',
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            BuildTextField(
              controller: _emailController,
              label: 'Correo Electrónico',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            BuildTextField(
              controller: _phoneController,
              label: 'Teléfono',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            BuildTextField(
              controller: _addressController,
              label: 'Dirección',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 12),
            BuildMunicipalyField(
              codeController: _municipalityCodeController,
              nameController: _municipalityNameController,
              label: 'Municipio',
              icon: Icons.location_city_outlined,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              value: _identificationDocumentId,
              decoration: const InputDecoration(
                labelText: 'Tipo de Documento',
                prefixIcon: Icon(Icons.assignment_ind_outlined),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 3, child: Text('Cédula de Ciudadanía')),
                DropdownMenuItem(value: 6, child: Text('NIT')),
                DropdownMenuItem(value: 1, child: Text('Registro Civil')),
                DropdownMenuItem(value: 2, child: Text('Tarjeta de Identidad')),
                DropdownMenuItem(value: 4, child: Text('Tarjeta de Extranjería')),
                DropdownMenuItem(value: 5, child: Text('Cédula de Extranjería')),
                DropdownMenuItem(value: 7, child: Text('Pasaporte')),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() => _identificationDocumentId = val);
                }
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _legalOrganizationId,
              decoration: const InputDecoration(
                labelText: 'Tipo de Organización',
                prefixIcon: Icon(Icons.business_center_outlined),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: '2', child: Text('Persona Natural')),
                DropdownMenuItem(value: '1', child: Text('Persona Jurídica')),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() => _legalOrganizationId = val);
                }
              },
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _tributeId,
              decoration: const InputDecoration(
                labelText: 'Tributo / Régimen',
                prefixIcon: Icon(Icons.request_quote_outlined),
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: '21', child: Text('No responsable de IVA')),
                DropdownMenuItem(value: '01', child: Text('IVA')),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() => _tributeId = val);
                }
              },
            ),
            const SizedBox(height: 28),
            SizedBox(
              height: 50,
              child: FilledButton.icon(
                onPressed: state.isLoading ? null : _saveCustomer,
                icon: state.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.save),
                label: Text(
                  widget.isEditing ? 'Guardar Cambios' : 'Crear Cliente',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
