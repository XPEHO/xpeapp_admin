import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/last_connexion_user.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:intl/intl.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_summary_tile.dart';

class LastConnexionPage extends ConsumerStatefulWidget {
  const LastConnexionPage({super.key});

  @override
  ConsumerState<LastConnexionPage> createState() => _LastConnexionPageState();
}

class _LastConnexionPageState extends ConsumerState<LastConnexionPage> {
  final Map<String, bool> _expanded = {};

  Map<String, List<LastConnexionUser>> groupUsersByConnexion(
      List<LastConnexionUser> users) {
    final now = DateTime.now();
    final today = <LastConnexionUser>[];
    final less48h = <LastConnexionUser>[];
    final less7d = <LastConnexionUser>[];
    final more7d = <LastConnexionUser>[];
    for (var user in users) {
      final last = user.lastConnexion;
      final diff = now.difference(last);
      if (diff.inDays == 0) {
        today.add(user);
      } else if (diff.inHours < 48) {
        less48h.add(user);
      } else if (diff.inDays < 7) {
        less7d.add(user);
      } else {
        more7d.add(user);
      }
    }
    return {
      'Aujourd\'hui': today,
      'Moins de 48h': less48h,
      'Moins de 7 jours': less7d,
      'Plus de 7 jours': more7d,
    };
  }

  @override
  Widget build(BuildContext context) {
    final asyncUsers = ref.watch(lastConnexionUsersProvider);
    return asyncUsers.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur: $e')),
      data: (users) {
        final grouped = groupUsersByConnexion(users);
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              const SizedBox(height: 12),
              const Center(
                  child: Text('Dernières connexions des utilisateurs',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal))),
              Center(
                  child: subtitleWidget(
                      'Ici vous pouvez voir les dernières connexions des utilisateurs')),
              const Divider(),
              ...grouped.entries.expand((entry) {
                if (entry.value.isEmpty) return const <Widget>[];
                return [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(entry.key,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  ...entry.value.map((user) {
                    final formattedDate = DateFormat('dd/MM/yyyy à HH:mm')
                        .format(user.lastConnexion);
                    final key = '${entry.key}_${user.userNicename}';
                    final isExpanded = _expanded[key] ?? false;
                    return AgendaCard(
                      child: Column(
                        children: [
                          AgendaSummaryTile(
                            title: user.userNicename,
                            leadingIcon: Icons.access_time,
                            trailingIcon: isExpanded
                                ? Icons.expand_less
                                : Icons.expand_more,
                            onTap: () {
                              setState(() {
                                _expanded[key] = !isExpanded;
                              });
                            },
                          ),
                          if (isExpanded)
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(),
                                  Text('Dernière connexion : $formattedDate',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black54)),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
                ];
              }),
            ],
          ),
        );
      },
    );
  }
}
