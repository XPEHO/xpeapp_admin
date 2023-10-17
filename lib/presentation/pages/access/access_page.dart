import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/presentation/widgets/picture_profile.dart';

class AccessPage extends StatelessWidget {
  const AccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des accès'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<XpehoUser> users = [];
          snapshot.data?.docs.forEach((element) {
            users.add(
              XpehoUser.fromJson(
                element.data()..['uid'] = element.id,
              ),
            );
          });
          return Center(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                XpehoUser user = users[index];
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PictureProfile(
                      uid: user.uid,
                      size: 80,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(user.name ?? user.email),
                        subtitle: Text(user.email),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/access/detail',
                              arguments: {
                                'id': user.uid,
                                'nameOfAccessUser': user.name ?? user.email,
                              },
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
