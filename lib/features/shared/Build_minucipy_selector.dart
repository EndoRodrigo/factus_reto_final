import 'package:flutter/material.dart';

import 'build_municipaly_field.dart';

class BuildMinucipySelector extends StatefulWidget {
  const BuildMinucipySelector({super.key});

  @override
  State<BuildMinucipySelector> createState() => _BuildMinucipySelectorState();
}

class _BuildMinucipySelectorState extends State<BuildMinucipySelector> {
  final TextEditingController _searchController = TextEditingController();
  List<Municipality> _filteredList = colombiaMunicipalities;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filter);
  }

  void _filter() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredList = colombiaMunicipalities.where((m) {
        return m.name.toLowerCase().contains(query) ||
            m.code.contains(query) ||
            m.department.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Seleccionar Municipio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar municipio o código...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: _filteredList.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = _filteredList[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(
                        '${item.department} - Código: ${item.code}',
                      ),
                      onTap: () => Navigator.pop(context, item),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
