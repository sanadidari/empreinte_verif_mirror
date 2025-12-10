import 'package:flutter/material.dart';
import '../models/projet.dart';

class ProjetsView extends StatelessWidget {
  final List<Projet> projets;
  final String employeeName;

  const ProjetsView({
    super.key,
    required this.projets,
    required this.employeeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Projets de $employeeName"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: projets.length,
        itemBuilder: (context, index) {
          final p = projets[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 3,
            child: ListTile(
              title: Text(
                p.titre,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${p.description}\nDébut : ${p.semaineDebut}"),
            ),
          );
        },
      ),
    );
  }
}
