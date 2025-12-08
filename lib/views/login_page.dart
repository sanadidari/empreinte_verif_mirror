import 'package:flutter/material.dart';
import 'widgets/header_section.dart';
import 'widgets/login_form.dart';
import 'widgets/footer_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Toute la page en arabe
      child: Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: Column(
          children: const [
            HeaderSection(),   // Section du haut (bleue)
            LoginForm(),       // Carte de login
            FooterSection(),   // Image + texte en bas
          ],
        ),
      ),
    );
  }
}
