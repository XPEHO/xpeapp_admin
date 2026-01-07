import 'package:flutter/material.dart';
import 'package:xpeapp_admin/presentation/widgets/agenda/agenda_card.dart';

class LastConnectionUserDisplay {
  final String name;
  final String connexionDate;

  const LastConnectionUserDisplay({
    required this.name,
    required this.connexionDate,
  });
}

class LastConnectionSummaryTile extends StatelessWidget {
  final String periodLabel;
  final List<LastConnectionUserDisplay> users;
  final bool initiallyExpanded;

  const LastConnectionSummaryTile({
    super.key,
    required this.periodLabel,
    required this.users,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return AgendaCard(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text(
            periodLabel,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          initiallyExpanded: initiallyExpanded,
          children: users.isEmpty
              ? [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Aucun utilisateur'),
                  ),
                ]
              : users
                  .map(
                    (user) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(user.name),
                          Text(user.connexionDate),
                        ],
                      ),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
