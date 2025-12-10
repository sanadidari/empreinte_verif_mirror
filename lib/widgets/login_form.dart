import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      margin: const EdgeInsets.only(top: -30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Ligne: إنشاء حساب + Logo QRpuf
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "إنشاء حساب",
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
              Image.asset(
                "assets/images/QRPuf3.png",
                height: 32,
              )
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "تسجيل الدخول",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Champ email
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xffF5F6FA),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerRight,
            child: const Text(
              "البريد الإلكتروني",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),

          const SizedBox(height: 12),

          // Champ password
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xffF5F6FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "رمز الدخول",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Icon(Icons.lock_outline, size: 20, color: Colors.grey),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Forgot
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "نسيت",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),

          const SizedBox(height: 16),

          // Bouton retour
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black54),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
