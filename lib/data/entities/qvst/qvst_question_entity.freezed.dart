// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QvstQuestionEntity _$QvstQuestionEntityFromJson(Map<String, dynamic> json) {
  return _QvstQuestionEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstQuestionEntity {
  String? get id => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  String? get idTheme => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  @JsonSerializable(explicitToJson: true)
  List<QvstAnswerEntity> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QvstQuestionEntityCopyWith<QvstQuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstQuestionEntityCopyWith<$Res> {
  factory $QvstQuestionEntityCopyWith(
          QvstQuestionEntity value, $Res Function(QvstQuestionEntity) then) =
      _$QvstQuestionEntityCopyWithImpl<$Res, QvstQuestionEntity>;
  @useResult
  $Res call(
      {String? id,
      String theme,
      String? idTheme,
      String question,
      @JsonSerializable(explicitToJson: true) List<QvstAnswerEntity> answers});
}

/// @nodoc
class _$QvstQuestionEntityCopyWithImpl<$Res, $Val extends QvstQuestionEntity>
    implements $QvstQuestionEntityCopyWith<$Res> {
  _$QvstQuestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? theme = null,
    Object? idTheme = freezed,
    Object? question = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      idTheme: freezed == idTheme
          ? _value.idTheme
          : idTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QvstAnswerEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QvstQuestionEntityImplCopyWith<$Res>
    implements $QvstQuestionEntityCopyWith<$Res> {
  factory _$$QvstQuestionEntityImplCopyWith(_$QvstQuestionEntityImpl value,
          $Res Function(_$QvstQuestionEntityImpl) then) =
      __$$QvstQuestionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String theme,
      String? idTheme,
      String question,
      @JsonSerializable(explicitToJson: true) List<QvstAnswerEntity> answers});
}

/// @nodoc
class __$$QvstQuestionEntityImplCopyWithImpl<$Res>
    extends _$QvstQuestionEntityCopyWithImpl<$Res, _$QvstQuestionEntityImpl>
    implements _$$QvstQuestionEntityImplCopyWith<$Res> {
  __$$QvstQuestionEntityImplCopyWithImpl(_$QvstQuestionEntityImpl _value,
      $Res Function(_$QvstQuestionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? theme = null,
    Object? idTheme = freezed,
    Object? question = null,
    Object? answers = null,
  }) {
    return _then(_$QvstQuestionEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      idTheme: freezed == idTheme
          ? _value.idTheme
          : idTheme // ignore: cast_nullable_to_non_nullable
              as String?,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<QvstAnswerEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstQuestionEntityImpl implements _QvstQuestionEntity {
  _$QvstQuestionEntityImpl(
      {this.id,
      required this.theme,
      this.idTheme,
      required this.question,
      @JsonSerializable(explicitToJson: true)
      required final List<QvstAnswerEntity> answers})
      : _answers = answers;

  factory _$QvstQuestionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstQuestionEntityImplFromJson(json);

  @override
  final String? id;
  @override
  final String theme;
  @override
  final String? idTheme;
  @override
  final String question;
  final List<QvstAnswerEntity> _answers;
  @override
  @JsonSerializable(explicitToJson: true)
  List<QvstAnswerEntity> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QvstQuestionEntity(id: $id, theme: $theme, idTheme: $idTheme, question: $question, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstQuestionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.idTheme, idTheme) || other.idTheme == idTheme) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, theme, idTheme, question,
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QvstQuestionEntityImplCopyWith<_$QvstQuestionEntityImpl> get copyWith =>
      __$$QvstQuestionEntityImplCopyWithImpl<_$QvstQuestionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QvstQuestionEntityImplToJson(
      this,
    );
  }
}

abstract class _QvstQuestionEntity implements QvstQuestionEntity {
  factory _QvstQuestionEntity(
          {final String? id,
          required final String theme,
          final String? idTheme,
          required final String question,
          @JsonSerializable(explicitToJson: true)
          required final List<QvstAnswerEntity> answers}) =
      _$QvstQuestionEntityImpl;

  factory _QvstQuestionEntity.fromJson(Map<String, dynamic> json) =
      _$QvstQuestionEntityImpl.fromJson;

  @override
  String? get id;
  @override
  String get theme;
  @override
  String? get idTheme;
  @override
  String get question;
  @override
  @JsonSerializable(explicitToJson: true)
  List<QvstAnswerEntity> get answers;
  @override
  @JsonKey(ignore: true)
  _$$QvstQuestionEntityImplCopyWith<_$QvstQuestionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
