import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/secure_storage.dart';
import 'login_view.dart';

class ActivationView extends StatefulWidget {
  const ActivationView({super.key});

  @override
  State<ActivationView> createState() => _ActivationViewState();
}

class _ActivationViewState extends State<ActivationView> {
  final TextEditingController codeController = TextEditingController();
  String status = "";

  Future<void> activate() async {
    setState(() => status = "Activation en cours…");

    final employeeCode = codeController.text.trim();

    if (employeeCode.isEmpty) {
      setState(() => status = "❌ Veuillez entrer votre code employé.");
      return;
    }

    final result = await ApiService.activateEmployee(employeeCode);

    if (result["success"] == true) {
      final token = result["token"];
      await SecureStorage.saveToken(token);

      setState(() => status = "✅ Activation réussie !");

      await Future.delayed(const Duration(seconds: 1));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginView()),
      );
    } else {
      setState(() => status = "❌ ${result["message"]}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Activation employé")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: codeController,
              decoration: const InputDecoration(
                labelText: "Code employé",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: activate,
              child: const Text("Activer"),
            ),
            const SizedBox(height: 20),
            Text(status),
          ],
        ),
      ),
    );
  }
}
