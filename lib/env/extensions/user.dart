import 'package:firebase_auth/firebase_auth.dart';
import 'package:xpeapp_admin/env/extensions/string.dart';

extension GetNameOfUser on User {
  String getName() {
    // Check if displayName is not null
    if (displayName != null) {
      return displayName!;
    } else {
      String email = this.email ?? '';

      // Split the email by @ and then by . to get the name parts
      List<String> nameParts = email.split('@')[0].split('.');

      // Set the first name to the first part of the nameParts and capitalize it
      String firstName = nameParts[0].capitalize();
      String lastName = nameParts.length > 1 ? nameParts[1].toUpperCase() : '';

      return '$firstName $lastName'.trim();
    }
  }
}
