// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'birthday_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BirthdayEntity _$BirthdayEntityFromJson(Map<String, dynamic> json) {
  return _BirthdayEntity.fromJson(json);
}

/// @nodoc
mixin _$BirthdayEntity {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  DateTime get birthdate => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this BirthdayEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BirthdayEntityCopyWith<BirthdayEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BirthdayEntityCopyWith<$Res> {
  factory $BirthdayEntityCopyWith(
          BirthdayEntity value, $Res Function(BirthdayEntity) then) =
      _$BirthdayEntityCopyWithImpl<$Res, BirthdayEntity>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      DateTime birthdate,
      String? email});
}

/// @nodoc
class _$BirthdayEntityCopyWithImpl<$Res, $Val extends BirthdayEntity>
    implements $BirthdayEntityCopyWith<$Res> {
  _$BirthdayEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? birthdate = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BirthdayEntityImplCopyWith<$Res>
    implements $BirthdayEntityCopyWith<$Res> {
  factory _$$BirthdayEntityImplCopyWith(_$BirthdayEntityImpl value,
          $Res Function(_$BirthdayEntityImpl) then) =
      __$$BirthdayEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      DateTime birthdate,
      String? email});
}

/// @nodoc
class __$$BirthdayEntityImplCopyWithImpl<$Res>
    extends _$BirthdayEntityCopyWithImpl<$Res, _$BirthdayEntityImpl>
    implements _$$BirthdayEntityImplCopyWith<$Res> {
  __$$BirthdayEntityImplCopyWithImpl(
      _$BirthdayEntityImpl _value, $Res Function(_$BirthdayEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? birthdate = null,
    Object? email = freezed,
  }) {
    return _then(_$BirthdayEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$BirthdayEntityImpl implements _BirthdayEntity {
  const _$BirthdayEntityImpl(
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      required this.birthdate,
      this.email});

  factory _$BirthdayEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$BirthdayEntityImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  final DateTime birthdate;
  @override
  final String? email;

  @override
  String toString() {
    return 'BirthdayEntity(id: $id, firstName: $firstName, birthdate: $birthdate, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BirthdayEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, birthdate, email);

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BirthdayEntityImplCopyWith<_$BirthdayEntityImpl> get copyWith =>
      __$$BirthdayEntityImplCopyWithImpl<_$BirthdayEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BirthdayEntityImplToJson(
      this,
    );
  }
}

abstract class _BirthdayEntity implements BirthdayEntity {
  const factory _BirthdayEntity(
      {required final String id,
      @JsonKey(name: 'first_name') required final String firstName,
      required final DateTime birthdate,
      final String? email}) = _$BirthdayEntityImpl;

  factory _BirthdayEntity.fromJson(Map<String, dynamic> json) =
      _$BirthdayEntityImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  DateTime get birthdate;
  @override
  String? get email;

  /// Create a copy of BirthdayEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BirthdayEntityImplCopyWith<_$BirthdayEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
