import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/presentation/pages/idea_box/idea_utils.dart';
import 'package:xpeapp_admin/data/enum/idea_box_menu.dart';

void main() {
  group('IdeaUtils', () {
    group('getStatusInFrench', () {
      test('returns correct French labels for all statuses', () {
        expect(IdeaUtils.getStatusInFrench('pending'), 'En attente');
        expect(IdeaUtils.getStatusInFrench('approved'), 'Approuvée');
        expect(IdeaUtils.getStatusInFrench('implemented'), 'Implémentée');
        expect(IdeaUtils.getStatusInFrench('rejected'), 'Rejetée');
      });

      test('returns default for unknown status', () {
        expect(IdeaUtils.getStatusInFrench('unknown_status'), 'En attente');
        expect(IdeaUtils.getStatusInFrench(''), 'En attente');
        expect(IdeaUtils.getStatusInFrench('random'), 'En attente');
      });
    });

    group('enumToApiStatus', () {
      test('returns correct API status strings', () {
        expect(IdeaUtils.enumToApiStatus(IdeaBoxMenu.all), null);
        expect(IdeaUtils.enumToApiStatus(IdeaBoxMenu.pending), 'pending');
        expect(IdeaUtils.enumToApiStatus(IdeaBoxMenu.approved), 'approved');
        expect(
            IdeaUtils.enumToApiStatus(IdeaBoxMenu.implemented), 'implemented');
        expect(IdeaUtils.enumToApiStatus(IdeaBoxMenu.rejected), 'rejected');
      });
    });

    group('getFilterTitle', () {
      test('returns correct filter titles', () {
        expect(IdeaUtils.getFilterTitle(IdeaBoxMenu.all), 'Toutes les idées');
        expect(IdeaUtils.getFilterTitle(IdeaBoxMenu.pending), 'En attente');
        expect(IdeaUtils.getFilterTitle(IdeaBoxMenu.approved), 'Approuvées');
        expect(
            IdeaUtils.getFilterTitle(IdeaBoxMenu.implemented), 'Implémentées');
        expect(IdeaUtils.getFilterTitle(IdeaBoxMenu.rejected), 'Rejetées');
      });
    });

    group('getAvailableStatusTransitions', () {
      test('returns correct transitions for pending status', () {
        final transitions = IdeaUtils.getAvailableStatusTransitions('pending');
        expect(transitions, containsAll(['approved', 'rejected']));
        expect(transitions.length, 2);
      });

      test('returns correct transitions for approved status', () {
        final transitions = IdeaUtils.getAvailableStatusTransitions('approved');
        expect(
            transitions, containsAll(['implemented', 'rejected', 'pending']));
        expect(transitions.length, 3);
      });

      test('returns correct transitions for implemented status', () {
        final transitions =
            IdeaUtils.getAvailableStatusTransitions('implemented');
        expect(transitions, contains('pending'));
        expect(transitions.length, 1);
      });

      test('returns correct transitions for rejected status', () {
        final transitions = IdeaUtils.getAvailableStatusTransitions('rejected');
        expect(transitions, contains('pending'));
        expect(transitions.length, 1);
      });

      test('returns default transitions for unknown status', () {
        final transitions = IdeaUtils.getAvailableStatusTransitions('unknown');
        expect(transitions, containsAll(['approved', 'rejected']));
        expect(transitions.length, 2);
      });

      test('returns default transitions for empty status', () {
        final transitions = IdeaUtils.getAvailableStatusTransitions('');
        expect(transitions, containsAll(['approved', 'rejected']));
        expect(transitions.length, 2);
      });
    });

    group('status consistency', () {
      test('all enum values can be converted to API status', () {
        final enumValues = IdeaBoxMenu.values;

        for (final enumValue in enumValues) {
          final apiStatus = IdeaUtils.enumToApiStatus(enumValue);
          // Only 'all' should return null
          if (enumValue == IdeaBoxMenu.all) {
            expect(apiStatus, isNull);
          } else {
            expect(apiStatus, isNotNull,
                reason: 'Enum $enumValue should convert to API status');
          }
        }
      });

      test('all API statuses have French translations', () {
        final apiStatuses = ['pending', 'approved', 'implemented', 'rejected'];

        for (final apiStatus in apiStatuses) {
          final frenchStatus = IdeaUtils.getStatusInFrench(apiStatus);
          expect(frenchStatus, isNotNull,
              reason: 'API status $apiStatus should have French translation');
          expect(frenchStatus, isNot(equals(apiStatus)),
              reason: 'French translation should be different from API status');
        }
      });

      test('all enum values have filter titles', () {
        final enumValues = IdeaBoxMenu.values;

        for (final enumValue in enumValues) {
          final filterTitle = IdeaUtils.getFilterTitle(enumValue);
          expect(filterTitle, isNotNull,
              reason: 'Enum $enumValue should have filter title');
          expect(filterTitle.isNotEmpty, isTrue,
              reason: 'Filter title should not be empty');
        }
      });
    });
  });
}
