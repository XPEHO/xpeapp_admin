import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/data/entities/user_access_entity.dart';
import 'package:xpeapp_admin/presentation/widgets/user_access_widget.dart';
import 'package:xpeapp_admin/providers.dart';

class AccessDetailPage extends ConsumerWidget {
  final String id;
  final String nameOfAccessUser;

  const AccessDetailPage({
    super.key,
    required this.id,
    required this.nameOfAccessUser,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accès de $nameOfAccessUser'),
      ),
      body: StreamBuilder(
        stream:
            ref.watch(cloudFirestoreProvider).collection('access').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<UserAccessEntity> accessList = [];
          snapshot.data?.docs.forEach(
            (element) {
              accessList.add(
                UserAccessEntity.fromJson(
                  element.data()..['idAccess'] = element.id,
                ),
              );
            },
          );
          return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(id)
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
              return UserAccessWidget(
                accessList: accessList,
                uidUser: id,
                accessMap: accessMap,
              );
            },
          );
        },
      ),
    );
  }
}
