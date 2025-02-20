import 'dart:convert';
import 'dart:typed_data';

import 'package:url_launcher/url_launcher.dart';

///
/// FileService is used to manage files in web context
///
class FileService {
  void downloadFile(String data, Uint8List bytes) {
    final uri = "data:$data;base64,${base64Encode(bytes)}";
    launchUrl(Uri.parse(uri));
  }
}
