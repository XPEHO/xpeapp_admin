import 'package:xpeapp_admin/data/enum/idea_box_menu.dart';

class IdeaUtils {
  /// Convertit un statut anglais en français
  static String getStatusInFrench(String status) {
    switch (status) {
      case 'pending':
        return 'En attente';
      case 'approved':
        return 'Approuvée';
      case 'implemented':
        return 'Implémentée';
      case 'rejected':
        return 'Rejetée';
      default:
        return 'En attente';
    }
  }

  /// Convertit un enum IdeaBoxMenu en string pour l'API
  static String? enumToApiStatus(IdeaBoxMenu filter) {
    switch (filter) {
      case IdeaBoxMenu.all:
        return null;
      case IdeaBoxMenu.pending:
        return 'pending';
      case IdeaBoxMenu.approved:
        return 'approved';
      case IdeaBoxMenu.implemented:
        return 'implemented';
      case IdeaBoxMenu.rejected:
        return 'rejected';
    }
  }

  /// Convertit un enum IdeaBoxMenu en titre français
  static String getFilterTitle(IdeaBoxMenu filter) {
    switch (filter) {
      case IdeaBoxMenu.all:
        return 'Toutes les idées';
      case IdeaBoxMenu.pending:
        return 'En attente';
      case IdeaBoxMenu.approved:
        return 'Approuvées';
      case IdeaBoxMenu.implemented:
        return 'Implémentées';
      case IdeaBoxMenu.rejected:
        return 'Rejetées';
    }
  }

  /// Retourne les transitions de statut possibles pour un statut donné
  static List<String> getAvailableStatusTransitions(String currentStatus) {
    switch (currentStatus) {
      case 'pending':
        return ['approved', 'rejected'];
      case 'approved':
        return ['implemented', 'rejected', 'pending'];
      case 'implemented':
        return ['pending'];
      case 'rejected':
        return ['pending'];
      default:
        return ['approved', 'rejected'];
    }
  }
}
