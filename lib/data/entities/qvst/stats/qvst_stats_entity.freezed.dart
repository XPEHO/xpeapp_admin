// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QvstStatsEntity _$QvstStatsEntityFromJson(Map<String, dynamic> json) {
  return _QvstStatsEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstStatsEntity {
  String get campaignId => throw _privateConstructorUsedError;
  String get campaignName => throw _privateConstructorUsedError;
  String get campaignStatus => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  List<QvstQuestionEntity> get questions => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;

  /// Serializes this QvstStatsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QvstStatsEntityCopyWith<QvstStatsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstStatsEntityCopyWith<$Res> {
  factory $QvstStatsEntityCopyWith(
          QvstStatsEntity value, $Res Function(QvstStatsEntity) then) =
      _$QvstStatsEntityCopyWithImpl<$Res, QvstStatsEntity>;
  @useResult
  $Res call(
      {String campaignId,
      String campaignName,
      String campaignStatus,
      String startDate,
      String endDate,
      List<QvstQuestionEntity> questions,
      String? action});
}

/// @nodoc
class _$QvstStatsEntityCopyWithImpl<$Res, $Val extends QvstStatsEntity>
    implements $QvstStatsEntityCopyWith<$Res> {
  _$QvstStatsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? campaignName = null,
    Object? campaignStatus = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? questions = null,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      campaignName: null == campaignName
          ? _value.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String,
      campaignStatus: null == campaignStatus
          ? _value.campaignStatus
          : campaignStatus // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QvstQuestionEntity>,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QvstStatsEntityImplCopyWith<$Res>
    implements $QvstStatsEntityCopyWith<$Res> {
  factory _$$QvstStatsEntityImplCopyWith(_$QvstStatsEntityImpl value,
          $Res Function(_$QvstStatsEntityImpl) then) =
      __$$QvstStatsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String campaignId,
      String campaignName,
      String campaignStatus,
      String startDate,
      String endDate,
      List<QvstQuestionEntity> questions,
      String? action});
}

/// @nodoc
class __$$QvstStatsEntityImplCopyWithImpl<$Res>
    extends _$QvstStatsEntityCopyWithImpl<$Res, _$QvstStatsEntityImpl>
    implements _$$QvstStatsEntityImplCopyWith<$Res> {
  __$$QvstStatsEntityImplCopyWithImpl(
      _$QvstStatsEntityImpl _value, $Res Function(_$QvstStatsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? campaignName = null,
    Object? campaignStatus = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? questions = null,
    Object? action = freezed,
  }) {
    return _then(_$QvstStatsEntityImpl(
      campaignId: null == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String,
      campaignName: null == campaignName
          ? _value.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String,
      campaignStatus: null == campaignStatus
          ? _value.campaignStatus
          : campaignStatus // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QvstQuestionEntity>,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstStatsEntityImpl implements _QvstStatsEntity {
  const _$QvstStatsEntityImpl(
      {required this.campaignId,
      required this.campaignName,
      required this.campaignStatus,
      required this.startDate,
      required this.endDate,
      required final List<QvstQuestionEntity> questions,
      this.action})
      : _questions = questions;

  factory _$QvstStatsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstStatsEntityImplFromJson(json);

  @override
  final String campaignId;
  @override
  final String campaignName;
  @override
  final String campaignStatus;
  @override
  final String startDate;
  @override
  final String endDate;
  final List<QvstQuestionEntity> _questions;
  @override
  List<QvstQuestionEntity> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final String? action;

  @override
  String toString() {
    return 'QvstStatsEntity(campaignId: $campaignId, campaignName: $campaignName, campaignStatus: $campaignStatus, startDate: $startDate, endDate: $endDate, questions: $questions, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstStatsEntityImpl &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.campaignStatus, campaignStatus) ||
                other.campaignStatus == campaignStatus) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      campaignId,
      campaignName,
      campaignStatus,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_questions),
      action);

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QvstStatsEntityImplCopyWith<_$QvstStatsEntityImpl> get copyWith =>
      __$$QvstStatsEntityImplCopyWithImpl<_$QvstStatsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QvstStatsEntityImplToJson(
      this,
    );
  }
}

abstract class _QvstStatsEntity implements QvstStatsEntity {
  const factory _QvstStatsEntity(
      {required final String campaignId,
      required final String campaignName,
      required final String campaignStatus,
      required final String startDate,
      required final String endDate,
      required final List<QvstQuestionEntity> questions,
      final String? action}) = _$QvstStatsEntityImpl;

  factory _QvstStatsEntity.fromJson(Map<String, dynamic> json) =
      _$QvstStatsEntityImpl.fromJson;

  @override
  String get campaignId;
  @override
  String get campaignName;
  @override
  String get campaignStatus;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  List<QvstQuestionEntity> get questions;
  @override
  String? get action;

  /// Create a copy of QvstStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QvstStatsEntityImplCopyWith<_$QvstStatsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
