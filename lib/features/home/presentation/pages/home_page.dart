import 'package:factus_reto_final/features/home/presentation/widgets/menu_app_bar.dart';
import 'package:factus_reto_final/features/home/presentation/widgets/menu_nevegation_bar.dart';
import 'package:factus_reto_final/features/product/presentation/pages/item_from_page.dart';
import 'package:flutter/material.dart';

import '../widgets/action_card.dart';
import '../widgets/bashboard_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexMenu = 0;

  final List<Widget> pages = const [
    _HomeDashboard(),
    ProductFormPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(),
      body: pages[indexMenu],
      bottomNavigationBar: MenuNevegationBar(
        indexMenu: indexMenu,
        onIndexChanged: (index) {
          setState(() {
            indexMenu = index;
          });
        },
      ),
    );
  }
}

class _HomeDashboard extends StatelessWidget {
  const _HomeDashboard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bienvenida
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Text(
                  '¡Bienvenido! 👋',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Gestiona tu facturación electrónica '
                  'de forma sencilla.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Título
          Text(
            'Tu facturación',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Estadísticas
          Row(
            children: [
              Expanded(
                child: BashboardCard(
                  icon: Icons.receipt_long_outlined,
                  title: 'Facturas',
                  value: '0',
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: BashboardCard(
                  icon: Icons.check_circle_outline,
                  title: 'Emitidas',
                  value: '0',
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          Text(
            'Acciones rápidas',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          // Consultar facturas
          ActionCard(
            icon: Icons.receipt_long_outlined,
            title: 'Consultar facturas',
            subtitle: 'Revisa las facturas electrónicas emitidas',
            onTap: () {
              // Acción para consultar facturas
            },
          ),

          const SizedBox(height: 12),

          // Crear producto
          ActionCard(
            icon: Icons.inventory_2_outlined,
            title: 'Crear producto',
            subtitle: 'Registra un nuevo producto o ítem para facturar',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
