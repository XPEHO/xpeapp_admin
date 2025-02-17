import 'package:csv/csv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qvst_question_sample.freezed.dart';
part 'qvst_question_sample.g.dart';

@Freezed()
class QvstQuestionSample with _$QvstQuestionSample {
  factory QvstQuestionSample(
          {@JsonKey(name: 'id_theme') required String idTheme,
          @JsonKey(name: 'question') required String question,
          @JsonKey(name: 'response_repo') required String responseRepo}) =
      _QvstQuestionSample;

  factory QvstQuestionSample.fromJson(Map<String, dynamic> json) =>
      _$QvstQuestionSampleFromJson(json);

  static QvstQuestionSample fromCsvLine(String csvLine) {
    final values = const CsvToListConverter().convert(csvLine, eol: '\n')[0];

    // Note: The csv have an extra column with information about the theme
    if (values.length < 4) {
      throw const FormatException('Not enough columns in CSV format');
    }
    return QvstQuestionSample(
      idTheme: values[0].toString(),
      question: values[2].toString(),
      responseRepo: values[3].toString(),
    );
  }
}
