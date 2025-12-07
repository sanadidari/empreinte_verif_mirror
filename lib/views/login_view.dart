// ==================================================================
// login_view.dart — Écran de connexion PRO
// Projet : empreinte_verif
// Auteur : Agent Militaire v3.0
// ==================================================================

import 'package:flutter/material.dart';
import '../services/biometric_service.dart';
import 'biometric_test_view.dart';
import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final BiometricService _bio = BiometricService();
  String status = "";

  Future<void> authenticate() async {
    setState(() => status = "Vérification biométrique...");

    final available = await _bio.isBiometricAvailable();
    if (!available) {
      setState(() =>
          status = "❌ Biométrie non disponible sur cet appareil.");
      return;
    }

    final success = await _bio.authenticate();

    if (success) {
      setState(() => status = "✅ Empreinte validée !");
      await Future.delayed(const Duration(milliseconds: 700));

      // Après succès : naviguer vers l'accueil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeView()),
      );
    } else {
      setState(() => status = "❌ Échec de l'authentification biométrique.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion employé")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Veuillez vous authentifier",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: authenticate,
              child: const Text("Se connecter avec empreinte"),
            ),

            const SizedBox(height: 20),

            Text(
              status,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),

            const SizedBox(height: 40),

            // Bouton vers le test biométrique déjà installé
            TextButton(
              child: const Text("Tester la biométrie"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BiometricTestView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
