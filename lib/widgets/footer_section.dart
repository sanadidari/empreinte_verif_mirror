import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Texte explicatif
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Text(
              "عبر نظام QRpuf، كل وثيقة يفحصها المستخدم تتحول إلى دليل رقمي فريد ومشفر "
              "يثبت الزمن والمكان والمصدر بموثوقية لا تقبل الدّحض.",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black87, fontSize: 15, height: 1.6),
            ),
          ),

          // Image QRpuf en bas
          Image.asset(
            "assets/images/QRPuf3.png",
            width: 260,
          ),

          // Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            color: const Color(0xFF5D59B5),
            child: const Text(
              "جميع الحقوق محفوظة لـ (Sanad Idari) - 2026",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
