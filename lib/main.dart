// ===============================================================
// main.dart — Point d'entrée principal de l'application
// Projet : empreinte_verif
// Version : PRO Military v3.1
// ===============================================================

import 'package:flutter/material.dart';

// Configuration globale
import 'config/app_config.dart';

// Thème général
import 'core/theme.dart';

// Vue principale (LOGIN)
import 'views/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // (optionnel) Initialisation future : services, biométrie, API, etc.
  // ex: await Firebase.initializeApp(); (si tu ajoutes un backend futur)

  runApp(const EmpreinteVerifApp());
}

class EmpreinteVerifApp extends StatelessWidget {
  const EmpreinteVerifApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: AppConfig.debug,

      // Thème global
      theme: AppTheme.lightTheme,

      // Vue de démarrage : AUTHENTIFICATION BIOMÉTRIQUE
      home: const LoginView(),
    );
  }
}
