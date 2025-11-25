import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

class ScreenshotService {
  /// Capture un widget via sa GlobalKey et télécharge l'image
  static Future<void> captureAndDownloadWidget({
    required GlobalKey key,
    required String fileName,
  }) async {
    try {
      final imageBytes = await _captureWidget(key);
      if (imageBytes != null) {
        await _downloadImage(imageBytes, fileName);

        debugPrint('Screenshot sauvegardé: $fileName');
      } else {
        throw Exception('Impossible de capturer le widget');
      }
    } catch (e) {
      debugPrint('Erreur lors de la capture: $e');
      rethrow;
    }
  }

  /// Capture un widget en image PNG
  static Future<Uint8List?> _captureWidget(GlobalKey key) async {
    try {
      // Attendre que le widget soit complètement rendu
      await Future.delayed(const Duration(milliseconds: 100));

      final RenderObject? renderObject = key.currentContext?.findRenderObject();
      if (renderObject is RenderRepaintBoundary) {
        // Capturer avec une bonne résolution
        final ui.Image image = await renderObject.toImage(pixelRatio: 2.0);
        final ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        return byteData?.buffer.asUint8List();
      }
    } catch (e) {
      debugPrint('Erreur lors de la capture du widget: $e');
    }
    return null;
  }

  static Future<void> _downloadImage(
      Uint8List imageBytes, String fileName) async {
    if (kIsWeb) {
      // Pour le web: téléchargement direct
      final blob = html.Blob([imageBytes], 'image/png');
      final url = html.Url.createObjectUrlFromBlob(blob);

      html.AnchorElement(href: url)
        ..setAttribute('download', '$fileName.png')
        ..click();

      html.Url.revokeObjectUrl(url);
    } else {
      // Pour mobile: non implémenté dans cette version
      throw UnsupportedError('Screenshot mobile non implémenté');
    }
  }

  /// Génère un nom de fichier unique basé sur le titre et la date
  static String generateFileName(String title) {
    final now = DateTime.now();
    final timestamp =
        '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';
    final cleanTitle =
        title.replaceAll(RegExp(r'[^\w\s-]'), '').replaceAll(' ', '_');
    return 'QVST_${cleanTitle}_$timestamp';
  }
}
