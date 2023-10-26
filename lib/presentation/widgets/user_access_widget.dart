import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/entities/user_access_entity.dart';

class UserAccessWidget extends StatelessWidget {
  final List<UserAccessEntity> accessList;
  final Map<String, dynamic> accessMap;
  final String uidUser;

  const UserAccessWidget({
    super.key,
    required this.accessList,
    required this.accessMap,
    required this.uidUser,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: accessList.length,
      itemBuilder: (context, index) {
        UserAccessEntity access = accessList[index];
        return ListTile(
          title: Text(access.name),
          subtitle: Text(access.description),
          trailing: Switch(
            value: accessMap[access.idAccess] ?? false,
            onChanged: (value) async => await _updateAccessOfUser(
              uidUser: uidUser,
              access: access,
              value: value,
            ),
          ),
        );
      },
    );
  }

  _updateAccessOfUser({
    required String uidUser,
    required UserAccessEntity access,
    required bool value,
  }) async {
    String accessToUpdate = access.idAccess;
    DocumentReference reference =
        FirebaseFirestore.instance.collection('users').doc(uidUser);
    // Get the access map of the user
    DocumentSnapshot snapshot = await reference.get();
    Map<String, dynamic> accessMap =
        (snapshot.data() as Map<String, dynamic>)['access'];
    // Update the access map of the user
    accessMap[accessToUpdate] = value;
    // Update the user
    await reference.update({
      'access': accessMap,
    });
  }
}
