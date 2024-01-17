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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QvstStatsEntity _$QvstStatsEntityFromJson(Map<String, dynamic> json) {
  return _QvstStatsEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstStatsEntity {
  String get campaignId => throw _privateConstructorUsedError;
  String get campaignName => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get endDate => throw _privateConstructorUsedError;
  List<QvstQuestionEntity> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      String startDate,
      String endDate,
      List<QvstQuestionEntity> questions});
}

/// @nodoc
class _$QvstStatsEntityCopyWithImpl<$Res, $Val extends QvstStatsEntity>
    implements $QvstStatsEntityCopyWith<$Res> {
  _$QvstStatsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? campaignName = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? questions = null,
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
      String startDate,
      String endDate,
      List<QvstQuestionEntity> questions});
}

/// @nodoc
class __$$QvstStatsEntityImplCopyWithImpl<$Res>
    extends _$QvstStatsEntityCopyWithImpl<$Res, _$QvstStatsEntityImpl>
    implements _$$QvstStatsEntityImplCopyWith<$Res> {
  __$$QvstStatsEntityImplCopyWithImpl(
      _$QvstStatsEntityImpl _value, $Res Function(_$QvstStatsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = null,
    Object? campaignName = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? questions = null,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstStatsEntityImpl implements _QvstStatsEntity {
  const _$QvstStatsEntityImpl(
      {required this.campaignId,
      required this.campaignName,
      required this.startDate,
      required this.endDate,
      required final List<QvstQuestionEntity> questions})
      : _questions = questions;

  factory _$QvstStatsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstStatsEntityImplFromJson(json);

  @override
  final String campaignId;
  @override
  final String campaignName;
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
  String toString() {
    return 'QvstStatsEntity(campaignId: $campaignId, campaignName: $campaignName, startDate: $startDate, endDate: $endDate, questions: $questions)';
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
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, campaignId, campaignName,
      startDate, endDate, const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
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
          required final String startDate,
          required final String endDate,
          required final List<QvstQuestionEntity> questions}) =
      _$QvstStatsEntityImpl;

  factory _QvstStatsEntity.fromJson(Map<String, dynamic> json) =
      _$QvstStatsEntityImpl.fromJson;

  @override
  String get campaignId;
  @override
  String get campaignName;
  @override
  String get startDate;
  @override
  String get endDate;
  @override
  List<QvstQuestionEntity> get questions;
  @override
  @JsonKey(ignore: true)
  _$$QvstStatsEntityImplCopyWith<_$QvstStatsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
