import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Handle the operation and show a snackbar if an error occurs
Future<void> handleOperation({
  required Future<void> Function() operation,
  required WidgetRef ref,
  required BuildContext context,
  required VoidCallback onSuccess,
  List<ProviderOrFamily>? providersToInvalidate,
}) async {
  try {
    await operation();
    // Invalidate the provided providers if any after the operation
    if (providersToInvalidate != null) {
      for (final provider in providersToInvalidate) {
        ref.invalidate(provider);
      }
    }
    // Call the onSuccess callback
    onSuccess();
  } catch (e) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(e.toString()),
      ),
    );
  }
}
