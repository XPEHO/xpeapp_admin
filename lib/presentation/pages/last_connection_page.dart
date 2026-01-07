import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/colors.dart';
import 'package:xpeapp_admin/data/entities/last_connection_user.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';
import 'package:xpeapp_admin/presentation/pages/template/subtitle.dart';
import 'package:xpeapp_admin/presentation/widgets/last_connection/last_connexion_summary_tile.dart';
import 'package:xpeapp_admin/providers.dart';
import 'package:intl/intl.dart';

class LastConnectionPage extends ConsumerStatefulWidget {
  const LastConnectionPage({super.key});

  @override
  ConsumerState<LastConnectionPage> createState() => _LastConnexionPageState();
}

class _LastConnexionPageState extends ConsumerState<LastConnectionPage> {
  Map<String, List<LastConnectionUser>> groupUsersByConnexion(
    List<LastConnectionUser> users,
  ) {
    final now = DateTime.now();

    bool lessThanDays(LastConnectionUser u, int days) =>
        now.difference(u.lastConnexion).inDays < days;

    return {
      'Moins de 7 jours': users.where((u) => lessThanDays(u, 7)).toList(),
      'Moins d\'un mois': users
          .where((u) => !lessThanDays(u, 7) && lessThanDays(u, 30))
          .toList(),
      'Plus d\'un mois': users.where((u) => !lessThanDays(u, 30)).toList(),
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
              _headerOfLastConnectionPage(),
              ...grouped.entries.map(_buildGroup),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Recharger',
            backgroundColor: kDefaultXpehoColor,
            onPressed: () => ref.invalidate(lastConnexionUsersProvider),
            child: const Icon(Icons.refresh, color: Colors.white),
          ),
        );
      },
    );
  }

  Widget _headerOfLastConnectionPage() => Column(
        children: [
          const SizedBox(height: 12),
          const Text(
            'Dernières connexions des utilisateurs',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          subtitleWidget(
            'Ici vous pouvez voir les dernières connexions des utilisateurs',
          ),
          const Divider(),
        ],
      );

  Widget _buildGroup(MapEntry<String, List<LastConnectionUser>> entry) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: LastConnectionSummaryTile(
        periodLabel: entry.key,
        users: entry.value.map(_mapUser).toList(),
      ),
    );
  }

  LastConnectionUserDisplay _mapUser(LastConnectionUser user) {
    return LastConnectionUserDisplay(
      name: '${user.firstname.capitalize()} ${user.lastname.capitalize()}',
      connexionDate:
          DateFormat('dd/MM/yyyy à HH:mm').format(user.lastConnexion),
    );
  }
}
