import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_question_entity.dart';

void main() {
  group('QvstQuestionEntity', () {
    test('reversedQuestionBool and noLongerUsedBool return correct values', () {
      final q1 = QvstQuestionEntity(
        id: '1',
        question: 'Test',
        reversedQuestion: '1',
        noLongerUsed: '0',
      );
      expect(q1.reversedQuestionBool, isTrue);
      expect(q1.noLongerUsedBool, isFalse);

      final q2 = QvstQuestionEntity(
        id: '2',
        question: 'Test',
        reversedQuestion: '0',
        noLongerUsed: '1',
      );
      expect(q2.reversedQuestionBool, isFalse);
      expect(q2.noLongerUsedBool, isTrue);
    });
  });
}
