import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/projet.dart';

class ProjetService {
  static const String baseUrl =
      "https://sanadidari.com/testftp/test_empreinte/api";

  static Future<List<Projet>> getProjects(int employeeId) async {
    final url = Uri.parse("$baseUrl/get_projects.php?employee_id=$employeeId");

    try {
      final response = await http.get(url);

      final decoded = jsonDecode(response.body);

      if (decoded is List) {
        return decoded.map((e) => Projet.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (_) {
      return [];
    }
  }
}
