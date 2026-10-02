import 'package:factus_reto_final/features/home/presentation/widgets/menu_app_bar.dart';
import 'package:factus_reto_final/features/home/presentation/widgets/menu_nevegation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexMenu = 0;

  final List<Widget> pages = const [
    Center(child: Text('Factus')),
    //InvoicesPage(),
    Center(child: Text('Crear factura')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(),
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
