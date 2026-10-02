import 'package:factus_reto_final/features/home/presentation/widgets/menu_nevegation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuNevegationBar(),
    );
  }
}
