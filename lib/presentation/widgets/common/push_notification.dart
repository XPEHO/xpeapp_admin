import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

class PushNotification {
  static void showSimpleNotification({
    required String title,
    required String message,
    VoidCallback? onActionPressed,
  }) {
    if (kIsWeb) {
      try {
        if (html.Notification.permission == 'granted') {
          final notification = html.Notification(
            title,
            body: message,
            tag: 'xpeapp-admin-idea-notification',
          );

          notification.onClick.listen((_) {
            notification.close();
            onActionPressed?.call();
          });

          return;
        }
      } catch (_) {
        // Browser notifications can fail silently depending on browser/OS policy.
      }
    }
  }
}
