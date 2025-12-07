// ==================================================================
// projet_model.dart — Modèle de données PRO pour un Projet
// Projet : empreinte_verif
// Auteur : Agent Militaire v3.0
// ==================================================================

class Projet {
  final int id;
  final String titre;
  final String description;
  final DateTime dateCreation;

  Projet({
    required this.id,
    required this.titre,
    required this.description,
    required this.dateCreation,
  });

  // ---------------------------------------------------------------
  // Factory : construire depuis JSON
  // ---------------------------------------------------------------
  factory Projet.fromJson(Map<String, dynamic> json) {
    return Projet(
      id: json['id'] ?? 0,
      titre: json['titre'] ?? "Sans titre",
      description: json['description'] ?? "",
      dateCreation: DateTime.tryParse(json['dateCreation'] ?? "") ??
          DateTime.now(),
    );
  }

  // ---------------------------------------------------------------
  // Convertir en JSON
  // ---------------------------------------------------------------
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "titre": titre,
      "description": description,
      "dateCreation": dateCreation.toIso8601String(),
    };
  }

  // ---------------------------------------------------------------
  // Copie modifiée (pour mises à jour immutable)
  // ---------------------------------------------------------------
  Projet copyWith({
    int? id,
    String? titre,
    String? description,
    DateTime? dateCreation,
  }) {
    return Projet(
      id: id ?? this.id,
      titre: titre ?? this.titre,
      description: description ?? this.description,
      dateCreation: dateCreation ?? this.dateCreation,
    );
  }
}
