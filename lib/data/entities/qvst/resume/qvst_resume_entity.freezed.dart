// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_resume_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QvstResumeEntity _$QvstResumeEntityFromJson(Map<String, dynamic> json) {
  return _QvstResumeEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstResumeEntity {
  String get id => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get numberOfAnswers => throw _privateConstructorUsedError;
  String get averageAnswer => throw _privateConstructorUsedError;
  String get maxValueAnswer => throw _privateConstructorUsedError;

  /// Serializes this QvstResumeEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QvstResumeEntityCopyWith<QvstResumeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstResumeEntityCopyWith<$Res> {
  factory $QvstResumeEntityCopyWith(
          QvstResumeEntity value, $Res Function(QvstResumeEntity) then) =
      _$QvstResumeEntityCopyWithImpl<$Res, QvstResumeEntity>;
  @useResult
  $Res call(
      {String id,
      String theme,
      String question,
      String numberOfAnswers,
      String averageAnswer,
      String maxValueAnswer});
}

/// @nodoc
class _$QvstResumeEntityCopyWithImpl<$Res, $Val extends QvstResumeEntity>
    implements $QvstResumeEntityCopyWith<$Res> {
  _$QvstResumeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? theme = null,
    Object? question = null,
    Object? numberOfAnswers = null,
    Object? averageAnswer = null,
    Object? maxValueAnswer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAnswers: null == numberOfAnswers
          ? _value.numberOfAnswers
          : numberOfAnswers // ignore: cast_nullable_to_non_nullable
              as String,
      averageAnswer: null == averageAnswer
          ? _value.averageAnswer
          : averageAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      maxValueAnswer: null == maxValueAnswer
          ? _value.maxValueAnswer
          : maxValueAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QvstResumeEntityImplCopyWith<$Res>
    implements $QvstResumeEntityCopyWith<$Res> {
  factory _$$QvstResumeEntityImplCopyWith(_$QvstResumeEntityImpl value,
          $Res Function(_$QvstResumeEntityImpl) then) =
      __$$QvstResumeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String theme,
      String question,
      String numberOfAnswers,
      String averageAnswer,
      String maxValueAnswer});
}

/// @nodoc
class __$$QvstResumeEntityImplCopyWithImpl<$Res>
    extends _$QvstResumeEntityCopyWithImpl<$Res, _$QvstResumeEntityImpl>
    implements _$$QvstResumeEntityImplCopyWith<$Res> {
  __$$QvstResumeEntityImplCopyWithImpl(_$QvstResumeEntityImpl _value,
      $Res Function(_$QvstResumeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? theme = null,
    Object? question = null,
    Object? numberOfAnswers = null,
    Object? averageAnswer = null,
    Object? maxValueAnswer = null,
  }) {
    return _then(_$QvstResumeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfAnswers: null == numberOfAnswers
          ? _value.numberOfAnswers
          : numberOfAnswers // ignore: cast_nullable_to_non_nullable
              as String,
      averageAnswer: null == averageAnswer
          ? _value.averageAnswer
          : averageAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      maxValueAnswer: null == maxValueAnswer
          ? _value.maxValueAnswer
          : maxValueAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstResumeEntityImpl implements _QvstResumeEntity {
  const _$QvstResumeEntityImpl(
      {required this.id,
      required this.theme,
      required this.question,
      required this.numberOfAnswers,
      required this.averageAnswer,
      required this.maxValueAnswer});

  factory _$QvstResumeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstResumeEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String theme;
  @override
  final String question;
  @override
  final String numberOfAnswers;
  @override
  final String averageAnswer;
  @override
  final String maxValueAnswer;

  @override
  String toString() {
    return 'QvstResumeEntity(id: $id, theme: $theme, question: $question, numberOfAnswers: $numberOfAnswers, averageAnswer: $averageAnswer, maxValueAnswer: $maxValueAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstResumeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.numberOfAnswers, numberOfAnswers) ||
                other.numberOfAnswers == numberOfAnswers) &&
            (identical(other.averageAnswer, averageAnswer) ||
                other.averageAnswer == averageAnswer) &&
            (identical(other.maxValueAnswer, maxValueAnswer) ||
                other.maxValueAnswer == maxValueAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, theme, question,
      numberOfAnswers, averageAnswer, maxValueAnswer);

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QvstResumeEntityImplCopyWith<_$QvstResumeEntityImpl> get copyWith =>
      __$$QvstResumeEntityImplCopyWithImpl<_$QvstResumeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QvstResumeEntityImplToJson(
      this,
    );
  }
}

abstract class _QvstResumeEntity implements QvstResumeEntity {
  const factory _QvstResumeEntity(
      {required final String id,
      required final String theme,
      required final String question,
      required final String numberOfAnswers,
      required final String averageAnswer,
      required final String maxValueAnswer}) = _$QvstResumeEntityImpl;

  factory _QvstResumeEntity.fromJson(Map<String, dynamic> json) =
      _$QvstResumeEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get theme;
  @override
  String get question;
  @override
  String get numberOfAnswers;
  @override
  String get averageAnswer;
  @override
  String get maxValueAnswer;

  /// Create a copy of QvstResumeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QvstResumeEntityImplCopyWith<_$QvstResumeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
