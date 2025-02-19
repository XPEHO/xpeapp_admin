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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QvstAnswerEntity _$QvstAnswerEntityFromJson(Map<String, dynamic> json) {
  return _QvstAnswerEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstAnswerEntity {
  String get id => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int? get numberAnswered => throw _privateConstructorUsedError;

  /// Serializes this QvstAnswerEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QvstAnswerEntityCopyWith<QvstAnswerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstAnswerEntityCopyWith<$Res> {
  factory $QvstAnswerEntityCopyWith(
          QvstAnswerEntity value, $Res Function(QvstAnswerEntity) then) =
      _$QvstAnswerEntityCopyWithImpl<$Res, QvstAnswerEntity>;
  @useResult
  $Res call({String id, String answer, String value, int? numberAnswered});
}

/// @nodoc
class _$QvstAnswerEntityCopyWithImpl<$Res, $Val extends QvstAnswerEntity>
    implements $QvstAnswerEntityCopyWith<$Res> {
  _$QvstAnswerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? value = null,
    Object? numberAnswered = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      numberAnswered: freezed == numberAnswered
          ? _value.numberAnswered
          : numberAnswered // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call({String id, String answer, String value, int? numberAnswered});
}

/// @nodoc
class __$$QvstAnswerEntityImplCopyWithImpl<$Res>
    extends _$QvstAnswerEntityCopyWithImpl<$Res, _$QvstAnswerEntityImpl>
    implements _$$QvstAnswerEntityImplCopyWith<$Res> {
  __$$QvstAnswerEntityImplCopyWithImpl(_$QvstAnswerEntityImpl _value,
      $Res Function(_$QvstAnswerEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? value = null,
    Object? numberAnswered = freezed,
  }) {
    return _then(_$QvstAnswerEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      numberAnswered: freezed == numberAnswered
          ? _value.numberAnswered
          : numberAnswered // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstAnswerEntityImpl implements _QvstAnswerEntity {
  _$QvstAnswerEntityImpl(
      {required this.id,
      required this.answer,
      required this.value,
      this.numberAnswered});

  factory _$QvstAnswerEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstAnswerEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String answer;
  @override
  final String value;
  @override
  final int? numberAnswered;

  @override
  String toString() {
    return 'QvstAnswerEntity(id: $id, answer: $answer, value: $value, numberAnswered: $numberAnswered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstAnswerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.numberAnswered, numberAnswered) ||
                other.numberAnswered == numberAnswered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, answer, value, numberAnswered);

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String id,
      required final String answer,
      required final String value,
      final int? numberAnswered}) = _$QvstAnswerEntityImpl;

  factory _QvstAnswerEntity.fromJson(Map<String, dynamic> json) =
      _$QvstAnswerEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get answer;
  @override
  String get value;
  @override
  int? get numberAnswered;

  /// Create a copy of QvstAnswerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QvstAnswerEntityImplCopyWith<_$QvstAnswerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
