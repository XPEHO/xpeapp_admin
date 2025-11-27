// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_analysis_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QvstAnalysisEntity _$QvstAnalysisEntityFromJson(Map<String, dynamic> json) {
  return _QvstAnalysisEntity.fromJson(json);
}

/// @nodoc
mixin _$QvstAnalysisEntity {
  @JsonKey(name: 'campaign_id')
  int? get campaignId => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_name', defaultValue: '')
  String get campaignName => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_status', defaultValue: '')
  String get campaignStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date', defaultValue: '')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date', defaultValue: '')
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'themes')
  List<QvstThemeEntity> get themes => throw _privateConstructorUsedError;
  @JsonKey(name: 'global_stats')
  GlobalStatsEntity? get globalStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'global_distribution')
  List<GlobalDistributionEntity>? get globalDistribution =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'themes_analysis')
  List<ThemeAnalysisEntity>? get themesAnalysis =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'questions_analysis')
  List<QuestionAnalysisEntity> get questionsAnalysis =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'questions_requiring_action')
  List<QuestionAnalysisEntity> get questionsRequiringAction =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'at_risk_employees')
  List<AtRiskEmployeeEntity> get atRiskEmployees =>
      throw _privateConstructorUsedError;

  /// Serializes this QvstAnalysisEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QvstAnalysisEntityCopyWith<QvstAnalysisEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QvstAnalysisEntityCopyWith<$Res> {
  factory $QvstAnalysisEntityCopyWith(
          QvstAnalysisEntity value, $Res Function(QvstAnalysisEntity) then) =
      _$QvstAnalysisEntityCopyWithImpl<$Res, QvstAnalysisEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'campaign_id') int? campaignId,
      @JsonKey(name: 'campaign_name', defaultValue: '') String campaignName,
      @JsonKey(name: 'campaign_status', defaultValue: '') String campaignStatus,
      @JsonKey(name: 'start_date', defaultValue: '') String startDate,
      @JsonKey(name: 'end_date', defaultValue: '') String endDate,
      @JsonKey(name: 'themes') List<QvstThemeEntity> themes,
      @JsonKey(name: 'global_stats') GlobalStatsEntity? globalStats,
      @JsonKey(name: 'global_distribution')
      List<GlobalDistributionEntity>? globalDistribution,
      @JsonKey(name: 'themes_analysis')
      List<ThemeAnalysisEntity>? themesAnalysis,
      @JsonKey(name: 'questions_analysis')
      List<QuestionAnalysisEntity> questionsAnalysis,
      @JsonKey(name: 'questions_requiring_action')
      List<QuestionAnalysisEntity> questionsRequiringAction,
      @JsonKey(name: 'at_risk_employees')
      List<AtRiskEmployeeEntity> atRiskEmployees});

  $GlobalStatsEntityCopyWith<$Res>? get globalStats;
}

/// @nodoc
class _$QvstAnalysisEntityCopyWithImpl<$Res, $Val extends QvstAnalysisEntity>
    implements $QvstAnalysisEntityCopyWith<$Res> {
  _$QvstAnalysisEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = freezed,
    Object? campaignName = null,
    Object? campaignStatus = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? themes = null,
    Object? globalStats = freezed,
    Object? globalDistribution = freezed,
    Object? themesAnalysis = freezed,
    Object? questionsAnalysis = null,
    Object? questionsRequiringAction = null,
    Object? atRiskEmployees = null,
  }) {
    return _then(_value.copyWith(
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      themes: null == themes
          ? _value.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<QvstThemeEntity>,
      globalStats: freezed == globalStats
          ? _value.globalStats
          : globalStats // ignore: cast_nullable_to_non_nullable
              as GlobalStatsEntity?,
      globalDistribution: freezed == globalDistribution
          ? _value.globalDistribution
          : globalDistribution // ignore: cast_nullable_to_non_nullable
              as List<GlobalDistributionEntity>?,
      themesAnalysis: freezed == themesAnalysis
          ? _value.themesAnalysis
          : themesAnalysis // ignore: cast_nullable_to_non_nullable
              as List<ThemeAnalysisEntity>?,
      questionsAnalysis: null == questionsAnalysis
          ? _value.questionsAnalysis
          : questionsAnalysis // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnalysisEntity>,
      questionsRequiringAction: null == questionsRequiringAction
          ? _value.questionsRequiringAction
          : questionsRequiringAction // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnalysisEntity>,
      atRiskEmployees: null == atRiskEmployees
          ? _value.atRiskEmployees
          : atRiskEmployees // ignore: cast_nullable_to_non_nullable
              as List<AtRiskEmployeeEntity>,
    ) as $Val);
  }

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalStatsEntityCopyWith<$Res>? get globalStats {
    if (_value.globalStats == null) {
      return null;
    }

    return $GlobalStatsEntityCopyWith<$Res>(_value.globalStats!, (value) {
      return _then(_value.copyWith(globalStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QvstAnalysisEntityImplCopyWith<$Res>
    implements $QvstAnalysisEntityCopyWith<$Res> {
  factory _$$QvstAnalysisEntityImplCopyWith(_$QvstAnalysisEntityImpl value,
          $Res Function(_$QvstAnalysisEntityImpl) then) =
      __$$QvstAnalysisEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'campaign_id') int? campaignId,
      @JsonKey(name: 'campaign_name', defaultValue: '') String campaignName,
      @JsonKey(name: 'campaign_status', defaultValue: '') String campaignStatus,
      @JsonKey(name: 'start_date', defaultValue: '') String startDate,
      @JsonKey(name: 'end_date', defaultValue: '') String endDate,
      @JsonKey(name: 'themes') List<QvstThemeEntity> themes,
      @JsonKey(name: 'global_stats') GlobalStatsEntity? globalStats,
      @JsonKey(name: 'global_distribution')
      List<GlobalDistributionEntity>? globalDistribution,
      @JsonKey(name: 'themes_analysis')
      List<ThemeAnalysisEntity>? themesAnalysis,
      @JsonKey(name: 'questions_analysis')
      List<QuestionAnalysisEntity> questionsAnalysis,
      @JsonKey(name: 'questions_requiring_action')
      List<QuestionAnalysisEntity> questionsRequiringAction,
      @JsonKey(name: 'at_risk_employees')
      List<AtRiskEmployeeEntity> atRiskEmployees});

  @override
  $GlobalStatsEntityCopyWith<$Res>? get globalStats;
}

/// @nodoc
class __$$QvstAnalysisEntityImplCopyWithImpl<$Res>
    extends _$QvstAnalysisEntityCopyWithImpl<$Res, _$QvstAnalysisEntityImpl>
    implements _$$QvstAnalysisEntityImplCopyWith<$Res> {
  __$$QvstAnalysisEntityImplCopyWithImpl(_$QvstAnalysisEntityImpl _value,
      $Res Function(_$QvstAnalysisEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = freezed,
    Object? campaignName = null,
    Object? campaignStatus = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? themes = null,
    Object? globalStats = freezed,
    Object? globalDistribution = freezed,
    Object? themesAnalysis = freezed,
    Object? questionsAnalysis = null,
    Object? questionsRequiringAction = null,
    Object? atRiskEmployees = null,
  }) {
    return _then(_$QvstAnalysisEntityImpl(
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      themes: null == themes
          ? _value._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<QvstThemeEntity>,
      globalStats: freezed == globalStats
          ? _value.globalStats
          : globalStats // ignore: cast_nullable_to_non_nullable
              as GlobalStatsEntity?,
      globalDistribution: freezed == globalDistribution
          ? _value._globalDistribution
          : globalDistribution // ignore: cast_nullable_to_non_nullable
              as List<GlobalDistributionEntity>?,
      themesAnalysis: freezed == themesAnalysis
          ? _value._themesAnalysis
          : themesAnalysis // ignore: cast_nullable_to_non_nullable
              as List<ThemeAnalysisEntity>?,
      questionsAnalysis: null == questionsAnalysis
          ? _value._questionsAnalysis
          : questionsAnalysis // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnalysisEntity>,
      questionsRequiringAction: null == questionsRequiringAction
          ? _value._questionsRequiringAction
          : questionsRequiringAction // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnalysisEntity>,
      atRiskEmployees: null == atRiskEmployees
          ? _value._atRiskEmployees
          : atRiskEmployees // ignore: cast_nullable_to_non_nullable
              as List<AtRiskEmployeeEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QvstAnalysisEntityImpl implements _QvstAnalysisEntity {
  const _$QvstAnalysisEntityImpl(
      {@JsonKey(name: 'campaign_id') this.campaignId,
      @JsonKey(name: 'campaign_name', defaultValue: '') this.campaignName = '',
      @JsonKey(name: 'campaign_status', defaultValue: '')
      this.campaignStatus = '',
      @JsonKey(name: 'start_date', defaultValue: '') this.startDate = '',
      @JsonKey(name: 'end_date', defaultValue: '') this.endDate = '',
      @JsonKey(name: 'themes') final List<QvstThemeEntity> themes = const [],
      @JsonKey(name: 'global_stats') this.globalStats,
      @JsonKey(name: 'global_distribution')
      final List<GlobalDistributionEntity>? globalDistribution = const [],
      @JsonKey(name: 'themes_analysis')
      final List<ThemeAnalysisEntity>? themesAnalysis = const [],
      @JsonKey(name: 'questions_analysis')
      final List<QuestionAnalysisEntity> questionsAnalysis = const [],
      @JsonKey(name: 'questions_requiring_action')
      final List<QuestionAnalysisEntity> questionsRequiringAction = const [],
      @JsonKey(name: 'at_risk_employees')
      final List<AtRiskEmployeeEntity> atRiskEmployees = const []})
      : _themes = themes,
        _globalDistribution = globalDistribution,
        _themesAnalysis = themesAnalysis,
        _questionsAnalysis = questionsAnalysis,
        _questionsRequiringAction = questionsRequiringAction,
        _atRiskEmployees = atRiskEmployees;

  factory _$QvstAnalysisEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QvstAnalysisEntityImplFromJson(json);

  @override
  @JsonKey(name: 'campaign_id')
  final int? campaignId;
  @override
  @JsonKey(name: 'campaign_name', defaultValue: '')
  final String campaignName;
  @override
  @JsonKey(name: 'campaign_status', defaultValue: '')
  final String campaignStatus;
  @override
  @JsonKey(name: 'start_date', defaultValue: '')
  final String startDate;
  @override
  @JsonKey(name: 'end_date', defaultValue: '')
  final String endDate;
  final List<QvstThemeEntity> _themes;
  @override
  @JsonKey(name: 'themes')
  List<QvstThemeEntity> get themes {
    if (_themes is EqualUnmodifiableListView) return _themes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_themes);
  }

  @override
  @JsonKey(name: 'global_stats')
  final GlobalStatsEntity? globalStats;
  final List<GlobalDistributionEntity>? _globalDistribution;
  @override
  @JsonKey(name: 'global_distribution')
  List<GlobalDistributionEntity>? get globalDistribution {
    final value = _globalDistribution;
    if (value == null) return null;
    if (_globalDistribution is EqualUnmodifiableListView)
      return _globalDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ThemeAnalysisEntity>? _themesAnalysis;
  @override
  @JsonKey(name: 'themes_analysis')
  List<ThemeAnalysisEntity>? get themesAnalysis {
    final value = _themesAnalysis;
    if (value == null) return null;
    if (_themesAnalysis is EqualUnmodifiableListView) return _themesAnalysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<QuestionAnalysisEntity> _questionsAnalysis;
  @override
  @JsonKey(name: 'questions_analysis')
  List<QuestionAnalysisEntity> get questionsAnalysis {
    if (_questionsAnalysis is EqualUnmodifiableListView)
      return _questionsAnalysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionsAnalysis);
  }

  final List<QuestionAnalysisEntity> _questionsRequiringAction;
  @override
  @JsonKey(name: 'questions_requiring_action')
  List<QuestionAnalysisEntity> get questionsRequiringAction {
    if (_questionsRequiringAction is EqualUnmodifiableListView)
      return _questionsRequiringAction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionsRequiringAction);
  }

  final List<AtRiskEmployeeEntity> _atRiskEmployees;
  @override
  @JsonKey(name: 'at_risk_employees')
  List<AtRiskEmployeeEntity> get atRiskEmployees {
    if (_atRiskEmployees is EqualUnmodifiableListView) return _atRiskEmployees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_atRiskEmployees);
  }

  @override
  String toString() {
    return 'QvstAnalysisEntity(campaignId: $campaignId, campaignName: $campaignName, campaignStatus: $campaignStatus, startDate: $startDate, endDate: $endDate, themes: $themes, globalStats: $globalStats, globalDistribution: $globalDistribution, themesAnalysis: $themesAnalysis, questionsAnalysis: $questionsAnalysis, questionsRequiringAction: $questionsRequiringAction, atRiskEmployees: $atRiskEmployees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QvstAnalysisEntityImpl &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.campaignStatus, campaignStatus) ||
                other.campaignStatus == campaignStatus) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._themes, _themes) &&
            (identical(other.globalStats, globalStats) ||
                other.globalStats == globalStats) &&
            const DeepCollectionEquality()
                .equals(other._globalDistribution, _globalDistribution) &&
            const DeepCollectionEquality()
                .equals(other._themesAnalysis, _themesAnalysis) &&
            const DeepCollectionEquality()
                .equals(other._questionsAnalysis, _questionsAnalysis) &&
            const DeepCollectionEquality().equals(
                other._questionsRequiringAction, _questionsRequiringAction) &&
            const DeepCollectionEquality()
                .equals(other._atRiskEmployees, _atRiskEmployees));
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
      const DeepCollectionEquality().hash(_themes),
      globalStats,
      const DeepCollectionEquality().hash(_globalDistribution),
      const DeepCollectionEquality().hash(_themesAnalysis),
      const DeepCollectionEquality().hash(_questionsAnalysis),
      const DeepCollectionEquality().hash(_questionsRequiringAction),
      const DeepCollectionEquality().hash(_atRiskEmployees));

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QvstAnalysisEntityImplCopyWith<_$QvstAnalysisEntityImpl> get copyWith =>
      __$$QvstAnalysisEntityImplCopyWithImpl<_$QvstAnalysisEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QvstAnalysisEntityImplToJson(
      this,
    );
  }
}

abstract class _QvstAnalysisEntity implements QvstAnalysisEntity {
  const factory _QvstAnalysisEntity(
          {@JsonKey(name: 'campaign_id') final int? campaignId,
          @JsonKey(name: 'campaign_name', defaultValue: '')
          final String campaignName,
          @JsonKey(name: 'campaign_status', defaultValue: '')
          final String campaignStatus,
          @JsonKey(name: 'start_date', defaultValue: '') final String startDate,
          @JsonKey(name: 'end_date', defaultValue: '') final String endDate,
          @JsonKey(name: 'themes') final List<QvstThemeEntity> themes,
          @JsonKey(name: 'global_stats') final GlobalStatsEntity? globalStats,
          @JsonKey(name: 'global_distribution')
          final List<GlobalDistributionEntity>? globalDistribution,
          @JsonKey(name: 'themes_analysis')
          final List<ThemeAnalysisEntity>? themesAnalysis,
          @JsonKey(name: 'questions_analysis')
          final List<QuestionAnalysisEntity> questionsAnalysis,
          @JsonKey(name: 'questions_requiring_action')
          final List<QuestionAnalysisEntity> questionsRequiringAction,
          @JsonKey(name: 'at_risk_employees')
          final List<AtRiskEmployeeEntity> atRiskEmployees}) =
      _$QvstAnalysisEntityImpl;

  factory _QvstAnalysisEntity.fromJson(Map<String, dynamic> json) =
      _$QvstAnalysisEntityImpl.fromJson;

  @override
  @JsonKey(name: 'campaign_id')
  int? get campaignId;
  @override
  @JsonKey(name: 'campaign_name', defaultValue: '')
  String get campaignName;
  @override
  @JsonKey(name: 'campaign_status', defaultValue: '')
  String get campaignStatus;
  @override
  @JsonKey(name: 'start_date', defaultValue: '')
  String get startDate;
  @override
  @JsonKey(name: 'end_date', defaultValue: '')
  String get endDate;
  @override
  @JsonKey(name: 'themes')
  List<QvstThemeEntity> get themes;
  @override
  @JsonKey(name: 'global_stats')
  GlobalStatsEntity? get globalStats;
  @override
  @JsonKey(name: 'global_distribution')
  List<GlobalDistributionEntity>? get globalDistribution;
  @override
  @JsonKey(name: 'themes_analysis')
  List<ThemeAnalysisEntity>? get themesAnalysis;
  @override
  @JsonKey(name: 'questions_analysis')
  List<QuestionAnalysisEntity> get questionsAnalysis;
  @override
  @JsonKey(name: 'questions_requiring_action')
  List<QuestionAnalysisEntity> get questionsRequiringAction;
  @override
  @JsonKey(name: 'at_risk_employees')
  List<AtRiskEmployeeEntity> get atRiskEmployees;

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QvstAnalysisEntityImplCopyWith<_$QvstAnalysisEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalStatsEntity _$GlobalStatsEntityFromJson(Map<String, dynamic> json) {
  return _GlobalStatsEntity.fromJson(json);
}

/// @nodoc
mixin _$GlobalStatsEntity {
  @JsonKey(name: 'total_respondents', fromJson: _parseInt)
  int? get totalRespondents => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions', fromJson: _parseInt)
  int? get totalQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_satisfaction')
  double? get averageSatisfaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'requires_action')
  bool? get requiresAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'at_risk_count', fromJson: _parseInt)
  int? get atRiskCount => throw _privateConstructorUsedError;

  /// Serializes this GlobalStatsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlobalStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalStatsEntityCopyWith<GlobalStatsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStatsEntityCopyWith<$Res> {
  factory $GlobalStatsEntityCopyWith(
          GlobalStatsEntity value, $Res Function(GlobalStatsEntity) then) =
      _$GlobalStatsEntityCopyWithImpl<$Res, GlobalStatsEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_respondents', fromJson: _parseInt)
      int? totalRespondents,
      @JsonKey(name: 'total_questions', fromJson: _parseInt)
      int? totalQuestions,
      @JsonKey(name: 'average_satisfaction') double? averageSatisfaction,
      @JsonKey(name: 'requires_action') bool? requiresAction,
      @JsonKey(name: 'at_risk_count', fromJson: _parseInt) int? atRiskCount});
}

/// @nodoc
class _$GlobalStatsEntityCopyWithImpl<$Res, $Val extends GlobalStatsEntity>
    implements $GlobalStatsEntityCopyWith<$Res> {
  _$GlobalStatsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRespondents = freezed,
    Object? totalQuestions = freezed,
    Object? averageSatisfaction = freezed,
    Object? requiresAction = freezed,
    Object? atRiskCount = freezed,
  }) {
    return _then(_value.copyWith(
      totalRespondents: freezed == totalRespondents
          ? _value.totalRespondents
          : totalRespondents // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      averageSatisfaction: freezed == averageSatisfaction
          ? _value.averageSatisfaction
          : averageSatisfaction // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _value.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      atRiskCount: freezed == atRiskCount
          ? _value.atRiskCount
          : atRiskCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalStatsEntityImplCopyWith<$Res>
    implements $GlobalStatsEntityCopyWith<$Res> {
  factory _$$GlobalStatsEntityImplCopyWith(_$GlobalStatsEntityImpl value,
          $Res Function(_$GlobalStatsEntityImpl) then) =
      __$$GlobalStatsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_respondents', fromJson: _parseInt)
      int? totalRespondents,
      @JsonKey(name: 'total_questions', fromJson: _parseInt)
      int? totalQuestions,
      @JsonKey(name: 'average_satisfaction') double? averageSatisfaction,
      @JsonKey(name: 'requires_action') bool? requiresAction,
      @JsonKey(name: 'at_risk_count', fromJson: _parseInt) int? atRiskCount});
}

/// @nodoc
class __$$GlobalStatsEntityImplCopyWithImpl<$Res>
    extends _$GlobalStatsEntityCopyWithImpl<$Res, _$GlobalStatsEntityImpl>
    implements _$$GlobalStatsEntityImplCopyWith<$Res> {
  __$$GlobalStatsEntityImplCopyWithImpl(_$GlobalStatsEntityImpl _value,
      $Res Function(_$GlobalStatsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRespondents = freezed,
    Object? totalQuestions = freezed,
    Object? averageSatisfaction = freezed,
    Object? requiresAction = freezed,
    Object? atRiskCount = freezed,
  }) {
    return _then(_$GlobalStatsEntityImpl(
      totalRespondents: freezed == totalRespondents
          ? _value.totalRespondents
          : totalRespondents // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      averageSatisfaction: freezed == averageSatisfaction
          ? _value.averageSatisfaction
          : averageSatisfaction // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _value.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      atRiskCount: freezed == atRiskCount
          ? _value.atRiskCount
          : atRiskCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalStatsEntityImpl implements _GlobalStatsEntity {
  const _$GlobalStatsEntityImpl(
      {@JsonKey(name: 'total_respondents', fromJson: _parseInt)
      this.totalRespondents,
      @JsonKey(name: 'total_questions', fromJson: _parseInt)
      this.totalQuestions,
      @JsonKey(name: 'average_satisfaction') this.averageSatisfaction,
      @JsonKey(name: 'requires_action') this.requiresAction,
      @JsonKey(name: 'at_risk_count', fromJson: _parseInt) this.atRiskCount});

  factory _$GlobalStatsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalStatsEntityImplFromJson(json);

  @override
  @JsonKey(name: 'total_respondents', fromJson: _parseInt)
  final int? totalRespondents;
  @override
  @JsonKey(name: 'total_questions', fromJson: _parseInt)
  final int? totalQuestions;
  @override
  @JsonKey(name: 'average_satisfaction')
  final double? averageSatisfaction;
  @override
  @JsonKey(name: 'requires_action')
  final bool? requiresAction;
  @override
  @JsonKey(name: 'at_risk_count', fromJson: _parseInt)
  final int? atRiskCount;

  @override
  String toString() {
    return 'GlobalStatsEntity(totalRespondents: $totalRespondents, totalQuestions: $totalQuestions, averageSatisfaction: $averageSatisfaction, requiresAction: $requiresAction, atRiskCount: $atRiskCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalStatsEntityImpl &&
            (identical(other.totalRespondents, totalRespondents) ||
                other.totalRespondents == totalRespondents) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.averageSatisfaction, averageSatisfaction) ||
                other.averageSatisfaction == averageSatisfaction) &&
            (identical(other.requiresAction, requiresAction) ||
                other.requiresAction == requiresAction) &&
            (identical(other.atRiskCount, atRiskCount) ||
                other.atRiskCount == atRiskCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalRespondents, totalQuestions,
      averageSatisfaction, requiresAction, atRiskCount);

  /// Create a copy of GlobalStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalStatsEntityImplCopyWith<_$GlobalStatsEntityImpl> get copyWith =>
      __$$GlobalStatsEntityImplCopyWithImpl<_$GlobalStatsEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalStatsEntityImplToJson(
      this,
    );
  }
}

abstract class _GlobalStatsEntity implements GlobalStatsEntity {
  const factory _GlobalStatsEntity(
      {@JsonKey(name: 'total_respondents', fromJson: _parseInt)
      final int? totalRespondents,
      @JsonKey(name: 'total_questions', fromJson: _parseInt)
      final int? totalQuestions,
      @JsonKey(name: 'average_satisfaction') final double? averageSatisfaction,
      @JsonKey(name: 'requires_action') final bool? requiresAction,
      @JsonKey(name: 'at_risk_count', fromJson: _parseInt)
      final int? atRiskCount}) = _$GlobalStatsEntityImpl;

  factory _GlobalStatsEntity.fromJson(Map<String, dynamic> json) =
      _$GlobalStatsEntityImpl.fromJson;

  @override
  @JsonKey(name: 'total_respondents', fromJson: _parseInt)
  int? get totalRespondents;
  @override
  @JsonKey(name: 'total_questions', fromJson: _parseInt)
  int? get totalQuestions;
  @override
  @JsonKey(name: 'average_satisfaction')
  double? get averageSatisfaction;
  @override
  @JsonKey(name: 'requires_action')
  bool? get requiresAction;
  @override
  @JsonKey(name: 'at_risk_count', fromJson: _parseInt)
  int? get atRiskCount;

  /// Create a copy of GlobalStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalStatsEntityImplCopyWith<_$GlobalStatsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalDistributionEntity _$GlobalDistributionEntityFromJson(
    Map<String, dynamic> json) {
  return _GlobalDistributionEntity.fromJson(json);
}

/// @nodoc
mixin _$GlobalDistributionEntity {
  int? get score => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this GlobalDistributionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalDistributionEntityCopyWith<GlobalDistributionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalDistributionEntityCopyWith<$Res> {
  factory $GlobalDistributionEntityCopyWith(GlobalDistributionEntity value,
          $Res Function(GlobalDistributionEntity) then) =
      _$GlobalDistributionEntityCopyWithImpl<$Res, GlobalDistributionEntity>;
  @useResult
  $Res call({int? score, int? count});
}

/// @nodoc
class _$GlobalDistributionEntityCopyWithImpl<$Res,
        $Val extends GlobalDistributionEntity>
    implements $GlobalDistributionEntityCopyWith<$Res> {
  _$GlobalDistributionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalDistributionEntityImplCopyWith<$Res>
    implements $GlobalDistributionEntityCopyWith<$Res> {
  factory _$$GlobalDistributionEntityImplCopyWith(
          _$GlobalDistributionEntityImpl value,
          $Res Function(_$GlobalDistributionEntityImpl) then) =
      __$$GlobalDistributionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? score, int? count});
}

/// @nodoc
class __$$GlobalDistributionEntityImplCopyWithImpl<$Res>
    extends _$GlobalDistributionEntityCopyWithImpl<$Res,
        _$GlobalDistributionEntityImpl>
    implements _$$GlobalDistributionEntityImplCopyWith<$Res> {
  __$$GlobalDistributionEntityImplCopyWithImpl(
      _$GlobalDistributionEntityImpl _value,
      $Res Function(_$GlobalDistributionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? count = freezed,
  }) {
    return _then(_$GlobalDistributionEntityImpl(
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalDistributionEntityImpl implements _GlobalDistributionEntity {
  const _$GlobalDistributionEntityImpl({this.score, this.count});

  factory _$GlobalDistributionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalDistributionEntityImplFromJson(json);

  @override
  final int? score;
  @override
  final int? count;

  @override
  String toString() {
    return 'GlobalDistributionEntity(score: $score, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalDistributionEntityImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, score, count);

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalDistributionEntityImplCopyWith<_$GlobalDistributionEntityImpl>
      get copyWith => __$$GlobalDistributionEntityImplCopyWithImpl<
          _$GlobalDistributionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalDistributionEntityImplToJson(
      this,
    );
  }
}

abstract class _GlobalDistributionEntity implements GlobalDistributionEntity {
  const factory _GlobalDistributionEntity(
      {final int? score, final int? count}) = _$GlobalDistributionEntityImpl;

  factory _GlobalDistributionEntity.fromJson(Map<String, dynamic> json) =
      _$GlobalDistributionEntityImpl.fromJson;

  @override
  int? get score;
  @override
  int? get count;

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalDistributionEntityImplCopyWith<_$GlobalDistributionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ThemeAnalysisEntity _$ThemeAnalysisEntityFromJson(Map<String, dynamic> json) {
  return _ThemeAnalysisEntity.fromJson(json);
}

/// @nodoc
mixin _$ThemeAnalysisEntity {
  @JsonKey(name: 'theme_id', defaultValue: '')
  String get themeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'theme_name', defaultValue: '')
  String get themeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_score')
  double? get averageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'requires_action')
  bool? get requiresAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'low_score_questions_count')
  int? get lowScoreQuestionsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
  int? get totalQuestions => throw _privateConstructorUsedError;

  /// Serializes this ThemeAnalysisEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThemeAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeAnalysisEntityCopyWith<ThemeAnalysisEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeAnalysisEntityCopyWith<$Res> {
  factory $ThemeAnalysisEntityCopyWith(
          ThemeAnalysisEntity value, $Res Function(ThemeAnalysisEntity) then) =
      _$ThemeAnalysisEntityCopyWithImpl<$Res, ThemeAnalysisEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'theme_id', defaultValue: '') String themeId,
      @JsonKey(name: 'theme_name', defaultValue: '') String themeName,
      @JsonKey(name: 'average_score') double? averageScore,
      @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
      @JsonKey(name: 'requires_action') bool? requiresAction,
      @JsonKey(name: 'low_score_questions_count') int? lowScoreQuestionsCount,
      @JsonKey(name: 'total_questions') int? totalQuestions});
}

/// @nodoc
class _$ThemeAnalysisEntityCopyWithImpl<$Res, $Val extends ThemeAnalysisEntity>
    implements $ThemeAnalysisEntityCopyWith<$Res> {
  _$ThemeAnalysisEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeId = null,
    Object? themeName = null,
    Object? averageScore = freezed,
    Object? satisfactionPercentage = freezed,
    Object? requiresAction = freezed,
    Object? lowScoreQuestionsCount = freezed,
    Object? totalQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _value.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _value.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      lowScoreQuestionsCount: freezed == lowScoreQuestionsCount
          ? _value.lowScoreQuestionsCount
          : lowScoreQuestionsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeAnalysisEntityImplCopyWith<$Res>
    implements $ThemeAnalysisEntityCopyWith<$Res> {
  factory _$$ThemeAnalysisEntityImplCopyWith(_$ThemeAnalysisEntityImpl value,
          $Res Function(_$ThemeAnalysisEntityImpl) then) =
      __$$ThemeAnalysisEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'theme_id', defaultValue: '') String themeId,
      @JsonKey(name: 'theme_name', defaultValue: '') String themeName,
      @JsonKey(name: 'average_score') double? averageScore,
      @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
      @JsonKey(name: 'requires_action') bool? requiresAction,
      @JsonKey(name: 'low_score_questions_count') int? lowScoreQuestionsCount,
      @JsonKey(name: 'total_questions') int? totalQuestions});
}

/// @nodoc
class __$$ThemeAnalysisEntityImplCopyWithImpl<$Res>
    extends _$ThemeAnalysisEntityCopyWithImpl<$Res, _$ThemeAnalysisEntityImpl>
    implements _$$ThemeAnalysisEntityImplCopyWith<$Res> {
  __$$ThemeAnalysisEntityImplCopyWithImpl(_$ThemeAnalysisEntityImpl _value,
      $Res Function(_$ThemeAnalysisEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeId = null,
    Object? themeName = null,
    Object? averageScore = freezed,
    Object? satisfactionPercentage = freezed,
    Object? requiresAction = freezed,
    Object? lowScoreQuestionsCount = freezed,
    Object? totalQuestions = freezed,
  }) {
    return _then(_$ThemeAnalysisEntityImpl(
      themeId: null == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      themeName: null == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _value.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _value.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      lowScoreQuestionsCount: freezed == lowScoreQuestionsCount
          ? _value.lowScoreQuestionsCount
          : lowScoreQuestionsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThemeAnalysisEntityImpl implements _ThemeAnalysisEntity {
  const _$ThemeAnalysisEntityImpl(
      {@JsonKey(name: 'theme_id', defaultValue: '') this.themeId = '',
      @JsonKey(name: 'theme_name', defaultValue: '') this.themeName = '',
      @JsonKey(name: 'average_score') this.averageScore,
      @JsonKey(name: 'satisfaction_percentage') this.satisfactionPercentage,
      @JsonKey(name: 'requires_action') this.requiresAction,
      @JsonKey(name: 'low_score_questions_count') this.lowScoreQuestionsCount,
      @JsonKey(name: 'total_questions') this.totalQuestions});

  factory _$ThemeAnalysisEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThemeAnalysisEntityImplFromJson(json);

  @override
  @JsonKey(name: 'theme_id', defaultValue: '')
  final String themeId;
  @override
  @JsonKey(name: 'theme_name', defaultValue: '')
  final String themeName;
  @override
  @JsonKey(name: 'average_score')
  final double? averageScore;
  @override
  @JsonKey(name: 'satisfaction_percentage')
  final double? satisfactionPercentage;
  @override
  @JsonKey(name: 'requires_action')
  final bool? requiresAction;
  @override
  @JsonKey(name: 'low_score_questions_count')
  final int? lowScoreQuestionsCount;
  @override
  @JsonKey(name: 'total_questions')
  final int? totalQuestions;

  @override
  String toString() {
    return 'ThemeAnalysisEntity(themeId: $themeId, themeName: $themeName, averageScore: $averageScore, satisfactionPercentage: $satisfactionPercentage, requiresAction: $requiresAction, lowScoreQuestionsCount: $lowScoreQuestionsCount, totalQuestions: $totalQuestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeAnalysisEntityImpl &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.satisfactionPercentage, satisfactionPercentage) ||
                other.satisfactionPercentage == satisfactionPercentage) &&
            (identical(other.requiresAction, requiresAction) ||
                other.requiresAction == requiresAction) &&
            (identical(other.lowScoreQuestionsCount, lowScoreQuestionsCount) ||
                other.lowScoreQuestionsCount == lowScoreQuestionsCount) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      themeId,
      themeName,
      averageScore,
      satisfactionPercentage,
      requiresAction,
      lowScoreQuestionsCount,
      totalQuestions);

  /// Create a copy of ThemeAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeAnalysisEntityImplCopyWith<_$ThemeAnalysisEntityImpl> get copyWith =>
      __$$ThemeAnalysisEntityImplCopyWithImpl<_$ThemeAnalysisEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThemeAnalysisEntityImplToJson(
      this,
    );
  }
}

abstract class _ThemeAnalysisEntity implements ThemeAnalysisEntity {
  const factory _ThemeAnalysisEntity(
          {@JsonKey(name: 'theme_id', defaultValue: '') final String themeId,
          @JsonKey(name: 'theme_name', defaultValue: '') final String themeName,
          @JsonKey(name: 'average_score') final double? averageScore,
          @JsonKey(name: 'satisfaction_percentage')
          final double? satisfactionPercentage,
          @JsonKey(name: 'requires_action') final bool? requiresAction,
          @JsonKey(name: 'low_score_questions_count')
          final int? lowScoreQuestionsCount,
          @JsonKey(name: 'total_questions') final int? totalQuestions}) =
      _$ThemeAnalysisEntityImpl;

  factory _ThemeAnalysisEntity.fromJson(Map<String, dynamic> json) =
      _$ThemeAnalysisEntityImpl.fromJson;

  @override
  @JsonKey(name: 'theme_id', defaultValue: '')
  String get themeId;
  @override
  @JsonKey(name: 'theme_name', defaultValue: '')
  String get themeName;
  @override
  @JsonKey(name: 'average_score')
  double? get averageScore;
  @override
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage;
  @override
  @JsonKey(name: 'requires_action')
  bool? get requiresAction;
  @override
  @JsonKey(name: 'low_score_questions_count')
  int? get lowScoreQuestionsCount;
  @override
  @JsonKey(name: 'total_questions')
  int? get totalQuestions;

  /// Create a copy of ThemeAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeAnalysisEntityImplCopyWith<_$ThemeAnalysisEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionAnalysisEntity _$QuestionAnalysisEntityFromJson(
    Map<String, dynamic> json) {
  return _QuestionAnalysisEntity.fromJson(json);
}

/// @nodoc
mixin _$QuestionAnalysisEntity {
  @JsonKey(name: 'question_id', defaultValue: '')
  String get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text', defaultValue: '')
  String get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'theme_id')
  String? get themeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'theme_name')
  String? get themeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_score')
  double? get averageScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'requires_action')
  bool? get requiresAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_responses')
  int? get totalResponses => throw _privateConstructorUsedError;
  @JsonKey(name: 'answers')
  List<AnswerDistributionEntity> get answers =>
      throw _privateConstructorUsedError;

  /// Serializes this QuestionAnalysisEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionAnalysisEntityCopyWith<QuestionAnalysisEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionAnalysisEntityCopyWith<$Res> {
  factory $QuestionAnalysisEntityCopyWith(QuestionAnalysisEntity value,
          $Res Function(QuestionAnalysisEntity) then) =
      _$QuestionAnalysisEntityCopyWithImpl<$Res, QuestionAnalysisEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id', defaultValue: '') String questionId,
      @JsonKey(name: 'question_text', defaultValue: '') String questionText,
      @JsonKey(name: 'theme_id') String? themeId,
      @JsonKey(name: 'theme_name') String? themeName,
      @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
      @JsonKey(name: 'average_score') double? averageScore,
      @JsonKey(name: 'requires_action') bool? requiresAction,
      @JsonKey(name: 'total_responses') int? totalResponses,
      @JsonKey(name: 'answers') List<AnswerDistributionEntity> answers});
}

/// @nodoc
class _$QuestionAnalysisEntityCopyWithImpl<$Res,
        $Val extends QuestionAnalysisEntity>
    implements $QuestionAnalysisEntityCopyWith<$Res> {
  _$QuestionAnalysisEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? questionText = null,
    Object? themeId = freezed,
    Object? themeName = freezed,
    Object? satisfactionPercentage = freezed,
    Object? averageScore = freezed,
    Object? requiresAction = freezed,
    Object? totalResponses = freezed,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: freezed == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String?,
      themeName: freezed == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String?,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _value.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _value.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalResponses: freezed == totalResponses
          ? _value.totalResponses
          : totalResponses // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerDistributionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionAnalysisEntityImplCopyWith<$Res>
    implements $QuestionAnalysisEntityCopyWith<$Res> {
  factory _$$QuestionAnalysisEntityImplCopyWith(
          _$QuestionAnalysisEntityImpl value,
          $Res Function(_$QuestionAnalysisEntityImpl) then) =
      __$$QuestionAnalysisEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'question_id', defaultValue: '') String questionId,
      @JsonKey(name: 'question_text', defaultValue: '') String questionText,
      @JsonKey(name: 'theme_id') String? themeId,
      @JsonKey(name: 'theme_name') String? themeName,
      @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
      @JsonKey(name: 'average_score') double? averageScore,
      @JsonKey(name: 'requires_action') bool? requiresAction,
      @JsonKey(name: 'total_responses') int? totalResponses,
      @JsonKey(name: 'answers') List<AnswerDistributionEntity> answers});
}

/// @nodoc
class __$$QuestionAnalysisEntityImplCopyWithImpl<$Res>
    extends _$QuestionAnalysisEntityCopyWithImpl<$Res,
        _$QuestionAnalysisEntityImpl>
    implements _$$QuestionAnalysisEntityImplCopyWith<$Res> {
  __$$QuestionAnalysisEntityImplCopyWithImpl(
      _$QuestionAnalysisEntityImpl _value,
      $Res Function(_$QuestionAnalysisEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? questionText = null,
    Object? themeId = freezed,
    Object? themeName = freezed,
    Object? satisfactionPercentage = freezed,
    Object? averageScore = freezed,
    Object? requiresAction = freezed,
    Object? totalResponses = freezed,
    Object? answers = null,
  }) {
    return _then(_$QuestionAnalysisEntityImpl(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: freezed == themeId
          ? _value.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String?,
      themeName: freezed == themeName
          ? _value.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String?,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _value.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _value.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalResponses: freezed == totalResponses
          ? _value.totalResponses
          : totalResponses // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerDistributionEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionAnalysisEntityImpl implements _QuestionAnalysisEntity {
  const _$QuestionAnalysisEntityImpl(
      {@JsonKey(name: 'question_id', defaultValue: '') this.questionId = '',
      @JsonKey(name: 'question_text', defaultValue: '') this.questionText = '',
      @JsonKey(name: 'theme_id') this.themeId,
      @JsonKey(name: 'theme_name') this.themeName,
      @JsonKey(name: 'satisfaction_percentage') this.satisfactionPercentage,
      @JsonKey(name: 'average_score') this.averageScore,
      @JsonKey(name: 'requires_action') this.requiresAction,
      @JsonKey(name: 'total_responses') this.totalResponses,
      @JsonKey(name: 'answers')
      final List<AnswerDistributionEntity> answers = const []})
      : _answers = answers;

  factory _$QuestionAnalysisEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionAnalysisEntityImplFromJson(json);

  @override
  @JsonKey(name: 'question_id', defaultValue: '')
  final String questionId;
  @override
  @JsonKey(name: 'question_text', defaultValue: '')
  final String questionText;
  @override
  @JsonKey(name: 'theme_id')
  final String? themeId;
  @override
  @JsonKey(name: 'theme_name')
  final String? themeName;
  @override
  @JsonKey(name: 'satisfaction_percentage')
  final double? satisfactionPercentage;
  @override
  @JsonKey(name: 'average_score')
  final double? averageScore;
  @override
  @JsonKey(name: 'requires_action')
  final bool? requiresAction;
  @override
  @JsonKey(name: 'total_responses')
  final int? totalResponses;
  final List<AnswerDistributionEntity> _answers;
  @override
  @JsonKey(name: 'answers')
  List<AnswerDistributionEntity> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QuestionAnalysisEntity(questionId: $questionId, questionText: $questionText, themeId: $themeId, themeName: $themeName, satisfactionPercentage: $satisfactionPercentage, averageScore: $averageScore, requiresAction: $requiresAction, totalResponses: $totalResponses, answers: $answers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAnalysisEntityImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.themeId, themeId) || other.themeId == themeId) &&
            (identical(other.themeName, themeName) ||
                other.themeName == themeName) &&
            (identical(other.satisfactionPercentage, satisfactionPercentage) ||
                other.satisfactionPercentage == satisfactionPercentage) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.requiresAction, requiresAction) ||
                other.requiresAction == requiresAction) &&
            (identical(other.totalResponses, totalResponses) ||
                other.totalResponses == totalResponses) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      questionId,
      questionText,
      themeId,
      themeName,
      satisfactionPercentage,
      averageScore,
      requiresAction,
      totalResponses,
      const DeepCollectionEquality().hash(_answers));

  /// Create a copy of QuestionAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionAnalysisEntityImplCopyWith<_$QuestionAnalysisEntityImpl>
      get copyWith => __$$QuestionAnalysisEntityImplCopyWithImpl<
          _$QuestionAnalysisEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionAnalysisEntityImplToJson(
      this,
    );
  }
}

abstract class _QuestionAnalysisEntity implements QuestionAnalysisEntity {
  const factory _QuestionAnalysisEntity(
      {@JsonKey(name: 'question_id', defaultValue: '') final String questionId,
      @JsonKey(name: 'question_text', defaultValue: '')
      final String questionText,
      @JsonKey(name: 'theme_id') final String? themeId,
      @JsonKey(name: 'theme_name') final String? themeName,
      @JsonKey(name: 'satisfaction_percentage')
      final double? satisfactionPercentage,
      @JsonKey(name: 'average_score') final double? averageScore,
      @JsonKey(name: 'requires_action') final bool? requiresAction,
      @JsonKey(name: 'total_responses') final int? totalResponses,
      @JsonKey(name: 'answers')
      final List<AnswerDistributionEntity>
          answers}) = _$QuestionAnalysisEntityImpl;

  factory _QuestionAnalysisEntity.fromJson(Map<String, dynamic> json) =
      _$QuestionAnalysisEntityImpl.fromJson;

  @override
  @JsonKey(name: 'question_id', defaultValue: '')
  String get questionId;
  @override
  @JsonKey(name: 'question_text', defaultValue: '')
  String get questionText;
  @override
  @JsonKey(name: 'theme_id')
  String? get themeId;
  @override
  @JsonKey(name: 'theme_name')
  String? get themeName;
  @override
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage;
  @override
  @JsonKey(name: 'average_score')
  double? get averageScore;
  @override
  @JsonKey(name: 'requires_action')
  bool? get requiresAction;
  @override
  @JsonKey(name: 'total_responses')
  int? get totalResponses;
  @override
  @JsonKey(name: 'answers')
  List<AnswerDistributionEntity> get answers;

  /// Create a copy of QuestionAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionAnalysisEntityImplCopyWith<_$QuestionAnalysisEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AnswerDistributionEntity _$AnswerDistributionEntityFromJson(
    Map<String, dynamic> json) {
  return _AnswerDistributionEntity.fromJson(json);
}

/// @nodoc
mixin _$AnswerDistributionEntity {
  @JsonKey(name: 'id', defaultValue: '')
  String get answerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer', defaultValue: '')
  String get answerText => throw _privateConstructorUsedError;
  @JsonKey(name: 'value', fromJson: _parseInt)
  int? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'numberAnswered', fromJson: _parseInt)
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this AnswerDistributionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnswerDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnswerDistributionEntityCopyWith<AnswerDistributionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerDistributionEntityCopyWith<$Res> {
  factory $AnswerDistributionEntityCopyWith(AnswerDistributionEntity value,
          $Res Function(AnswerDistributionEntity) then) =
      _$AnswerDistributionEntityCopyWithImpl<$Res, AnswerDistributionEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String answerId,
      @JsonKey(name: 'answer', defaultValue: '') String answerText,
      @JsonKey(name: 'value', fromJson: _parseInt) int? score,
      @JsonKey(name: 'numberAnswered', fromJson: _parseInt) int? count});
}

/// @nodoc
class _$AnswerDistributionEntityCopyWithImpl<$Res,
        $Val extends AnswerDistributionEntity>
    implements $AnswerDistributionEntityCopyWith<$Res> {
  _$AnswerDistributionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnswerDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? answerText = null,
    Object? score = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      answerText: null == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerDistributionEntityImplCopyWith<$Res>
    implements $AnswerDistributionEntityCopyWith<$Res> {
  factory _$$AnswerDistributionEntityImplCopyWith(
          _$AnswerDistributionEntityImpl value,
          $Res Function(_$AnswerDistributionEntityImpl) then) =
      __$$AnswerDistributionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String answerId,
      @JsonKey(name: 'answer', defaultValue: '') String answerText,
      @JsonKey(name: 'value', fromJson: _parseInt) int? score,
      @JsonKey(name: 'numberAnswered', fromJson: _parseInt) int? count});
}

/// @nodoc
class __$$AnswerDistributionEntityImplCopyWithImpl<$Res>
    extends _$AnswerDistributionEntityCopyWithImpl<$Res,
        _$AnswerDistributionEntityImpl>
    implements _$$AnswerDistributionEntityImplCopyWith<$Res> {
  __$$AnswerDistributionEntityImplCopyWithImpl(
      _$AnswerDistributionEntityImpl _value,
      $Res Function(_$AnswerDistributionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnswerDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answerId = null,
    Object? answerText = null,
    Object? score = freezed,
    Object? count = freezed,
  }) {
    return _then(_$AnswerDistributionEntityImpl(
      answerId: null == answerId
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      answerText: null == answerText
          ? _value.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnswerDistributionEntityImpl implements _AnswerDistributionEntity {
  const _$AnswerDistributionEntityImpl(
      {@JsonKey(name: 'id', defaultValue: '') this.answerId = '',
      @JsonKey(name: 'answer', defaultValue: '') this.answerText = '',
      @JsonKey(name: 'value', fromJson: _parseInt) this.score,
      @JsonKey(name: 'numberAnswered', fromJson: _parseInt) this.count});

  factory _$AnswerDistributionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnswerDistributionEntityImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String answerId;
  @override
  @JsonKey(name: 'answer', defaultValue: '')
  final String answerText;
  @override
  @JsonKey(name: 'value', fromJson: _parseInt)
  final int? score;
  @override
  @JsonKey(name: 'numberAnswered', fromJson: _parseInt)
  final int? count;

  @override
  String toString() {
    return 'AnswerDistributionEntity(answerId: $answerId, answerText: $answerText, score: $score, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerDistributionEntityImpl &&
            (identical(other.answerId, answerId) ||
                other.answerId == answerId) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, answerId, answerText, score, count);

  /// Create a copy of AnswerDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerDistributionEntityImplCopyWith<_$AnswerDistributionEntityImpl>
      get copyWith => __$$AnswerDistributionEntityImplCopyWithImpl<
          _$AnswerDistributionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnswerDistributionEntityImplToJson(
      this,
    );
  }
}

abstract class _AnswerDistributionEntity implements AnswerDistributionEntity {
  const factory _AnswerDistributionEntity(
      {@JsonKey(name: 'id', defaultValue: '') final String answerId,
      @JsonKey(name: 'answer', defaultValue: '') final String answerText,
      @JsonKey(name: 'value', fromJson: _parseInt) final int? score,
      @JsonKey(name: 'numberAnswered', fromJson: _parseInt)
      final int? count}) = _$AnswerDistributionEntityImpl;

  factory _AnswerDistributionEntity.fromJson(Map<String, dynamic> json) =
      _$AnswerDistributionEntityImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get answerId;
  @override
  @JsonKey(name: 'answer', defaultValue: '')
  String get answerText;
  @override
  @JsonKey(name: 'value', fromJson: _parseInt)
  int? get score;
  @override
  @JsonKey(name: 'numberAnswered', fromJson: _parseInt)
  int? get count;

  /// Create a copy of AnswerDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnswerDistributionEntityImplCopyWith<_$AnswerDistributionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AtRiskEmployeeEntity _$AtRiskEmployeeEntityFromJson(Map<String, dynamic> json) {
  return _AtRiskEmployeeEntity.fromJson(json);
}

/// @nodoc
mixin _$AtRiskEmployeeEntity {
  @JsonKey(name: 'anonymous_user_id', defaultValue: '')
  String get anonymousUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'low_scores_count')
  int? get lowScoresCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_responses')
  int? get totalResponses => throw _privateConstructorUsedError;
  @JsonKey(name: 'critical_themes')
  List<String>? get criticalThemes => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_answer')
  String? get openAnswer => throw _privateConstructorUsedError;

  /// Serializes this AtRiskEmployeeEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AtRiskEmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AtRiskEmployeeEntityCopyWith<AtRiskEmployeeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtRiskEmployeeEntityCopyWith<$Res> {
  factory $AtRiskEmployeeEntityCopyWith(AtRiskEmployeeEntity value,
          $Res Function(AtRiskEmployeeEntity) then) =
      _$AtRiskEmployeeEntityCopyWithImpl<$Res, AtRiskEmployeeEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'anonymous_user_id', defaultValue: '')
      String anonymousUserId,
      @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
      @JsonKey(name: 'low_scores_count') int? lowScoresCount,
      @JsonKey(name: 'total_responses') int? totalResponses,
      @JsonKey(name: 'critical_themes') List<String>? criticalThemes,
      @JsonKey(name: 'open_answer') String? openAnswer});
}

/// @nodoc
class _$AtRiskEmployeeEntityCopyWithImpl<$Res,
        $Val extends AtRiskEmployeeEntity>
    implements $AtRiskEmployeeEntityCopyWith<$Res> {
  _$AtRiskEmployeeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AtRiskEmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anonymousUserId = null,
    Object? satisfactionPercentage = freezed,
    Object? lowScoresCount = freezed,
    Object? totalResponses = freezed,
    Object? criticalThemes = freezed,
    Object? openAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      anonymousUserId: null == anonymousUserId
          ? _value.anonymousUserId
          : anonymousUserId // ignore: cast_nullable_to_non_nullable
              as String,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _value.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      lowScoresCount: freezed == lowScoresCount
          ? _value.lowScoresCount
          : lowScoresCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResponses: freezed == totalResponses
          ? _value.totalResponses
          : totalResponses // ignore: cast_nullable_to_non_nullable
              as int?,
      criticalThemes: freezed == criticalThemes
          ? _value.criticalThemes
          : criticalThemes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      openAnswer: freezed == openAnswer
          ? _value.openAnswer
          : openAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtRiskEmployeeEntityImplCopyWith<$Res>
    implements $AtRiskEmployeeEntityCopyWith<$Res> {
  factory _$$AtRiskEmployeeEntityImplCopyWith(_$AtRiskEmployeeEntityImpl value,
          $Res Function(_$AtRiskEmployeeEntityImpl) then) =
      __$$AtRiskEmployeeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'anonymous_user_id', defaultValue: '')
      String anonymousUserId,
      @JsonKey(name: 'satisfaction_percentage') double? satisfactionPercentage,
      @JsonKey(name: 'low_scores_count') int? lowScoresCount,
      @JsonKey(name: 'total_responses') int? totalResponses,
      @JsonKey(name: 'critical_themes') List<String>? criticalThemes,
      @JsonKey(name: 'open_answer') String? openAnswer});
}

/// @nodoc
class __$$AtRiskEmployeeEntityImplCopyWithImpl<$Res>
    extends _$AtRiskEmployeeEntityCopyWithImpl<$Res, _$AtRiskEmployeeEntityImpl>
    implements _$$AtRiskEmployeeEntityImplCopyWith<$Res> {
  __$$AtRiskEmployeeEntityImplCopyWithImpl(_$AtRiskEmployeeEntityImpl _value,
      $Res Function(_$AtRiskEmployeeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AtRiskEmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anonymousUserId = null,
    Object? satisfactionPercentage = freezed,
    Object? lowScoresCount = freezed,
    Object? totalResponses = freezed,
    Object? criticalThemes = freezed,
    Object? openAnswer = freezed,
  }) {
    return _then(_$AtRiskEmployeeEntityImpl(
      anonymousUserId: null == anonymousUserId
          ? _value.anonymousUserId
          : anonymousUserId // ignore: cast_nullable_to_non_nullable
              as String,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _value.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      lowScoresCount: freezed == lowScoresCount
          ? _value.lowScoresCount
          : lowScoresCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResponses: freezed == totalResponses
          ? _value.totalResponses
          : totalResponses // ignore: cast_nullable_to_non_nullable
              as int?,
      criticalThemes: freezed == criticalThemes
          ? _value._criticalThemes
          : criticalThemes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      openAnswer: freezed == openAnswer
          ? _value.openAnswer
          : openAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AtRiskEmployeeEntityImpl implements _AtRiskEmployeeEntity {
  const _$AtRiskEmployeeEntityImpl(
      {@JsonKey(name: 'anonymous_user_id', defaultValue: '')
      this.anonymousUserId = '',
      @JsonKey(name: 'satisfaction_percentage') this.satisfactionPercentage,
      @JsonKey(name: 'low_scores_count') this.lowScoresCount,
      @JsonKey(name: 'total_responses') this.totalResponses,
      @JsonKey(name: 'critical_themes')
      final List<String>? criticalThemes = const [],
      @JsonKey(name: 'open_answer') this.openAnswer})
      : _criticalThemes = criticalThemes;

  factory _$AtRiskEmployeeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AtRiskEmployeeEntityImplFromJson(json);

  @override
  @JsonKey(name: 'anonymous_user_id', defaultValue: '')
  final String anonymousUserId;
  @override
  @JsonKey(name: 'satisfaction_percentage')
  final double? satisfactionPercentage;
  @override
  @JsonKey(name: 'low_scores_count')
  final int? lowScoresCount;
  @override
  @JsonKey(name: 'total_responses')
  final int? totalResponses;
  final List<String>? _criticalThemes;
  @override
  @JsonKey(name: 'critical_themes')
  List<String>? get criticalThemes {
    final value = _criticalThemes;
    if (value == null) return null;
    if (_criticalThemes is EqualUnmodifiableListView) return _criticalThemes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'open_answer')
  final String? openAnswer;

  @override
  String toString() {
    return 'AtRiskEmployeeEntity(anonymousUserId: $anonymousUserId, satisfactionPercentage: $satisfactionPercentage, lowScoresCount: $lowScoresCount, totalResponses: $totalResponses, criticalThemes: $criticalThemes, openAnswer: $openAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AtRiskEmployeeEntityImpl &&
            (identical(other.anonymousUserId, anonymousUserId) ||
                other.anonymousUserId == anonymousUserId) &&
            (identical(other.satisfactionPercentage, satisfactionPercentage) ||
                other.satisfactionPercentage == satisfactionPercentage) &&
            (identical(other.lowScoresCount, lowScoresCount) ||
                other.lowScoresCount == lowScoresCount) &&
            (identical(other.totalResponses, totalResponses) ||
                other.totalResponses == totalResponses) &&
            const DeepCollectionEquality()
                .equals(other._criticalThemes, _criticalThemes) &&
            (identical(other.openAnswer, openAnswer) ||
                other.openAnswer == openAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      anonymousUserId,
      satisfactionPercentage,
      lowScoresCount,
      totalResponses,
      const DeepCollectionEquality().hash(_criticalThemes),
      openAnswer);

  /// Create a copy of AtRiskEmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AtRiskEmployeeEntityImplCopyWith<_$AtRiskEmployeeEntityImpl>
      get copyWith =>
          __$$AtRiskEmployeeEntityImplCopyWithImpl<_$AtRiskEmployeeEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AtRiskEmployeeEntityImplToJson(
      this,
    );
  }
}

abstract class _AtRiskEmployeeEntity implements AtRiskEmployeeEntity {
  const factory _AtRiskEmployeeEntity(
          {@JsonKey(name: 'anonymous_user_id', defaultValue: '')
          final String anonymousUserId,
          @JsonKey(name: 'satisfaction_percentage')
          final double? satisfactionPercentage,
          @JsonKey(name: 'low_scores_count') final int? lowScoresCount,
          @JsonKey(name: 'total_responses') final int? totalResponses,
          @JsonKey(name: 'critical_themes') final List<String>? criticalThemes,
          @JsonKey(name: 'open_answer') final String? openAnswer}) =
      _$AtRiskEmployeeEntityImpl;

  factory _AtRiskEmployeeEntity.fromJson(Map<String, dynamic> json) =
      _$AtRiskEmployeeEntityImpl.fromJson;

  @override
  @JsonKey(name: 'anonymous_user_id', defaultValue: '')
  String get anonymousUserId;
  @override
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage;
  @override
  @JsonKey(name: 'low_scores_count')
  int? get lowScoresCount;
  @override
  @JsonKey(name: 'total_responses')
  int? get totalResponses;
  @override
  @JsonKey(name: 'critical_themes')
  List<String>? get criticalThemes;
  @override
  @JsonKey(name: 'open_answer')
  String? get openAnswer;

  /// Create a copy of AtRiskEmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AtRiskEmployeeEntityImplCopyWith<_$AtRiskEmployeeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
