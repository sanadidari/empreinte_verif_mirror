// ===============================================================
// SupabaseService — Gestion complète employés + projets
// ===============================================================

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final supabase = Supabase.instance.client;

  // -----------------------------------------------------------
  // GÉNÉRATION DU TOKEN BIOMÉTRIQUE
  // -----------------------------------------------------------
  static String generateToken() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  // -----------------------------------------------------------
  // LOGIN BIOMÉTRIQUE → AUTO-CREATE USER SI ABSENT
  // -----------------------------------------------------------
  static Future<Map<String, dynamic>> loginWithBiometrics() async {
    final token = generateToken();

    // 1) Chercher l’utilisateur par token
    final existing = await supabase
        .from('employees')
        .select()
        .eq('token', token)
        .maybeSingle();

    if (existing != null) {
      return {
        "success": true,
        "employee": existing,
      };
    }

    // 2) Créer automatiquement l’utilisateur
    final inserted = await supabase.from('employees').insert({
      'name': "Employé",
      'token': token,
    }).select().single();

    return {
      "success": true,
      "employee": inserted,
    };
  }

  // -----------------------------------------------------------
  // RÉCUPÉRER LES PROJETS D’UN EMPLOYÉ
  // -----------------------------------------------------------
  static Future<List<dynamic>> getProjects(int employeeId) async {
    final result = await supabase
        .from('projects')
        .select()
        .eq('employee_id', employeeId);

    return result;
  }
}
