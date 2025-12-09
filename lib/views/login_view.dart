// ==================================================================
// login_view.dart — Authentification biométrique + API (Version PRO)
// Projet : empreinte_verif
// ==================================================================

import 'package:flutter/material.dart';
import '../services/biometric_service.dart';
import '../services/api_service.dart';
import '../services/secure_storage.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final BiometricService _bio = BiometricService();
  String status = "";

  Future<void> authenticate() async {
    setState(() => status = "Scanner votre empreinte...");

    // --------------------------------------------------------
    // 1) Vérifier disponibilité biométrie
    // --------------------------------------------------------
    final available = await _bio.isBiometricAvailable();
    if (!available) {
      setState(() => status = "❌ Biométrie non disponible.");
      return;
    }

    // --------------------------------------------------------
    // 2) Scanner l’empreinte
    // --------------------------------------------------------
    final success = await _bio.authenticate();
    if (!success) {
      setState(() => status = "❌ Échec de l’authentification biométrique.");
      return;
    }

    setState(() => status = "Empreinte validée ✔");

    // --------------------------------------------------------
    // 3) Génération d’un token local
    //    (selon ton backend, ici format simple)
    // --------------------------------------------------------
    final generatedToken = DateTime.now().millisecondsSinceEpoch.toString();
    await SecureStorage.saveToken(generatedToken);

    setState(() => status = "Token généré : $generatedToken");

    // --------------------------------------------------------
    // 4) Appel API auth_employee
    // --------------------------------------------------------
    final response = await ApiService.authEmployee(generatedToken);

    if (response["success"] == false) {
      setState(() => status = "❌ API : ${response["message"]}");
      return;
    }

    // --------------------------------------------------------
    // 5) Extraction données employé
    // --------------------------------------------------------
    final employeeId = response["employee"]["id"];
    final employeeName = response["employee"]["nom"];

    // --------------------------------------------------------
    // 6) Navigation avec données réelles
    // --------------------------------------------------------
    if (!mounted) return;
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        "employeeId": employeeId,
        "employeeName": employeeName,
      },
    );
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
              child: const Text("Se connecter avec l’empreinte"),
            ),

            const SizedBox(height: 20),

            Text(
              status,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
