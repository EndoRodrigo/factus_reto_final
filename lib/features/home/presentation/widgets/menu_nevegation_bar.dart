import 'package:flutter/material.dart';

class MenuNevegationBar extends StatefulWidget {
  final int indexMenu;
  final ValueChanged<int> onIndexChanged;

  const MenuNevegationBar({super.key, required this.indexMenu, required this.onIndexChanged});

  @override
  State<MenuNevegationBar> createState() => _MenuNevegationBarState();
}

class _MenuNevegationBarState extends State<MenuNevegationBar> {
  @override
  Widget build(BuildContext context) {

    return NavigationBar(
      selectedIndex: widget.indexMenu,
      onDestinationSelected: widget.onIndexChanged,
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
