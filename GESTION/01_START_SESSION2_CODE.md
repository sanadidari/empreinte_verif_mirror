# ================================================================
# MASTER INIT v2.5 — MESSAGE 2 (MILITARY · FULL CODE ONLY)
# Projet : empreinte_verif
# ================================================================

AGENT,
Voici **LA VERSION SOURCE OFFICIELLE ET COMPLÈTE** du projet Flutter + Android + Backend.

Aucune ligne ne doit être modifiée sans ordre.  
Après chargement → exécute SYSTEM SCAN → puis attends les instructions.

================================================================
# 1) ARBORESCENCE OFFICIELLE
================================================================

/
  lib/
    config/app_config.dart
    models/employe.dart
    services/
      api_service.dart
      biometric_service.dart
      secure_storage.dart
    views/
      login_view.dart
      home_view.dart
      biometric_test_view.dart
    main.dart
    projets.dart

  android/
    app/src/...
    build.gradle.kts
    settings.gradle.kts
    gradle.properties

  api/
    auth_employee.ts

  pubspec.yaml

================================================================
# 2) CODE FLUTTER — VERSION COMPLÈTE
================================================================

----------------------------------------------------------------
FILE: /pubspec.yaml
----------------------------------------------------------------
name: empreinte_verif
description: Application de vérification par empreinte digitale
publish_to: "none"
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  local_auth: ^2.3.0
  url_launcher: ^6.2.5
  cupertino_icons: ^1.0.6
  http: ^1.1.0
  flutter_secure_storage: ^9.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.2

flutter:
  uses-material-design: true
  assets:
    - assets/
    - assets/images/

----------------------------------------------------------------
FILE: /lib/main.dart
----------------------------------------------------------------
import 'package:flutter/material.dart';
import 'views/login_view.dart';

void main() {
  runApp(const EmpreinteApp());
}

class EmpreinteApp extends StatelessWidget {
  const EmpreinteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Empreinte Vérif",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => const LoginView(),
      },
      initialRoute: "/",
    );
  }
}

----------------------------------------------------------------
FILE: /lib/config/app_config.dart
----------------------------------------------------------------
class AppConfig {
  static const String appName = "Empreinte Verif";
  static const String version = "1.0.0";
  static const String apiBaseUrl = "https://empreinte-verif-api.vercel.app/api";
  static const bool debug = true;
}

----------------------------------------------------------------
FILE: /lib/models/employe.dart
----------------------------------------------------------------
class Employe {
  final int id;
  final String nom;

  Employe({required this.id, required this.nom});
}

----------------------------------------------------------------
FILE: /lib/services/api_service.dart
----------------------------------------------------------------
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://empreinte-verif-api.vercel.app/api";

  static Future<dynamic> authEmployee(String token) async {
    final url = Uri.parse("$baseUrl/auth_employee");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"token": token}),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Erreur : $e"};
    }
  }

  static Future<dynamic> getProjects(int employeeId) async {
    final url = Uri.parse("$baseUrl/get_projects?employee_id=$employeeId");

    try {
      final response = await http.get(url);
      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Erreur : $e"};
    }
  }
}

----------------------------------------------------------------
FILE: /lib/services/secure_storage.dart
----------------------------------------------------------------
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();
  static const _keyToken = "token";

  static Future<void> saveToken(String token) async {
    await storage.write(key: _keyToken, value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: _keyToken);
  }

  static Future<void> clearToken() async {
    await storage.delete(key: _keyToken);
  }
}

----------------------------------------------------------------
FILE: /lib/services/biometric_service.dart
----------------------------------------------------------------
import 'package:local_auth/local_auth.dart';

class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.canCheckBiometrics;
    } catch (_) {
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (_) {
      return [];
    }
  }

  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: "Veuillez confirmer votre identité",
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: false,
          useErrorDialogs: true,
        ),
      );
    } catch (_) {
      return false;
    }
  }
}

----------------------------------------------------------------
FILE: /lib/views/login_view.dart
----------------------------------------------------------------
import 'package:flutter/material.dart';
import '../services/biometric_service.dart';
import '../services/secure_storage.dart';
import '../services/api_service.dart';
import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bio = BiometricService();
  String status = "";

  Future<void> authenticate() async {
    setState(() => status = "Vérification biométrique…");

    final available = await bio.isBiometricAvailable();
    if (!available) {
      setState(() => status = "❌ Biométrie non disponible.");
      return;
    }

    final ok = await bio.authenticate();
    if (!ok) {
      setState(() => status = "❌ Échec biométrique.");
      return;
    }

    final token = DateTime.now().millisecondsSinceEpoch.toString();
    await SecureStorage.saveToken(token);

    final api = await ApiService.authEmployee(token);

    if (api["success"] == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeView(
            employeeName: api["employee"]["name"],
            employeeId: api["employee"]["id"],
          ),
        ),
      );
    } else {
      setState(() => status = "❌ API: ${api["message"]}");
    }
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
            ElevatedButton(
              onPressed: authenticate,
              child: const Text("Se connecter avec empreinte"),
            ),
            const SizedBox(height: 20),
            Text(status),
          ],
        ),
      ),
    );
  }
}

----------------------------------------------------------------
FILE: /lib/views/home_view.dart
----------------------------------------------------------------
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

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProjetsPage(
          projets: result["data"] ?? [],
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

----------------------------------------------------------------
FILE: /lib/views/biometric_test_view.dart
----------------------------------------------------------------
import 'package:flutter/material.dart';
import '../services/biometric_service.dart';

class BiometricTestView extends StatefulWidget {
  const BiometricTestView({super.key});

  @override
  State<BiometricTestView> createState() => _BiometricTestViewState();
}

class _BiometricTestViewState extends State<BiometricTestView> {
  final bio = BiometricService();
  String status = "En attente…";

  Future<void> test() async {
    setState(() => status = "Test en cours…");

    final ok = await bio.authenticate();

    setState(() =>
        status = ok ? "✅ Authentification réussie" : "❌ Authentification échouée");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test biométrique")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(status),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: test,
              child: const Text("Tester"),
            ),
          ],
        ),
      ),
    );
  }
}

----------------------------------------------------------------
FILE: /lib/projets.dart
----------------------------------------------------------------
import 'package:flutter/material.dart';

class ProjetsPage extends StatelessWidget {
  final List<dynamic> projets;
  final String employeeName;

  const ProjetsPage({
    super.key,
    required this.projets,
    required this.employeeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projets de $employeeName"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: projets.length,
        itemBuilder: (context, index) {
          final p = projets[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              title: Text(
                p["titre"] ?? "Sans titre",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                (p["description"] ?? "") +
                    "\nDébut : ${p["semaine_debut"] ?? "N/A"}",
              ),
            ),
          );
        },
      ),
    );
  }
}

================================================================
# 3) BACKEND VERCEL — CODE COMPLET
================================================================

----------------------------------------------------------------
FILE: /api/auth_employee.ts
----------------------------------------------------------------
import { createClient } from "@supabase/supabase-js";

console.log("URL:", process.env.NEXT_PUBLIC_SUPABASE_URL);
console.log("SERVICE_ROLE:", process.env.SUPABASE_SERVICE_ROLE_KEY);

export const config = { runtime: "edge" };

export default async function handler(req: Request) {
  try {
    const body = await req.json().catch(() => null);

    if (!body?.token) {
      return new Response(
        JSON.stringify({ success: false, message: "Token manquant" }),
        { status: 400 }
      );
    }

    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.SUPABASE_SERVICE_ROLE_KEY!
    );

    const { data, error } = await supabase
      .from("employees")
      .select("id, name")
      .eq("token", body.token)
      .single();

    if (error || !data) {
      return new Response(
        JSON.stringify({ success: false, message: "Employé introuvable" }),
        { status: 404 }
      );
    }

    return new Response(
      JSON.stringify({ success: true, employee: data }),
      { status: 200 }
    );
  } catch (err: any) {
    return new Response(
      JSON.stringify({
        success: false,
        message: "Erreur interne du serveur",
        error: err?.message,
      }),
      { status: 500 }
    );
  }
}

================================================================
# 4) SUPABASE — STRUCTURE BD OFFICIELLE
================================================================

TABLE employees :
- id : int
- name : text
- token : text
- created_at : timestamp

TABLE projects :
- id : int
- titre : text
- description : text
- semaine_debut : text
- employe_id : int
- created_at : timestamp

================================================================
# 5) READY SIGNAL — MODE INGÉNIEUR ACTIF
================================================================

Après SCAN tu dois répondre :

**MASTER INIT MESSAGE 2 LOADED — ENGINEER MODE ACTIVE**

================================================================
# FIN — MASTER INIT v2.5
================================================================
