import 'package:flutter/material.dart';
import '../services/biometric_service.dart';

class BiometricTestView extends StatefulWidget {
  const BiometricTestView({super.key});

  @override
  State<BiometricTestView> createState() => _BiometricTestViewState();
}

class _BiometricTestViewState extends State<BiometricTestView> {
  final bio = BiometricService();
  String status = "En attente de test…";

  Future<void> _runBiometricTest() async {
    setState(() => status = "Vérification de la biométrie…");

    // Vérifier si biométrie dispo
    final available = await bio.isBiometricAvailable();
    if (!available) {
      setState(() => status = "❌ Biométrie NON disponible sur cet appareil.");
      return;
    }

    // Liste des biométries
    final types = await bio.getAvailableBiometrics();
    if (types.isEmpty) {
      setState(() => status = "❌ Aucune méthode biométrique détectée.");
      return;
    }

    // Lancer authentification
    final success = await bio.authenticate();
    if (success) {
      setState(() => status = "✅ Authentification réussie !");
    } else {
      setState(() => status = "❌ Échec de l’authentification.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Biométrie")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              status,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _runBiometricTest,
              child: const Text("Tester l'empreinte digitale"),
            )
          ],
        ),
      ),
    );
  }
}
