// ===============================================================
// HomeView — Accueil employé + accès aux projets
// ===============================================================

import 'package:flutter/material.dart';
import '../services/supabase_service.dart';
import '../projets.dart';

class HomeView extends StatelessWidget {
  final String employeeName;
  final int employeeId;

  const HomeView({
    super.key,
    required this.employeeName,
    required this.employeeId,
  });

  Future<void> openProjects(BuildContext context) async {
    final projects = await SupabaseService.getProjects(employeeId);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProjetsPage(
          projets: projects,
          employeeName: employeeName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenue $employeeName"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => openProjects(context),
              child: const Text("Voir les projets"),
            ),
          ],
        ),
      ),
    );
  }
}
