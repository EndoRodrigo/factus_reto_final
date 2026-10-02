import 'package:flutter/material.dart';

class MenuNevegationBar extends StatefulWidget {
  const MenuNevegationBar({super.key});

  @override
  State<MenuNevegationBar> createState() => _MenuNevegationBarState();
}

class _MenuNevegationBarState extends State<MenuNevegationBar> {

  int _indexMenu = 0;
  @override
  Widget build(BuildContext context) {

    return NavigationBar(
      selectedIndex: _indexMenu,
      onDestinationSelected: (index) {
        _indexMenu = index;
        setState(() {});
      },
      destinations:  const <Widget> [
        _CustomeNavegation(icon: Icons.home, label: 'Home'),
        _CustomeNavegation(icon: Icons.add, label: 'Mas'),
      ],
    );
  }
}

class _CustomeNavegation extends StatelessWidget {
  final IconData icon;
  final String label;

  const new({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(icon: Icon(icon), label: label);
  }
}
