import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PictureProfile extends ConsumerWidget {
  final Future<String> imagePath;
  final double size;

  const PictureProfile({
    super.key,
    required this.imagePath,
    required this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: FutureBuilder(
        future: imagePath,
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
  }
}
