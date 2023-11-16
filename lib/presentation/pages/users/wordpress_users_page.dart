import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/presentation/pages/template/scaffold_template.dart';

class WordpressUsersPage extends ConsumerWidget {
  const WordpressUsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldTemplate(
      appBarTitle: 'Utilisateurs Wordpress',
      appBarLeading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('wordpressUsers')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData && snapshot.data != null) {
                List<XpehoUser> users = snapshot.data!.docs
                    .map(
                      (e) => XpehoUser.fromJson(
                        e.data()
                          ..addAll({
                            'uid': e.id,
                          }),
                      ),
                    )
                    .toList();
                if (users.isEmpty) {
                  return const Center(
                    child: Text('Aucun utilisateur'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      XpehoUser user = users[index];
                      return Expanded(
                        child: ListTile(
                          title: Text(user.name!),
                          subtitle: Text(user.email),
                          trailing: IconButton(
                            onPressed: () => showDeleteUserDialog(
                              context,
                              user,
                            ),
                            icon: const Icon(
                              Icons.delete,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Erreur lors du chargement des utilisateurs',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Aucun utilisateur'),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  showDeleteUserDialog(BuildContext context, XpehoUser user) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Supprimer un utilisateur'),
          content: Text('Voulez-vous vraiment supprimer ${user.name}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('wordpressUsers')
                    .doc(user.uid)
                    .delete();
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Utilisateur supprimé'),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Supprimer'),
            ),
          ],
        );
      },
    );
  }
}
