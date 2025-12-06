// ===========================================================
// biometric_test_view.dart — Test simple de biométrie
// ===========================================================

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricTestView extends StatefulWidget {
  const BiometricTestView({super.key});

  @override
  State<BiometricTestView> createState() => _BiometricTestViewState();
}

class _BiometricTestViewState extends State<BiometricTestView> {
  final LocalAuthentication auth = LocalAuthentication();

  String status = "Aucun test encore effectué.";

  Future<void> runTest() async {
    try {
      // Vérifier si biométrie disponible
      final bool canCheck = await auth.canCheckBiometrics;

      if (!canCheck) {
        setState(() {
          status = "❌ Le téléphone ne supporte pas la biométrie.";
        });
        return;
      }

      // Vérifier types disponibles
      final types = await auth.getAvailableBiometrics();

      // Lancer l'authentification
      final bool success = await auth.authenticate(
        localizedReason: "Test de biométrie",
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: false,
          useErrorDialogs: true,
        ),
      );

      setState(() {
        status = success
            ? "✅ TEST RÉUSSI — empreinte détectée."
            : "❌ TEST ÉCHOUÉ — empreinte non validée.";
      });

    } catch (e) {
      setState(() {
        status = "⚠️ ERREUR : $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Biométrie")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              status,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: runTest,
              child: const Text("Lancer le test"),
            ),
          ],
        ),
      ),
    );
  }
}
