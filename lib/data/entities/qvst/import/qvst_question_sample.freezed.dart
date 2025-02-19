// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_question_sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QvstQuestionSample _$QvstQuestionSampleFromJson(Map<String, dynamic> json) {
  return _QvstQuestionSample.fromJson(json);
}

/// @nodoc
mixin _$QvstQuestionSample {
  @JsonKey(name: 'id_theme')
  String get idTheme => throw _privateConstructorUsedError;
  @JsonKey(name: 'question')
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'response_repo')
  String get responseRepo => throw _privateConstructorUsedError;

  /// Serializes this QvstQuestionSample to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QvstQuestionSampleCopyWith<QvstQuestionSample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstQuestionSampleCopyWith<$Res> {
  factory $QvstQuestionSampleCopyWith(
          QvstQuestionSample value, $Res Function(QvstQuestionSample) then) =
      _$QvstQuestionSampleCopyWithImpl<$Res, QvstQuestionSample>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_theme') String idTheme,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'response_repo') String responseRepo});
}

/// @nodoc
class _$QvstQuestionSampleCopyWithImpl<$Res, $Val extends QvstQuestionSample>
    implements $QvstQuestionSampleCopyWith<$Res> {
  _$QvstQuestionSampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTheme = null,
    Object? question = null,
    Object? responseRepo = null,
  }) {
    return _then(_value.copyWith(
      idTheme: null == idTheme
          ? _value.idTheme
          : idTheme // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      responseRepo: null == responseRepo
          ? _value.responseRepo
          : responseRepo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QvstQuestionSampleImplCopyWith<$Res>
    implements $QvstQuestionSampleCopyWith<$Res> {
  factory _$$QvstQuestionSampleImplCopyWith(_$QvstQuestionSampleImpl value,
          $Res Function(_$QvstQuestionSampleImpl) then) =
      __$$QvstQuestionSampleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_theme') String idTheme,
      @JsonKey(name: 'question') String question,
      @JsonKey(name: 'response_repo') String responseRepo});
}

/// @nodoc
class __$$QvstQuestionSampleImplCopyWithImpl<$Res>
    extends _$QvstQuestionSampleCopyWithImpl<$Res, _$QvstQuestionSampleImpl>
    implements _$$QvstQuestionSampleImplCopyWith<$Res> {
  __$$QvstQuestionSampleImplCopyWithImpl(_$QvstQuestionSampleImpl _value,
      $Res Function(_$QvstQuestionSampleImpl) _then)
      : super(_value, _then);

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTheme = null,
    Object? question = null,
    Object? responseRepo = null,
  }) {
    return _then(_$QvstQuestionSampleImpl(
      idTheme: null == idTheme
          ? _value.idTheme
          : idTheme // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      responseRepo: null == responseRepo
          ? _value.responseRepo
          : responseRepo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstQuestionSampleImpl implements _QvstQuestionSample {
  _$QvstQuestionSampleImpl(
      {@JsonKey(name: 'id_theme') required this.idTheme,
      @JsonKey(name: 'question') required this.question,
      @JsonKey(name: 'response_repo') required this.responseRepo});

  factory _$QvstQuestionSampleImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstQuestionSampleImplFromJson(json);

  @override
  @JsonKey(name: 'id_theme')
  final String idTheme;
  @override
  @JsonKey(name: 'question')
  final String question;
  @override
  @JsonKey(name: 'response_repo')
  final String responseRepo;

  @override
  String toString() {
    return 'QvstQuestionSample(idTheme: $idTheme, question: $question, responseRepo: $responseRepo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstQuestionSampleImpl &&
            (identical(other.idTheme, idTheme) || other.idTheme == idTheme) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.responseRepo, responseRepo) ||
                other.responseRepo == responseRepo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idTheme, question, responseRepo);

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QvstQuestionSampleImplCopyWith<_$QvstQuestionSampleImpl> get copyWith =>
      __$$QvstQuestionSampleImplCopyWithImpl<_$QvstQuestionSampleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QvstQuestionSampleImplToJson(
      this,
    );
  }
}

abstract class _QvstQuestionSample implements QvstQuestionSample {
  factory _QvstQuestionSample(
          {@JsonKey(name: 'id_theme') required final String idTheme,
          @JsonKey(name: 'question') required final String question,
          @JsonKey(name: 'response_repo') required final String responseRepo}) =
      _$QvstQuestionSampleImpl;

  factory _QvstQuestionSample.fromJson(Map<String, dynamic> json) =
      _$QvstQuestionSampleImpl.fromJson;

  @override
  @JsonKey(name: 'id_theme')
  String get idTheme;
  @override
  @JsonKey(name: 'question')
  String get question;
  @override
  @JsonKey(name: 'response_repo')
  String get responseRepo;

  /// Create a copy of QvstQuestionSample
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QvstQuestionSampleImplCopyWith<_$QvstQuestionSampleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
