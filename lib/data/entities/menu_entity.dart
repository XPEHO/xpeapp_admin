import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/enum/admin_access.dart';

class MenuEntity {
  final int id;
  final String title;
  final IconData asset;
  final AdminAccess access;

  MenuEntity({
    required this.id,
    required this.title,
    required this.asset,
    required this.access,
  });
}
