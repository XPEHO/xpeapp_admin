import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:xpeapp_admin/data/entities/config.dart';

class ConfigService {
  Future<Config> initConfig() async {
    // Read config from file
    try {
      final String json = await rootBundle.loadString('config.json');
      return Config.fromJson(jsonDecode(json) as Map<String, dynamic>);
    } catch (e) {
      return Config(baseUrl: '');
    }
  }
}
