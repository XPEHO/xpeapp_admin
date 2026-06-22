import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/import/qvst_question_sample.dart';

void main() {
  group('QvstQuestionSample', () {
    test('fromJson creates a valid instance', () {
      final json = {
        'id': 'q1',
        'id_theme': 'theme1',
        'question': 'What is your name?',
        'response_repo': 'repo1',
        'reversed_question': false,
        'no_longer_used': false
      };

      final sample = QvstQuestionSample.fromJson(json);

      expect(sample.id, 'q1');
      expect(sample.idTheme, 'theme1');
      expect(sample.question, 'What is your name?');
      expect(sample.responseRepo, 'repo1');
      expect(sample.reversedQuestion, false);
      expect(sample.noLongerUsed, false);
    });

    test('fromCsvLine creates a valid instance', () {
      // Backend format: [id_question, id_theme, question, response_repo, reversed_question, no_longer_used]
      const csvLine = 'q1,theme1,What is your name?,repo1,0,0';

      final sample = QvstQuestionSample.fromCsvLine(csvLine);

      expect(sample.id, 'q1');
      expect(sample.idTheme, 'theme1');
      expect(sample.question, 'What is your name?');
      expect(sample.responseRepo, 'repo1');
      expect(sample.reversedQuestion, false);
      expect(sample.noLongerUsed, false);
    });

    test('fromCsvLine creates a valid instance with comma in question', () {
      const csvLine =
          'q2,theme1,"I would like to ask you, what is your name?",repo1,1,0';

      final sample = QvstQuestionSample.fromCsvLine(csvLine);

      expect(sample.id, 'q2');
      expect(sample.idTheme, 'theme1');
      expect(sample.question, 'I would like to ask you, what is your name?');
      expect(sample.responseRepo, 'repo1');
      expect(sample.reversedQuestion, true);
      expect(sample.noLongerUsed, false);
    });

    test('fromCsvLine still supports legacy export format', () {
      const csvLine =
          'q3,What is your name?,theme1,Theme Name,repo1,Repo Name,yes,no,1';

      final sample = QvstQuestionSample.fromCsvLine(csvLine);

      expect(sample.id, 'q3');
      expect(sample.idTheme, 'theme1');
      expect(sample.question, 'What is your name?');
      expect(sample.responseRepo, 'repo1');
      expect(sample.reversedQuestion, true);
      expect(sample.noLongerUsed, false);
    });

    test('fromCsvLine throws FormatException for invalid CSV', () {
      const csvLine = 'theme1,What is your name?';

      expect(
          () => QvstQuestionSample.fromCsvLine(csvLine), throwsFormatException);
    });
  });
}
