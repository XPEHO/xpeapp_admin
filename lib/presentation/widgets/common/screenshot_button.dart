import 'package:flutter/material.dart';
import 'package:xpeapp_admin/data/service/screenshot_service.dart';

class ScreenshotButton extends StatefulWidget {
  final GlobalKey widgetKey;
  final String title;

  const ScreenshotButton({
    super.key,
    required this.widgetKey,
    required this.title,
  });

  @override
  State<ScreenshotButton> createState() => _ScreenshotButtonState();
}

class _ScreenshotButtonState extends State<ScreenshotButton> {
  bool _isCapturing = false;

  Future<void> _takeScreenshot() async {
    if (_isCapturing) return;

    setState(() {
      _isCapturing = true;
    });

    try {
      final fileName = ScreenshotService.generateFileName(widget.title);
      await ScreenshotService.captureAndDownloadWidget(
        key: widget.widgetKey,
        fileName: fileName,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Screenshot "${widget.title}" téléchargé avec succès'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors du screenshot: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Prendre un screenshot du graphique',
      child: IconButton(
        onPressed: _isCapturing ? null : _takeScreenshot,
        icon: _isCapturing
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.camera_alt, size: 18),
        style: IconButton.styleFrom(
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.blue.shade700,
          padding: const EdgeInsets.all(8),
          minimumSize: const Size(32, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(color: Colors.blue.shade200),
          ),
        ),
      ),
    );
  }
}
