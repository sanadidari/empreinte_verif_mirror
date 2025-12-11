import 'package:flutter/material.dart';
import 'package:empreinte_verif/views/login_view.dart';
import 'package:empreinte_verif/views/activation_view.dart';
import 'services/secure_storage.dart';

void main() {
  runApp(const EmpreinteApp());
}

class EmpreinteApp extends StatefulWidget {
  const EmpreinteApp({super.key});

  @override
  State<EmpreinteApp> createState() => _EmpreinteAppState();
}

class _EmpreinteAppState extends State<EmpreinteApp> {
  Future<bool> hasToken() async {
    final token = await SecureStorage.getToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Empreinte Vérif",
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: hasToken(),
        builder: (context, snapshot) {
          // Attente
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final activated = snapshot.data!;

          // 🔵 SI ACTIVATION MANQUANTE → ACTIVATE
          if (!activated) {
            return const ActivationView();
          }

          // 🔵 SINON → LOGIN BIOMÉTRIQUE
          return const LoginView();
        },
      ),
    );
  }
}
