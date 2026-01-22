import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpeapp_admin/data/entities/qvst/qvst_answer_entity.dart';
import 'package:xpeapp_admin/env/serializer/bool_string_converter.dart';

part 'qvst_question_entity.freezed.dart';
part 'qvst_question_entity.g.dart';

@Freezed(makeCollectionsUnmodifiable: true)
abstract class QvstQuestionEntity with _$QvstQuestionEntity {
  factory QvstQuestionEntity({
    @JsonKey(name: 'question_id') String? id,
    required String question,
    String? theme,
    @JsonKey(name: 'theme_id') String? idTheme,
    @JsonKey(name: 'answer_repo_id') String? answerRepoId,
    int? numberAsked,
    @JsonSerializable(explicitToJson: true)
    @Default([])
    List<QvstAnswerEntity> answers,
    @JsonKey(name: 'reversed_question')
    @BoolOrStringToStringConverter()
    @Default('0')
    String reversedQuestion,
    @JsonKey(name: 'no_longer_used')
    @BoolOrStringToStringConverter()
    @Default('0')
    String noLongerUsed,
  }) = _QvstQuestionEntity;

  const QvstQuestionEntity._();

  factory QvstQuestionEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstQuestionEntityFromJson(json);

  bool get reversedQuestionBool => reversedQuestion == '1';
  bool get noLongerUsedBool => noLongerUsed == '1';
}
