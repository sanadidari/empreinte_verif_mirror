// ===========================================================
// home_view.dart — Écran principal
// ===========================================================

import 'package:flutter/material.dart';
import '../config/app_config.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
      ),
      body: Center(
        child: Text(
          "Bienvenue dans ${AppConfig.appName}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
