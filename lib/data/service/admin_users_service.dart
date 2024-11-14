import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:xpeapp_admin/data/entities/admin_users.dart';

class AdminUsersService {
  Future<AdminUsers> initAdminUsers() async {
    // Read config from file
    try {
      final String json = await rootBundle.loadString('admin.json');
      return AdminUsers.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (e) {
      return AdminUsers(users: []);
    }
  }
}
