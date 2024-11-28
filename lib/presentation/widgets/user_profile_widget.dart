import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/presentation/widgets/picture_profile.dart';
import 'package:xpeapp_admin/providers.dart';

class UserProfileWidget extends ConsumerWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userConnectedProvider);

    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          StreamBuilder(
            stream: ref
                .watch(cloudFirestoreProvider)
                .collection('users')
                .doc(user?.email)
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
                size: 60,
              );
            },
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            (user?.token?.displayName ?? 'Utilisateur')
                .replaceAll(' ', '\n')
                .toUpperCase(),
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
