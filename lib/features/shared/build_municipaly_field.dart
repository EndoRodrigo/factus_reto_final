import 'package:flutter/material.dart';
import 'Build_minucipy_selector.dart';
import 'build_text_field.dart';

class Municipality {
  final String code;
  final String name;
  final String department;

  const Municipality({
    required this.code,
    required this.name,
    required this.department,
  });
}

const List<Municipality> colombiaMunicipalities = [
  Municipality(code: '11001', name: 'Bogotá, D.C.', department: 'Cundinamarca'),
  Municipality(code: '05001', name: 'Medellín', department: 'Antioquia'),
  Municipality(code: '76001', name: 'Cali', department: 'Valle del Cauca'),
  Municipality(code: '08001', name: 'Barranquilla', department: 'Atlántico'),
  Municipality(code: '13001', name: 'Cartagena', department: 'Bolívar'),
  Municipality(code: '68001', name: 'Bucaramanga', department: 'Santander'),
  Municipality(code: '54001', name: 'Cúcuta', department: 'Norte de Santander'),
  Municipality(code: '17001', name: 'Manizales', department: 'Caldas'),
  Municipality(code: '66001', name: 'Pereira', department: 'Risaralda'),
  Municipality(code: '73001', name: 'Ibagué', department: 'Tolima'),
  Municipality(code: '41001', name: 'Neiva', department: 'Huila'),
  Municipality(code: '52001', name: 'Pasto', department: 'Nariño'),
  Municipality(code: '50001', name: 'Villavicencio', department: 'Meta'),
  Municipality(code: '23001', name: 'Montería', department: 'Córdoba'),
  Municipality(code: '19001', name: 'Popayán', department: 'Cauca'),
  Municipality(code: '63001', name: 'Armenia', department: 'Quindío'),
  Municipality(code: '15001', name: 'Tunja', department: 'Boyacá'),
  Municipality(code: '20001', name: 'Valledupar', department: 'Cesar'),
  Municipality(code: '44001', name: 'Riohacha', department: 'La Guajira'),
  Municipality(code: '27001', name: 'Quibdó', department: 'Chocó'),
  Municipality(code: '81001', name: 'Arauca', department: 'Arauca'),
  Municipality(code: '85001', name: 'Yopal', department: 'Casanare'),
  Municipality(code: '86001', name: 'Mocoa', department: 'Putumayo'),
  Municipality(code: '18001', name: 'Florencia', department: 'Caquetá'),
  Municipality(code: '88001', name: 'San Andrés', department: 'San Andrés'),
  Municipality(code: '91001', name: 'Leticia', department: 'Amazonas'),
  Municipality(code: '94001', name: 'Inírida', department: 'Guainía'),
  Municipality(code: '95001', name: 'San José del Guaviare', department: 'Guaviare'),
  Municipality(code: '97001', name: 'Mitú', department: 'Vaupés'),
  Municipality(code: '99001', name: 'Puerto Carreño', department: 'Vichada'),
  Municipality(code: '68276', name: 'Floridablanca', department: 'Santander'),
  Municipality(code: '68307', name: 'Girón', department: 'Santander'),
  Municipality(code: '68547', name: 'Piedecuesta', department: 'Santander'),
  Municipality(code: '05045', name: 'Bello', department: 'Antioquia'),
  Municipality(code: '05266', name: 'Envigado', department: 'Antioquia'),
  Municipality(code: '05360', name: 'Itagüí', department: 'Antioquia'),
  Municipality(code: '05615', name: 'Rionegro', department: 'Antioquia'),
  Municipality(code: '25899', name: 'Zipaquirá', department: 'Cundinamarca'),
  Municipality(code: '25175', name: 'Chía', department: 'Cundinamarca'),
  Municipality(code: '25754', name: 'Soacha', department: 'Cundinamarca'),
  Municipality(code: '76520', name: 'Palmira', department: 'Valle del Cauca'),
  Municipality(code: '76109', name: 'Buenaventura', department: 'Valle del Cauca'),
  Municipality(code: '76892', name: 'Yumbo', department: 'Valle del Cauca'),
  Municipality(code: '08758', name: 'Soledad', department: 'Atlántico'),
];

class BuildMunicipalyField extends StatefulWidget {
  final TextEditingController codeController;
  final TextEditingController nameController;
  final String label;
  final IconData icon;

  const BuildMunicipalyField({
    super.key,
    required this.codeController,
    required this.nameController,
    this.label = 'Municipio',
    this.icon = Icons.location_city,
  });

  @override
  State<BuildMunicipalyField> createState() => _BuildMunicipalyFieldState();
}

class _BuildMunicipalyFieldState extends State<BuildMunicipalyField> {
  @override
  Widget build(BuildContext context) {
    return BuildTextField(
      controller: widget.nameController,
      label: widget.label,
      icon: widget.icon,
      readOnly: true,
      onTap: _showMunicipalitySelector,
    );
  }

  void _showMunicipalitySelector() async {
    final municipality = await showModalBottomSheet<Municipality>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const BuildMinucipySelector(),
    );

    if (municipality != null) {
      setState(() {
        widget.codeController.text = municipality.code;
        widget.nameController.text = municipality.name;
      });
    }
  }
}
