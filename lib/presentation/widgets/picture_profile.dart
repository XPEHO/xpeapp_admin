import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpeapp_admin/providers.dart';

class PictureProfile extends ConsumerWidget {
  final String? uid;
  final double size;

  const PictureProfile({
    Key? key,
    this.uid,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref
          .watch(cloudFirestoreProvider)
          .collection('users')
          .doc(uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Icon(Icons.error);
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        final storage = ref.watch(storageFirebaseProvider);
        String imagePath = snapshot.data?.data()!['image'];

        final storageRef = storage.ref().child(imagePath);
        return ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: FutureBuilder(
            future: storageRef.getDownloadURL(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Gérer l'erreur de téléchargement ici
                return const Icon(Icons.error);
              } else if (snapshot.hasData) {
                return Image.network(
                  snapshot.data as String,
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                );
              } else {
                return const Icon(Icons.error);
              }
            },
          ),
        );
      },
    );
  }
}
