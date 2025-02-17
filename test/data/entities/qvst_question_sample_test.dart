import 'package:flutter_test/flutter_test.dart';
import 'package:xpeapp_admin/data/entities/qvst/import/qvst_question_sample.dart';

void main() {
  group('QvstQuestionSample', () {
    test('fromJson creates a valid instance', () {
      final json = {
        'id_theme': 'theme1',
        'question': 'What is your name?',
        'response_repo': 'repo1'
      };

      final sample = QvstQuestionSample.fromJson(json);

      expect(sample.idTheme, 'theme1');
      expect(sample.question, 'What is your name?');
      expect(sample.responseRepo, 'repo1');
    });

    test('fromCsvLine creates a valid instance', () {
      const csvLine = 'theme1,,What is your name?,repo1';

      final sample = QvstQuestionSample.fromCsvLine(csvLine);

      expect(sample.idTheme, 'theme1');
      expect(sample.question, 'What is your name?');
      expect(sample.responseRepo, 'repo1');
    });

    test('fromCsvLine creates a valid instance with comma in question', () {
      const csvLine =
          'theme1,,"I would like to ask you, what is your name?",repo1';

      final sample = QvstQuestionSample.fromCsvLine(csvLine);

      expect(sample.idTheme, 'theme1');
      expect(sample.question, 'I would like to ask you, what is your name?');
      expect(sample.responseRepo, 'repo1');
    });

    test('fromCsvLine throws FormatException for invalid CSV', () {
      const csvLine = 'theme1,What is your name?';

      expect(
          () => QvstQuestionSample.fromCsvLine(csvLine), throwsFormatException);
    });
  });
}
