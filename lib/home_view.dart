// ===========================================================
// home_view.dart — Écran principal
// ===========================================================

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import 'biometric_test_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            Text(
              "Bienvenue dans ${AppConfig.appName}",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              child: const Text("Tester la biométrie"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BiometricTestView(),
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
