import 'package:factus_reto_final/core/network/TokenStorage.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/pages/home_page.dart';
import 'auth_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final session =TokenStorage();
    final token = await session.getAccessToken();

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      // Ya existe un token almacenado
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      );
    } else {
      // No hay token: mostrar login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AuthPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}