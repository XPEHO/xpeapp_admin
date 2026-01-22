import 'package:csv/csv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qvst_question_sample.freezed.dart';
part 'qvst_question_sample.g.dart';

@Freezed()
abstract class QvstQuestionSample with _$QvstQuestionSample {
  factory QvstQuestionSample({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'id_theme') required String idTheme,
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'response_repo') required String responseRepo,
    @JsonKey(name: 'reversed_question') required bool reversedQuestion,
    @JsonKey(name: 'no_longer_used') required bool noLongerUsed,
  }) = _QvstQuestionSample;

  factory QvstQuestionSample.fromJson(Map<String, dynamic> json) =>
      _$QvstQuestionSampleFromJson(json);

  static QvstQuestionSample fromCsvLine(String csvLine) {
    final values = const CsvToListConverter().convert(csvLine, eol: '\n')[0];

    // CSV columns: [question_id, question_text, theme_id, theme_name, repo_id, repo_name, reversed_question, no_longer_used, number_asked]
    if (values.length < 8) {
      throw const FormatException('Not enough columns in CSV format');
    }
    return QvstQuestionSample(
      id: values[0].toString(), // question_id
      idTheme: values[2].toString(), // theme_id
      question: values[1].toString(), // question_text
      responseRepo: values[4].toString(), // repo_id
      reversedQuestion: _parseBool(values[6]), // reversed_question
      noLongerUsed: _parseBool(values[7]), // no_longer_used
    );
  }

  static bool _parseBool(dynamic value) {
    if (value is bool) return value;
    final str = value.toString().toLowerCase();
    return str == 'true' || str == '1' || str == 'yes' || str == 'oui';
  }
}
