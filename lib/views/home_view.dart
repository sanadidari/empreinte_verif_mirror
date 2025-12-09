// ===========================================================
// home_view.dart — Écran principal PRO avec données employé
// ===========================================================

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../projets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Récupération des arguments envoyés par LoginView
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final employeeId = args["employeeId"];
    final employeeName = args["employeeName"];

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue $employeeName 👋",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              child: const Text("Voir mes projets"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProjetsPage(
                      employeeId: employeeId,
                      employeeName: employeeName,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
