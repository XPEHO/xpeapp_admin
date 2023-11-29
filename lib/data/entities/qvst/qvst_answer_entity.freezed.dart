// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_answer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QvstAnswerEntity _$QvstAnswerEntityFromJson(Map<String, dynamic> json) {
  return _QvstAnswerEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstAnswerEntity {
  String get answer => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QvstAnswerEntityCopyWith<QvstAnswerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstAnswerEntityCopyWith<$Res> {
  factory $QvstAnswerEntityCopyWith(
          QvstAnswerEntity value, $Res Function(QvstAnswerEntity) then) =
      _$QvstAnswerEntityCopyWithImpl<$Res, QvstAnswerEntity>;
  @useResult
  $Res call({String answer, String value});
}

/// @nodoc
class _$QvstAnswerEntityCopyWithImpl<$Res, $Val extends QvstAnswerEntity>
    implements $QvstAnswerEntityCopyWith<$Res> {
  _$QvstAnswerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QvstAnswerEntityImplCopyWith<$Res>
    implements $QvstAnswerEntityCopyWith<$Res> {
  factory _$$QvstAnswerEntityImplCopyWith(_$QvstAnswerEntityImpl value,
          $Res Function(_$QvstAnswerEntityImpl) then) =
      __$$QvstAnswerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String answer, String value});
}

/// @nodoc
class __$$QvstAnswerEntityImplCopyWithImpl<$Res>
    extends _$QvstAnswerEntityCopyWithImpl<$Res, _$QvstAnswerEntityImpl>
    implements _$$QvstAnswerEntityImplCopyWith<$Res> {
  __$$QvstAnswerEntityImplCopyWithImpl(_$QvstAnswerEntityImpl _value,
      $Res Function(_$QvstAnswerEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answer = null,
    Object? value = null,
  }) {
    return _then(_$QvstAnswerEntityImpl(
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstAnswerEntityImpl implements _QvstAnswerEntity {
  _$QvstAnswerEntityImpl({required this.answer, required this.value});

  factory _$QvstAnswerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstAnswerEntityImplFromJson(json);

  @override
  final String answer;
  @override
  final String value;

  @override
  String toString() {
    return 'QvstAnswerEntity(answer: $answer, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstAnswerEntityImpl &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, answer, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QvstAnswerEntityImplCopyWith<_$QvstAnswerEntityImpl> get copyWith =>
      __$$QvstAnswerEntityImplCopyWithImpl<_$QvstAnswerEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QvstAnswerEntityImplToJson(
      this,
    );
  }
}

abstract class _QvstAnswerEntity implements QvstAnswerEntity {
  factory _QvstAnswerEntity(
      {required final String answer,
      required final String value}) = _$QvstAnswerEntityImpl;

  factory _QvstAnswerEntity.fromJson(Map<String, dynamic> json) =
      _$QvstAnswerEntityImpl.fromJson;

  @override
  String get answer;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$QvstAnswerEntityImplCopyWith<_$QvstAnswerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
