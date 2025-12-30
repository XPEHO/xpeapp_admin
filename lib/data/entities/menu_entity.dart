import 'package:flutter/material.dart';

class MenuEntity {
  final int id;
  final String title;
  final IconData asset;

  MenuEntity({
    required this.id,
    required this.title,
    required this.asset,
  });

  static List<MenuEntity> getDefaultMenu() {
    return [
      MenuEntity(id: 1, title: 'Newsletters', asset: Icons.mail),
      MenuEntity(id: 2, title: 'Feature Flipping', asset: Icons.settings),
      MenuEntity(id: 6, title: 'Dernière Connexion', asset: Icons.access_time),
      MenuEntity(id: 3, title: 'QVST', asset: Icons.question_answer),
      MenuEntity(id: 4, title: 'Agenda', asset: Icons.calendar_today),
      MenuEntity(id: 5, title: 'Idea Box', asset: Icons.lightbulb),
    ];
  }
}
