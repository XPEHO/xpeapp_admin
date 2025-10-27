import 'package:xpeapp_admin/data/enum/idea_box_menu.dart';

class IdeaUtils {
  // Constantes pour les statuts en français
  static const String _statusPending = 'En attente';
  static const String _statusApproved = 'Approuvée';
  static const String _statusImplemented = 'Implémentée';
  static const String _statusRejected = 'Rejetée';

  // Constantes pour les titres de filtres
  static const String _filterAllIdeas = 'Toutes les idées';
  static const String _filterApproved = 'Approuvées';
  static const String _filterImplemented = 'Implémentées';
  static const String _filterRejected = 'Rejetées';

  /// Convertit un statut anglais en français
  static String getStatusInFrench(String status) {
    switch (status) {
      case 'pending':
        return _statusPending;
      case 'approved':
        return _statusApproved;
      case 'implemented':
        return _statusImplemented;
      case 'rejected':
        return _statusRejected;
      default:
        return _statusPending;
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
        return _filterAllIdeas;
      case IdeaBoxMenu.pending:
        return _statusPending;
      case IdeaBoxMenu.approved:
        return _filterApproved;
      case IdeaBoxMenu.implemented:
        return _filterImplemented;
      case IdeaBoxMenu.rejected:
        return _filterRejected;
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
