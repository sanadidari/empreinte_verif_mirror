import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../services/secure_storage.dart';
import '../services/api_service.dart';
import '../projets.dart';

class HomeView extends StatelessWidget {
  final String employeeName;
  final int employeeId;

  const HomeView({
    super.key,
    required this.employeeName,
    required this.employeeId,
  });

  Future<void> logout(BuildContext context) async {
    await SecureStorage.clearToken();
    Navigator.pushNamedAndRemoveUntil(context, "/", (_) => false);
  }

  Future<void> openProjects(BuildContext context) async {
    final result = await ApiService.getProjects(employeeId);

    // 🔥 Nouvelle gestion d’erreur PRO
    if (result == null ||
        result is! Map ||
        result["success"] == false ||
        result["data"] == null) {
      final message = result?["message"] ?? "Erreur inconnue.";

      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Erreur"),
          content: Text("Impossible de charger les projets.\n$message"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return; // ⛔ empêche la navigation
    }

    // ✔ Données valides → on navigue
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProjetsPage(
          projets: result["data"],
          employeeName: employeeName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenue $employeeName"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => openProjects(context),
              child: const Text("Voir les projets"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => logout(context),
              child: const Text("Déconnexion"),
            ),
          ],
        ),
      ),
    );
  }
}
