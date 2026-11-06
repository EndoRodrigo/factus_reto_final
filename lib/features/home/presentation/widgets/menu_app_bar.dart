import 'package:factus_reto_final/features/Establishments/presentation/pages/establistmest_form_pages.dart';
import 'package:flutter/material.dart';


class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {

  const MenuAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 120,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          'assets/images/logo-factus.png',
          fit: BoxFit.scaleDown,
          color: Colors.black,
          //width: 200,
        ),
      ),


      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              iconSize: 20,
              color: Colors.black87,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EstablistmestFormPages()),
                );
              }, icon: const Icon(Icons.person),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}