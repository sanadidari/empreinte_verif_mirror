// ==================================================================
// api_service.dart — Service API HTTP PRO
// Projet : empreinte_verif
// Auteur : Agent Militaire v3.0
// ==================================================================

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const Duration _timeout = Duration(seconds: 8);

  // Exemple de baseUrl (à configurer dans AppConfig si tu veux centraliser)
  static const String baseUrl = "https://exemple.api.com";

  // ---------------------------------------------------------------
  // Méthode GET générique
  // ---------------------------------------------------------------
  static Future<dynamic> get(String endpoint) async {
    final url = Uri.parse("$baseUrl$endpoint");

    try {
      final response =
          await http.get(url).timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      throw Exception("Erreur GET sur $endpoint : $e");
    }
  }

  // ---------------------------------------------------------------
  // Méthode POST générique
  // ---------------------------------------------------------------
  static Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl$endpoint");

    try {
      final response = await http
          .post(
            url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(data),
          )
          .timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      throw Exception("Erreur POST sur $endpoint : $e");
    }
  }

  // ---------------------------------------------------------------
  // Méthode DELETE générique (optionnel)
  // ---------------------------------------------------------------
  static Future<dynamic> delete(String endpoint) async {
    final url = Uri.parse("$baseUrl$endpoint");

    try {
      final response =
          await http.delete(url).timeout(_timeout);

      return _handleResponse(response);
    } catch (e) {
      throw Exception("Erreur DELETE sur $endpoint : $e");
    }
  }

  // ---------------------------------------------------------------
  // Gestion des réponses HTTP
  // ---------------------------------------------------------------
  static dynamic _handleResponse(http.Response response) {
    final status = response.statusCode;

    if (status >= 200 && status < 300) {
      try {
        return jsonDecode(response.body);
      } catch (_) {
        return response.body; // si pas JSON
      }
    }

    throw Exception(
        "Erreur HTTP [$status] : ${response.body}");
  }
}
