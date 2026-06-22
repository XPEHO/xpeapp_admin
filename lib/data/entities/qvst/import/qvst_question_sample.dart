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
    final values = const CsvDecoder().convert(csvLine).first;

    // Supports both the legacy export format and the lighter backend format.
    // Legacy: [question_id, question_text, theme_id, theme_name, repo_id, repo_name, reversed_question, no_longer_used, number_asked]
    // Backend: [id_question?, id_theme, question, response_repo, reversed_question?, no_longer_used?]
    if (values.length < 4) {
      throw const FormatException('Not enough columns in CSV format');
    }

    if (values.length >= 8) {
      return QvstQuestionSample(
        id: values[0].toString(),
        idTheme: values[2].toString(),
        question: values[1].toString(),
        responseRepo: values[4].toString(),
        reversedQuestion: _parseBool(values[6]),
        noLongerUsed: _parseBool(values[7]),
      );
    }

    return QvstQuestionSample(
      id: values[0].toString(),
      idTheme: values[1].toString(),
      question: values[2].toString(),
      responseRepo: values[3].toString(),
      reversedQuestion: values.length > 4 ? _parseBool(values[4]) : false,
      noLongerUsed: values.length > 5 ? _parseBool(values[5]) : false,
    );
  }

  static bool _parseBool(dynamic value) {
    if (value is bool) return value;
    final str = value.toString().toLowerCase();
    return str == 'true' || str == '1' || str == 'yes' || str == 'oui';
  }
}
