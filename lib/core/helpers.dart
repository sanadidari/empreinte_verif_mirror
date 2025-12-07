// ===========================================================
// helpers.dart — Fonctions utilitaires globales
// ===========================================================

class Helpers {
  static bool isNullOrEmpty(String? txt) {
    return txt == null || txt.trim().isEmpty;
  }

  static String capitalize(String txt) {
    if (txt.isEmpty) return txt;
    return txt[0].toUpperCase() + txt.substring(1);
  }
}
