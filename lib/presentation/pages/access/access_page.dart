import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/xpeho_user.dart';
import 'package:xpeapp_admin/presentation/widgets/picture_profile.dart';
import 'package:xpeapp_admin/providers.dart';

class AccessPage extends ConsumerWidget {
  const AccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
                  StreamBuilder(
                    stream: ref
                        .watch(cloudFirestoreProvider)
                        .collection('users')
                        .doc(user.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      String imagePath =
                          snapshot.data?.data()?['image'] as String? ?? '';
                      return PictureProfile(
                        imagePath: ref
                            .watch(storageFirebaseProvider)
                            .ref()
                            .child(
                              imagePath,
                            )
                            .getDownloadURL(),
                        size: 80,
                      );
                    },
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
    );
  }
}
