import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/user_access_entity.dart';

class UserAccessWidget extends StatelessWidget {
  final String uidUser;

  const UserAccessWidget({
    super.key,
    required this.uidUser,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('access').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<UserAccessEntity> accessList = [];
        snapshot.data?.docs.forEach((element) {
          accessList.add(
            UserAccessEntity.fromJson(
              element.data()..['idAccess'] = element.id,
            ),
          );
        });

        return ListView.builder(
          itemCount: accessList.length,
          itemBuilder: (context, index) {
            UserAccessEntity access = accessList[index];
            return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(uidUser)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Get the access map of the user
                Map<String, dynamic> accessMap =
                    (snapshot.data?.data() as Map<String, dynamic>)['access'];
                return ListTile(
                  title: Text(access.name),
                  subtitle: Text(access.description),
                  trailing: Switch(
                    value: accessMap[access.idAccess] ?? false,
                    onChanged: (value) async {
                      String accessToUpdate = access.idAccess;
                      DocumentReference reference = FirebaseFirestore.instance
                          .collection('users')
                          .doc(uidUser);
                      // Get the access map of the user
                      DocumentSnapshot snapshot = await reference.get();
                      Map<String, dynamic> accessMap =
                          (snapshot.data() as Map<String, dynamic>)['access'];
                      // Update the access map of the user
                      accessMap[accessToUpdate] = value;
                      // Update the user
                      await reference.update({'access': accessMap});
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
