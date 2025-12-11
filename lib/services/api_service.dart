import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://empreinte-verif-api.vercel.app/api";

  // 🔵 Activation employé
  static Future<dynamic> activateEmployee(String employeeCode) async {
    final url = Uri.parse("$baseUrl/activate_employee/");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"employee_code": employeeCode}),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Erreur : $e"};
    }
  }

  // 🔵 Authentification biométrique (token)
  static Future<dynamic> authEmployee(String token) async {
    final url = Uri.parse("$baseUrl/auth_employee/");

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

  // 🔵 Récupération des projets
  static Future<dynamic> getProjects(int employeeId) async {
    final url = Uri.parse("$baseUrl/get_projects/?employee_id=$employeeId");

    try {
      final response = await http.get(url);
      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": "Erreur : $e"};
    }
  }
}
