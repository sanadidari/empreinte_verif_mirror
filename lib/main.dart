// ===============================================================
// main.dart — Architecture PRO avec initialisation Supabase
// Projet : empreinte_verif
// ===============================================================

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'views/login_view.dart';

Future<void> main() async {
  // Nécessaire avant toute initialisation asynchrone
  WidgetsFlutterBinding.ensureInitialized();

  // Initialisation Supabase (PostgreSQL + API REST)
  await Supabase.initialize(
    url: 'https://yodxzkarqxgaciobrgbr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlvZHh6a2FycXhnYWNpb2JyZ2JyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjUzMDU0MTksImV4cCI6MjA4MDg4MTQxOX0.Ex07CGo-pkUj7sxg_eIzNzHrzoBgFtCFdLVsMMhP4GE',
  );

  runApp(const EmpreinteApp());
}

class EmpreinteApp extends StatelessWidget {
  const EmpreinteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sanad Idari - Empreinte Vérif",
      debugShowCheckedModeBanner: false,

      // =============================================================
      // ROUTAGE CENTRAL — SIMPLE ET ROBUSTE
      // =============================================================
      routes: {
        '/': (_) => const LoginView(),
      },
      initialRoute: '/',

      // =============================================================
      // THEME PRO — Material 3 Clean
      // =============================================================
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xfff6f6f6),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          centerTitle: true,
        ),
      ),
    );
  }
}
