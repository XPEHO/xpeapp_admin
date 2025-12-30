// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qvst_analysis_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QvstAnalysisEntity {
  @JsonKey(name: 'campaign_id')
  int? get campaignId;
  @JsonKey(name: 'campaign_name', defaultValue: '')
  String get campaignName;
  @JsonKey(name: 'campaign_status', defaultValue: '')
  String get campaignStatus;
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @JsonKey(name: 'themes')
  List<QvstThemeEntity> get themes;
  @JsonKey(name: 'global_stats')
  GlobalStatsEntity? get globalStats;
  @JsonKey(name: 'global_distribution')
  List<GlobalDistributionEntity>? get globalDistribution;
  @JsonKey(name: 'themes_analysis')
  List<ThemeAnalysisEntity>? get themesAnalysis;
  @JsonKey(name: 'questions_analysis')
  List<QuestionAnalysisEntity> get questionsAnalysis;
  @JsonKey(name: 'questions_requiring_action')
  List<QuestionAnalysisEntity> get questionsRequiringAction;
  @JsonKey(name: 'at_risk_employees')
  List<AtRiskEmployeeEntity> get atRiskEmployees;

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QvstAnalysisEntityCopyWith<QvstAnalysisEntity> get copyWith =>
      _$QvstAnalysisEntityCopyWithImpl<QvstAnalysisEntity>(
          this as QvstAnalysisEntity, _$identity);

  /// Serializes this QvstAnalysisEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QvstAnalysisEntity &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.campaignStatus, campaignStatus) ||
                other.campaignStatus == campaignStatus) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other.themes, themes) &&
            (identical(other.globalStats, globalStats) ||
                other.globalStats == globalStats) &&
            const DeepCollectionEquality()
                .equals(other.globalDistribution, globalDistribution) &&
            const DeepCollectionEquality()
                .equals(other.themesAnalysis, themesAnalysis) &&
            const DeepCollectionEquality()
                .equals(other.questionsAnalysis, questionsAnalysis) &&
            const DeepCollectionEquality().equals(
                other.questionsRequiringAction, questionsRequiringAction) &&
            const DeepCollectionEquality()
                .equals(other.atRiskEmployees, atRiskEmployees));
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
      const DeepCollectionEquality().hash(themes),
      globalStats,
      const DeepCollectionEquality().hash(globalDistribution),
      const DeepCollectionEquality().hash(themesAnalysis),
      const DeepCollectionEquality().hash(questionsAnalysis),
      const DeepCollectionEquality().hash(questionsRequiringAction),
      const DeepCollectionEquality().hash(atRiskEmployees));

  @override
  String toString() {
    return 'QvstAnalysisEntity(campaignId: $campaignId, campaignName: $campaignName, campaignStatus: $campaignStatus, startDate: $startDate, endDate: $endDate, themes: $themes, globalStats: $globalStats, globalDistribution: $globalDistribution, themesAnalysis: $themesAnalysis, questionsAnalysis: $questionsAnalysis, questionsRequiringAction: $questionsRequiringAction, atRiskEmployees: $atRiskEmployees)';
  }
}

/// @nodoc
abstract mixin class $QvstAnalysisEntityCopyWith<$Res> {
  factory $QvstAnalysisEntityCopyWith(
          QvstAnalysisEntity value, $Res Function(QvstAnalysisEntity) _then) =
      _$QvstAnalysisEntityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'campaign_id') int? campaignId,
      @JsonKey(name: 'campaign_name', defaultValue: '') String campaignName,
      @JsonKey(name: 'campaign_status', defaultValue: '') String campaignStatus,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
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
class _$QvstAnalysisEntityCopyWithImpl<$Res>
    implements $QvstAnalysisEntityCopyWith<$Res> {
  _$QvstAnalysisEntityCopyWithImpl(this._self, this._then);

  final QvstAnalysisEntity _self;
  final $Res Function(QvstAnalysisEntity) _then;

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = freezed,
    Object? campaignName = null,
    Object? campaignStatus = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? themes = null,
    Object? globalStats = freezed,
    Object? globalDistribution = freezed,
    Object? themesAnalysis = freezed,
    Object? questionsAnalysis = null,
    Object? questionsRequiringAction = null,
    Object? atRiskEmployees = null,
  }) {
    return _then(_self.copyWith(
      campaignId: freezed == campaignId
          ? _self.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int?,
      campaignName: null == campaignName
          ? _self.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String,
      campaignStatus: null == campaignStatus
          ? _self.campaignStatus
          : campaignStatus // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      themes: null == themes
          ? _self.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<QvstThemeEntity>,
      globalStats: freezed == globalStats
          ? _self.globalStats
          : globalStats // ignore: cast_nullable_to_non_nullable
              as GlobalStatsEntity?,
      globalDistribution: freezed == globalDistribution
          ? _self.globalDistribution
          : globalDistribution // ignore: cast_nullable_to_non_nullable
              as List<GlobalDistributionEntity>?,
      themesAnalysis: freezed == themesAnalysis
          ? _self.themesAnalysis
          : themesAnalysis // ignore: cast_nullable_to_non_nullable
              as List<ThemeAnalysisEntity>?,
      questionsAnalysis: null == questionsAnalysis
          ? _self.questionsAnalysis
          : questionsAnalysis // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnalysisEntity>,
      questionsRequiringAction: null == questionsRequiringAction
          ? _self.questionsRequiringAction
          : questionsRequiringAction // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnalysisEntity>,
      atRiskEmployees: null == atRiskEmployees
          ? _self.atRiskEmployees
          : atRiskEmployees // ignore: cast_nullable_to_non_nullable
              as List<AtRiskEmployeeEntity>,
    ));
  }

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalStatsEntityCopyWith<$Res>? get globalStats {
    if (_self.globalStats == null) {
      return null;
    }

    return $GlobalStatsEntityCopyWith<$Res>(_self.globalStats!, (value) {
      return _then(_self.copyWith(globalStats: value));
    });
  }
}

/// Adds pattern-matching-related methods to [QvstAnalysisEntity].
extension QvstAnalysisEntityPatterns on QvstAnalysisEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QvstAnalysisEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstAnalysisEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QvstAnalysisEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnalysisEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_QvstAnalysisEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnalysisEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'campaign_id') int? campaignId,
            @JsonKey(name: 'campaign_name', defaultValue: '')
            String campaignName,
            @JsonKey(name: 'campaign_status', defaultValue: '')
            String campaignStatus,
            @JsonKey(name: 'start_date') DateTime? startDate,
            @JsonKey(name: 'end_date') DateTime? endDate,
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
            List<AtRiskEmployeeEntity> atRiskEmployees)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QvstAnalysisEntity() when $default != null:
        return $default(
            _that.campaignId,
            _that.campaignName,
            _that.campaignStatus,
            _that.startDate,
            _that.endDate,
            _that.themes,
            _that.globalStats,
            _that.globalDistribution,
            _that.themesAnalysis,
            _that.questionsAnalysis,
            _that.questionsRequiringAction,
            _that.atRiskEmployees);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'campaign_id') int? campaignId,
            @JsonKey(name: 'campaign_name', defaultValue: '')
            String campaignName,
            @JsonKey(name: 'campaign_status', defaultValue: '')
            String campaignStatus,
            @JsonKey(name: 'start_date') DateTime? startDate,
            @JsonKey(name: 'end_date') DateTime? endDate,
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
            List<AtRiskEmployeeEntity> atRiskEmployees)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnalysisEntity():
        return $default(
            _that.campaignId,
            _that.campaignName,
            _that.campaignStatus,
            _that.startDate,
            _that.endDate,
            _that.themes,
            _that.globalStats,
            _that.globalDistribution,
            _that.themesAnalysis,
            _that.questionsAnalysis,
            _that.questionsRequiringAction,
            _that.atRiskEmployees);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'campaign_id') int? campaignId,
            @JsonKey(name: 'campaign_name', defaultValue: '')
            String campaignName,
            @JsonKey(name: 'campaign_status', defaultValue: '')
            String campaignStatus,
            @JsonKey(name: 'start_date') DateTime? startDate,
            @JsonKey(name: 'end_date') DateTime? endDate,
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
            List<AtRiskEmployeeEntity> atRiskEmployees)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QvstAnalysisEntity() when $default != null:
        return $default(
            _that.campaignId,
            _that.campaignName,
            _that.campaignStatus,
            _that.startDate,
            _that.endDate,
            _that.themes,
            _that.globalStats,
            _that.globalDistribution,
            _that.themesAnalysis,
            _that.questionsAnalysis,
            _that.questionsRequiringAction,
            _that.atRiskEmployees);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QvstAnalysisEntity implements QvstAnalysisEntity {
  const _QvstAnalysisEntity(
      {@JsonKey(name: 'campaign_id') this.campaignId,
      @JsonKey(name: 'campaign_name', defaultValue: '') this.campaignName = '',
      @JsonKey(name: 'campaign_status', defaultValue: '')
      this.campaignStatus = '',
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
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
  factory _QvstAnalysisEntity.fromJson(Map<String, dynamic> json) =>
      _$QvstAnalysisEntityFromJson(json);

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
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
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

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QvstAnalysisEntityCopyWith<_QvstAnalysisEntity> get copyWith =>
      __$QvstAnalysisEntityCopyWithImpl<_QvstAnalysisEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QvstAnalysisEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QvstAnalysisEntity &&
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

  @override
  String toString() {
    return 'QvstAnalysisEntity(campaignId: $campaignId, campaignName: $campaignName, campaignStatus: $campaignStatus, startDate: $startDate, endDate: $endDate, themes: $themes, globalStats: $globalStats, globalDistribution: $globalDistribution, themesAnalysis: $themesAnalysis, questionsAnalysis: $questionsAnalysis, questionsRequiringAction: $questionsRequiringAction, atRiskEmployees: $atRiskEmployees)';
  }
}

/// @nodoc
abstract mixin class _$QvstAnalysisEntityCopyWith<$Res>
    implements $QvstAnalysisEntityCopyWith<$Res> {
  factory _$QvstAnalysisEntityCopyWith(
          _QvstAnalysisEntity value, $Res Function(_QvstAnalysisEntity) _then) =
      __$QvstAnalysisEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'campaign_id') int? campaignId,
      @JsonKey(name: 'campaign_name', defaultValue: '') String campaignName,
      @JsonKey(name: 'campaign_status', defaultValue: '') String campaignStatus,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
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
class __$QvstAnalysisEntityCopyWithImpl<$Res>
    implements _$QvstAnalysisEntityCopyWith<$Res> {
  __$QvstAnalysisEntityCopyWithImpl(this._self, this._then);

  final _QvstAnalysisEntity _self;
  final $Res Function(_QvstAnalysisEntity) _then;

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? campaignId = freezed,
    Object? campaignName = null,
    Object? campaignStatus = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? themes = null,
    Object? globalStats = freezed,
    Object? globalDistribution = freezed,
    Object? themesAnalysis = freezed,
    Object? questionsAnalysis = null,
    Object? questionsRequiringAction = null,
    Object? atRiskEmployees = null,
  }) {
    return _then(_QvstAnalysisEntity(
      campaignId: freezed == campaignId
          ? _self.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as int?,
      campaignName: null == campaignName
          ? _self.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String,
      campaignStatus: null == campaignStatus
          ? _self.campaignStatus
          : campaignStatus // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      themes: null == themes
          ? _self._themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<QvstThemeEntity>,
      globalStats: freezed == globalStats
          ? _self.globalStats
          : globalStats // ignore: cast_nullable_to_non_nullable
              as GlobalStatsEntity?,
      globalDistribution: freezed == globalDistribution
          ? _self._globalDistribution
          : globalDistribution // ignore: cast_nullable_to_non_nullable
              as List<GlobalDistributionEntity>?,
      themesAnalysis: freezed == themesAnalysis
          ? _self._themesAnalysis
          : themesAnalysis // ignore: cast_nullable_to_non_nullable
              as List<ThemeAnalysisEntity>?,
      questionsAnalysis: null == questionsAnalysis
          ? _self._questionsAnalysis
          : questionsAnalysis // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnalysisEntity>,
      questionsRequiringAction: null == questionsRequiringAction
          ? _self._questionsRequiringAction
          : questionsRequiringAction // ignore: cast_nullable_to_non_nullable
              as List<QuestionAnalysisEntity>,
      atRiskEmployees: null == atRiskEmployees
          ? _self._atRiskEmployees
          : atRiskEmployees // ignore: cast_nullable_to_non_nullable
              as List<AtRiskEmployeeEntity>,
    ));
  }

  /// Create a copy of QvstAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalStatsEntityCopyWith<$Res>? get globalStats {
    if (_self.globalStats == null) {
      return null;
    }

    return $GlobalStatsEntityCopyWith<$Res>(_self.globalStats!, (value) {
      return _then(_self.copyWith(globalStats: value));
    });
  }
}

/// @nodoc
mixin _$GlobalStatsEntity {
  @JsonKey(name: 'total_respondents')
  int? get totalRespondents;
  @JsonKey(name: 'total_questions')
  int? get totalQuestions;
  @JsonKey(name: 'average_satisfaction')
  double? get averageSatisfaction;
  @JsonKey(name: 'requires_action')
  bool? get requiresAction;
  @JsonKey(name: 'at_risk_count')
  int? get atRiskCount;

  /// Create a copy of GlobalStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GlobalStatsEntityCopyWith<GlobalStatsEntity> get copyWith =>
      _$GlobalStatsEntityCopyWithImpl<GlobalStatsEntity>(
          this as GlobalStatsEntity, _$identity);

  /// Serializes this GlobalStatsEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GlobalStatsEntity &&
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

  @override
  String toString() {
    return 'GlobalStatsEntity(totalRespondents: $totalRespondents, totalQuestions: $totalQuestions, averageSatisfaction: $averageSatisfaction, requiresAction: $requiresAction, atRiskCount: $atRiskCount)';
  }
}

/// @nodoc
abstract mixin class $GlobalStatsEntityCopyWith<$Res> {
  factory $GlobalStatsEntityCopyWith(
          GlobalStatsEntity value, $Res Function(GlobalStatsEntity) _then) =
      _$GlobalStatsEntityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_respondents') int? totalRespondents,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'average_satisfaction') double? averageSatisfaction,
      @JsonKey(name: 'requires_action') bool? requiresAction,
      @JsonKey(name: 'at_risk_count') int? atRiskCount});
}

/// @nodoc
class _$GlobalStatsEntityCopyWithImpl<$Res>
    implements $GlobalStatsEntityCopyWith<$Res> {
  _$GlobalStatsEntityCopyWithImpl(this._self, this._then);

  final GlobalStatsEntity _self;
  final $Res Function(GlobalStatsEntity) _then;

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
    return _then(_self.copyWith(
      totalRespondents: freezed == totalRespondents
          ? _self.totalRespondents
          : totalRespondents // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      averageSatisfaction: freezed == averageSatisfaction
          ? _self.averageSatisfaction
          : averageSatisfaction // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _self.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      atRiskCount: freezed == atRiskCount
          ? _self.atRiskCount
          : atRiskCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GlobalStatsEntity].
extension GlobalStatsEntityPatterns on GlobalStatsEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GlobalStatsEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GlobalStatsEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GlobalStatsEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GlobalStatsEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GlobalStatsEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GlobalStatsEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'total_respondents') int? totalRespondents,
            @JsonKey(name: 'total_questions') int? totalQuestions,
            @JsonKey(name: 'average_satisfaction') double? averageSatisfaction,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'at_risk_count') int? atRiskCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GlobalStatsEntity() when $default != null:
        return $default(_that.totalRespondents, _that.totalQuestions,
            _that.averageSatisfaction, _that.requiresAction, _that.atRiskCount);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'total_respondents') int? totalRespondents,
            @JsonKey(name: 'total_questions') int? totalQuestions,
            @JsonKey(name: 'average_satisfaction') double? averageSatisfaction,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'at_risk_count') int? atRiskCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GlobalStatsEntity():
        return $default(_that.totalRespondents, _that.totalQuestions,
            _that.averageSatisfaction, _that.requiresAction, _that.atRiskCount);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'total_respondents') int? totalRespondents,
            @JsonKey(name: 'total_questions') int? totalQuestions,
            @JsonKey(name: 'average_satisfaction') double? averageSatisfaction,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'at_risk_count') int? atRiskCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GlobalStatsEntity() when $default != null:
        return $default(_that.totalRespondents, _that.totalQuestions,
            _that.averageSatisfaction, _that.requiresAction, _that.atRiskCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GlobalStatsEntity implements GlobalStatsEntity {
  const _GlobalStatsEntity(
      {@JsonKey(name: 'total_respondents') this.totalRespondents,
      @JsonKey(name: 'total_questions') this.totalQuestions,
      @JsonKey(name: 'average_satisfaction') this.averageSatisfaction,
      @JsonKey(name: 'requires_action') this.requiresAction,
      @JsonKey(name: 'at_risk_count') this.atRiskCount});
  factory _GlobalStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$GlobalStatsEntityFromJson(json);

  @override
  @JsonKey(name: 'total_respondents')
  final int? totalRespondents;
  @override
  @JsonKey(name: 'total_questions')
  final int? totalQuestions;
  @override
  @JsonKey(name: 'average_satisfaction')
  final double? averageSatisfaction;
  @override
  @JsonKey(name: 'requires_action')
  final bool? requiresAction;
  @override
  @JsonKey(name: 'at_risk_count')
  final int? atRiskCount;

  /// Create a copy of GlobalStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GlobalStatsEntityCopyWith<_GlobalStatsEntity> get copyWith =>
      __$GlobalStatsEntityCopyWithImpl<_GlobalStatsEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GlobalStatsEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GlobalStatsEntity &&
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

  @override
  String toString() {
    return 'GlobalStatsEntity(totalRespondents: $totalRespondents, totalQuestions: $totalQuestions, averageSatisfaction: $averageSatisfaction, requiresAction: $requiresAction, atRiskCount: $atRiskCount)';
  }
}

/// @nodoc
abstract mixin class _$GlobalStatsEntityCopyWith<$Res>
    implements $GlobalStatsEntityCopyWith<$Res> {
  factory _$GlobalStatsEntityCopyWith(
          _GlobalStatsEntity value, $Res Function(_GlobalStatsEntity) _then) =
      __$GlobalStatsEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_respondents') int? totalRespondents,
      @JsonKey(name: 'total_questions') int? totalQuestions,
      @JsonKey(name: 'average_satisfaction') double? averageSatisfaction,
      @JsonKey(name: 'requires_action') bool? requiresAction,
      @JsonKey(name: 'at_risk_count') int? atRiskCount});
}

/// @nodoc
class __$GlobalStatsEntityCopyWithImpl<$Res>
    implements _$GlobalStatsEntityCopyWith<$Res> {
  __$GlobalStatsEntityCopyWithImpl(this._self, this._then);

  final _GlobalStatsEntity _self;
  final $Res Function(_GlobalStatsEntity) _then;

  /// Create a copy of GlobalStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalRespondents = freezed,
    Object? totalQuestions = freezed,
    Object? averageSatisfaction = freezed,
    Object? requiresAction = freezed,
    Object? atRiskCount = freezed,
  }) {
    return _then(_GlobalStatsEntity(
      totalRespondents: freezed == totalRespondents
          ? _self.totalRespondents
          : totalRespondents // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
      averageSatisfaction: freezed == averageSatisfaction
          ? _self.averageSatisfaction
          : averageSatisfaction // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _self.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      atRiskCount: freezed == atRiskCount
          ? _self.atRiskCount
          : atRiskCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$GlobalDistributionEntity {
  int? get score;
  int? get count;

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GlobalDistributionEntityCopyWith<GlobalDistributionEntity> get copyWith =>
      _$GlobalDistributionEntityCopyWithImpl<GlobalDistributionEntity>(
          this as GlobalDistributionEntity, _$identity);

  /// Serializes this GlobalDistributionEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GlobalDistributionEntity &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, score, count);

  @override
  String toString() {
    return 'GlobalDistributionEntity(score: $score, count: $count)';
  }
}

/// @nodoc
abstract mixin class $GlobalDistributionEntityCopyWith<$Res> {
  factory $GlobalDistributionEntityCopyWith(GlobalDistributionEntity value,
          $Res Function(GlobalDistributionEntity) _then) =
      _$GlobalDistributionEntityCopyWithImpl;
  @useResult
  $Res call({int? score, int? count});
}

/// @nodoc
class _$GlobalDistributionEntityCopyWithImpl<$Res>
    implements $GlobalDistributionEntityCopyWith<$Res> {
  _$GlobalDistributionEntityCopyWithImpl(this._self, this._then);

  final GlobalDistributionEntity _self;
  final $Res Function(GlobalDistributionEntity) _then;

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = freezed,
    Object? count = freezed,
  }) {
    return _then(_self.copyWith(
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [GlobalDistributionEntity].
extension GlobalDistributionEntityPatterns on GlobalDistributionEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GlobalDistributionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GlobalDistributionEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GlobalDistributionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GlobalDistributionEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_GlobalDistributionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GlobalDistributionEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? score, int? count)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GlobalDistributionEntity() when $default != null:
        return $default(_that.score, _that.count);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? score, int? count) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GlobalDistributionEntity():
        return $default(_that.score, _that.count);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int? score, int? count)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GlobalDistributionEntity() when $default != null:
        return $default(_that.score, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GlobalDistributionEntity implements GlobalDistributionEntity {
  const _GlobalDistributionEntity({this.score, this.count});
  factory _GlobalDistributionEntity.fromJson(Map<String, dynamic> json) =>
      _$GlobalDistributionEntityFromJson(json);

  @override
  final int? score;
  @override
  final int? count;

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GlobalDistributionEntityCopyWith<_GlobalDistributionEntity> get copyWith =>
      __$GlobalDistributionEntityCopyWithImpl<_GlobalDistributionEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GlobalDistributionEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GlobalDistributionEntity &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, score, count);

  @override
  String toString() {
    return 'GlobalDistributionEntity(score: $score, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$GlobalDistributionEntityCopyWith<$Res>
    implements $GlobalDistributionEntityCopyWith<$Res> {
  factory _$GlobalDistributionEntityCopyWith(_GlobalDistributionEntity value,
          $Res Function(_GlobalDistributionEntity) _then) =
      __$GlobalDistributionEntityCopyWithImpl;
  @override
  @useResult
  $Res call({int? score, int? count});
}

/// @nodoc
class __$GlobalDistributionEntityCopyWithImpl<$Res>
    implements _$GlobalDistributionEntityCopyWith<$Res> {
  __$GlobalDistributionEntityCopyWithImpl(this._self, this._then);

  final _GlobalDistributionEntity _self;
  final $Res Function(_GlobalDistributionEntity) _then;

  /// Create a copy of GlobalDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? score = freezed,
    Object? count = freezed,
  }) {
    return _then(_GlobalDistributionEntity(
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$ThemeAnalysisEntity {
  @JsonKey(name: 'theme_id', defaultValue: '')
  String get themeId;
  @JsonKey(name: 'theme_name', defaultValue: '')
  String get themeName;
  @JsonKey(name: 'average_score')
  double? get averageScore;
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage;
  @JsonKey(name: 'requires_action')
  bool? get requiresAction;
  @JsonKey(name: 'low_score_questions_count')
  int? get lowScoreQuestionsCount;
  @JsonKey(name: 'total_questions')
  int? get totalQuestions;

  /// Create a copy of ThemeAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThemeAnalysisEntityCopyWith<ThemeAnalysisEntity> get copyWith =>
      _$ThemeAnalysisEntityCopyWithImpl<ThemeAnalysisEntity>(
          this as ThemeAnalysisEntity, _$identity);

  /// Serializes this ThemeAnalysisEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ThemeAnalysisEntity &&
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

  @override
  String toString() {
    return 'ThemeAnalysisEntity(themeId: $themeId, themeName: $themeName, averageScore: $averageScore, satisfactionPercentage: $satisfactionPercentage, requiresAction: $requiresAction, lowScoreQuestionsCount: $lowScoreQuestionsCount, totalQuestions: $totalQuestions)';
  }
}

/// @nodoc
abstract mixin class $ThemeAnalysisEntityCopyWith<$Res> {
  factory $ThemeAnalysisEntityCopyWith(
          ThemeAnalysisEntity value, $Res Function(ThemeAnalysisEntity) _then) =
      _$ThemeAnalysisEntityCopyWithImpl;
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
class _$ThemeAnalysisEntityCopyWithImpl<$Res>
    implements $ThemeAnalysisEntityCopyWith<$Res> {
  _$ThemeAnalysisEntityCopyWithImpl(this._self, this._then);

  final ThemeAnalysisEntity _self;
  final $Res Function(ThemeAnalysisEntity) _then;

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
    return _then(_self.copyWith(
      themeId: null == themeId
          ? _self.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      themeName: null == themeName
          ? _self.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
      averageScore: freezed == averageScore
          ? _self.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _self.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _self.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      lowScoreQuestionsCount: freezed == lowScoreQuestionsCount
          ? _self.lowScoreQuestionsCount
          : lowScoreQuestionsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ThemeAnalysisEntity].
extension ThemeAnalysisEntityPatterns on ThemeAnalysisEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeAnalysisEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ThemeAnalysisEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeAnalysisEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThemeAnalysisEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeAnalysisEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThemeAnalysisEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'theme_id', defaultValue: '') String themeId,
            @JsonKey(name: 'theme_name', defaultValue: '') String themeName,
            @JsonKey(name: 'average_score') double? averageScore,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'low_score_questions_count')
            int? lowScoreQuestionsCount,
            @JsonKey(name: 'total_questions') int? totalQuestions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ThemeAnalysisEntity() when $default != null:
        return $default(
            _that.themeId,
            _that.themeName,
            _that.averageScore,
            _that.satisfactionPercentage,
            _that.requiresAction,
            _that.lowScoreQuestionsCount,
            _that.totalQuestions);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'theme_id', defaultValue: '') String themeId,
            @JsonKey(name: 'theme_name', defaultValue: '') String themeName,
            @JsonKey(name: 'average_score') double? averageScore,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'low_score_questions_count')
            int? lowScoreQuestionsCount,
            @JsonKey(name: 'total_questions') int? totalQuestions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThemeAnalysisEntity():
        return $default(
            _that.themeId,
            _that.themeName,
            _that.averageScore,
            _that.satisfactionPercentage,
            _that.requiresAction,
            _that.lowScoreQuestionsCount,
            _that.totalQuestions);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'theme_id', defaultValue: '') String themeId,
            @JsonKey(name: 'theme_name', defaultValue: '') String themeName,
            @JsonKey(name: 'average_score') double? averageScore,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'low_score_questions_count')
            int? lowScoreQuestionsCount,
            @JsonKey(name: 'total_questions') int? totalQuestions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ThemeAnalysisEntity() when $default != null:
        return $default(
            _that.themeId,
            _that.themeName,
            _that.averageScore,
            _that.satisfactionPercentage,
            _that.requiresAction,
            _that.lowScoreQuestionsCount,
            _that.totalQuestions);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ThemeAnalysisEntity implements ThemeAnalysisEntity {
  const _ThemeAnalysisEntity(
      {@JsonKey(name: 'theme_id', defaultValue: '') this.themeId = '',
      @JsonKey(name: 'theme_name', defaultValue: '') this.themeName = '',
      @JsonKey(name: 'average_score') this.averageScore,
      @JsonKey(name: 'satisfaction_percentage') this.satisfactionPercentage,
      @JsonKey(name: 'requires_action') this.requiresAction,
      @JsonKey(name: 'low_score_questions_count') this.lowScoreQuestionsCount,
      @JsonKey(name: 'total_questions') this.totalQuestions});
  factory _ThemeAnalysisEntity.fromJson(Map<String, dynamic> json) =>
      _$ThemeAnalysisEntityFromJson(json);

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

  /// Create a copy of ThemeAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ThemeAnalysisEntityCopyWith<_ThemeAnalysisEntity> get copyWith =>
      __$ThemeAnalysisEntityCopyWithImpl<_ThemeAnalysisEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ThemeAnalysisEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeAnalysisEntity &&
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

  @override
  String toString() {
    return 'ThemeAnalysisEntity(themeId: $themeId, themeName: $themeName, averageScore: $averageScore, satisfactionPercentage: $satisfactionPercentage, requiresAction: $requiresAction, lowScoreQuestionsCount: $lowScoreQuestionsCount, totalQuestions: $totalQuestions)';
  }
}

/// @nodoc
abstract mixin class _$ThemeAnalysisEntityCopyWith<$Res>
    implements $ThemeAnalysisEntityCopyWith<$Res> {
  factory _$ThemeAnalysisEntityCopyWith(_ThemeAnalysisEntity value,
          $Res Function(_ThemeAnalysisEntity) _then) =
      __$ThemeAnalysisEntityCopyWithImpl;
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
class __$ThemeAnalysisEntityCopyWithImpl<$Res>
    implements _$ThemeAnalysisEntityCopyWith<$Res> {
  __$ThemeAnalysisEntityCopyWithImpl(this._self, this._then);

  final _ThemeAnalysisEntity _self;
  final $Res Function(_ThemeAnalysisEntity) _then;

  /// Create a copy of ThemeAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? themeId = null,
    Object? themeName = null,
    Object? averageScore = freezed,
    Object? satisfactionPercentage = freezed,
    Object? requiresAction = freezed,
    Object? lowScoreQuestionsCount = freezed,
    Object? totalQuestions = freezed,
  }) {
    return _then(_ThemeAnalysisEntity(
      themeId: null == themeId
          ? _self.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String,
      themeName: null == themeName
          ? _self.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String,
      averageScore: freezed == averageScore
          ? _self.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _self.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _self.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      lowScoreQuestionsCount: freezed == lowScoreQuestionsCount
          ? _self.lowScoreQuestionsCount
          : lowScoreQuestionsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalQuestions: freezed == totalQuestions
          ? _self.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$QuestionAnalysisEntity {
  @JsonKey(name: 'question_id', defaultValue: '')
  String get questionId;
  @JsonKey(name: 'question_text', defaultValue: '')
  String get questionText;
  @JsonKey(name: 'theme_id')
  String? get themeId;
  @JsonKey(name: 'theme_name')
  String? get themeName;
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage;
  @JsonKey(name: 'average_score')
  double? get averageScore;
  @JsonKey(name: 'requires_action')
  bool? get requiresAction;
  @JsonKey(name: 'total_responses')
  int? get totalResponses;
  @JsonKey(name: 'answers')
  List<AnswerDistributionEntity> get answers;

  /// Create a copy of QuestionAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionAnalysisEntityCopyWith<QuestionAnalysisEntity> get copyWith =>
      _$QuestionAnalysisEntityCopyWithImpl<QuestionAnalysisEntity>(
          this as QuestionAnalysisEntity, _$identity);

  /// Serializes this QuestionAnalysisEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestionAnalysisEntity &&
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
            const DeepCollectionEquality().equals(other.answers, answers));
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
      const DeepCollectionEquality().hash(answers));

  @override
  String toString() {
    return 'QuestionAnalysisEntity(questionId: $questionId, questionText: $questionText, themeId: $themeId, themeName: $themeName, satisfactionPercentage: $satisfactionPercentage, averageScore: $averageScore, requiresAction: $requiresAction, totalResponses: $totalResponses, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class $QuestionAnalysisEntityCopyWith<$Res> {
  factory $QuestionAnalysisEntityCopyWith(QuestionAnalysisEntity value,
          $Res Function(QuestionAnalysisEntity) _then) =
      _$QuestionAnalysisEntityCopyWithImpl;
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
class _$QuestionAnalysisEntityCopyWithImpl<$Res>
    implements $QuestionAnalysisEntityCopyWith<$Res> {
  _$QuestionAnalysisEntityCopyWithImpl(this._self, this._then);

  final QuestionAnalysisEntity _self;
  final $Res Function(QuestionAnalysisEntity) _then;

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
    return _then(_self.copyWith(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _self.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: freezed == themeId
          ? _self.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String?,
      themeName: freezed == themeName
          ? _self.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String?,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _self.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      averageScore: freezed == averageScore
          ? _self.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _self.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalResponses: freezed == totalResponses
          ? _self.totalResponses
          : totalResponses // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: null == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerDistributionEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [QuestionAnalysisEntity].
extension QuestionAnalysisEntityPatterns on QuestionAnalysisEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_QuestionAnalysisEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuestionAnalysisEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_QuestionAnalysisEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuestionAnalysisEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_QuestionAnalysisEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuestionAnalysisEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'question_id', defaultValue: '') String questionId,
            @JsonKey(name: 'question_text', defaultValue: '')
            String questionText,
            @JsonKey(name: 'theme_id') String? themeId,
            @JsonKey(name: 'theme_name') String? themeName,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'average_score') double? averageScore,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'total_responses') int? totalResponses,
            @JsonKey(name: 'answers') List<AnswerDistributionEntity> answers)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QuestionAnalysisEntity() when $default != null:
        return $default(
            _that.questionId,
            _that.questionText,
            _that.themeId,
            _that.themeName,
            _that.satisfactionPercentage,
            _that.averageScore,
            _that.requiresAction,
            _that.totalResponses,
            _that.answers);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'question_id', defaultValue: '') String questionId,
            @JsonKey(name: 'question_text', defaultValue: '')
            String questionText,
            @JsonKey(name: 'theme_id') String? themeId,
            @JsonKey(name: 'theme_name') String? themeName,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'average_score') double? averageScore,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'total_responses') int? totalResponses,
            @JsonKey(name: 'answers') List<AnswerDistributionEntity> answers)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuestionAnalysisEntity():
        return $default(
            _that.questionId,
            _that.questionText,
            _that.themeId,
            _that.themeName,
            _that.satisfactionPercentage,
            _that.averageScore,
            _that.requiresAction,
            _that.totalResponses,
            _that.answers);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'question_id', defaultValue: '') String questionId,
            @JsonKey(name: 'question_text', defaultValue: '')
            String questionText,
            @JsonKey(name: 'theme_id') String? themeId,
            @JsonKey(name: 'theme_name') String? themeName,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'average_score') double? averageScore,
            @JsonKey(name: 'requires_action') bool? requiresAction,
            @JsonKey(name: 'total_responses') int? totalResponses,
            @JsonKey(name: 'answers') List<AnswerDistributionEntity> answers)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QuestionAnalysisEntity() when $default != null:
        return $default(
            _that.questionId,
            _that.questionText,
            _that.themeId,
            _that.themeName,
            _that.satisfactionPercentage,
            _that.averageScore,
            _that.requiresAction,
            _that.totalResponses,
            _that.answers);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QuestionAnalysisEntity implements QuestionAnalysisEntity {
  const _QuestionAnalysisEntity(
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
  factory _QuestionAnalysisEntity.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnalysisEntityFromJson(json);

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

  /// Create a copy of QuestionAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionAnalysisEntityCopyWith<_QuestionAnalysisEntity> get copyWith =>
      __$QuestionAnalysisEntityCopyWithImpl<_QuestionAnalysisEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestionAnalysisEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionAnalysisEntity &&
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

  @override
  String toString() {
    return 'QuestionAnalysisEntity(questionId: $questionId, questionText: $questionText, themeId: $themeId, themeName: $themeName, satisfactionPercentage: $satisfactionPercentage, averageScore: $averageScore, requiresAction: $requiresAction, totalResponses: $totalResponses, answers: $answers)';
  }
}

/// @nodoc
abstract mixin class _$QuestionAnalysisEntityCopyWith<$Res>
    implements $QuestionAnalysisEntityCopyWith<$Res> {
  factory _$QuestionAnalysisEntityCopyWith(_QuestionAnalysisEntity value,
          $Res Function(_QuestionAnalysisEntity) _then) =
      __$QuestionAnalysisEntityCopyWithImpl;
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
class __$QuestionAnalysisEntityCopyWithImpl<$Res>
    implements _$QuestionAnalysisEntityCopyWith<$Res> {
  __$QuestionAnalysisEntityCopyWithImpl(this._self, this._then);

  final _QuestionAnalysisEntity _self;
  final $Res Function(_QuestionAnalysisEntity) _then;

  /// Create a copy of QuestionAnalysisEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_QuestionAnalysisEntity(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _self.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      themeId: freezed == themeId
          ? _self.themeId
          : themeId // ignore: cast_nullable_to_non_nullable
              as String?,
      themeName: freezed == themeName
          ? _self.themeName
          : themeName // ignore: cast_nullable_to_non_nullable
              as String?,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _self.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      averageScore: freezed == averageScore
          ? _self.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      requiresAction: freezed == requiresAction
          ? _self.requiresAction
          : requiresAction // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalResponses: freezed == totalResponses
          ? _self.totalResponses
          : totalResponses // ignore: cast_nullable_to_non_nullable
              as int?,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<AnswerDistributionEntity>,
    ));
  }
}

/// @nodoc
mixin _$AnswerDistributionEntity {
  @JsonKey(name: 'id', defaultValue: '')
  String get answerId;
  @JsonKey(name: 'answer', defaultValue: '')
  String get answerText;
  @JsonKey(name: 'value')
  String? get score;
  @JsonKey(name: 'numberAnswered')
  int? get count;

  /// Create a copy of AnswerDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnswerDistributionEntityCopyWith<AnswerDistributionEntity> get copyWith =>
      _$AnswerDistributionEntityCopyWithImpl<AnswerDistributionEntity>(
          this as AnswerDistributionEntity, _$identity);

  /// Serializes this AnswerDistributionEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AnswerDistributionEntity &&
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

  @override
  String toString() {
    return 'AnswerDistributionEntity(answerId: $answerId, answerText: $answerText, score: $score, count: $count)';
  }
}

/// @nodoc
abstract mixin class $AnswerDistributionEntityCopyWith<$Res> {
  factory $AnswerDistributionEntityCopyWith(AnswerDistributionEntity value,
          $Res Function(AnswerDistributionEntity) _then) =
      _$AnswerDistributionEntityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String answerId,
      @JsonKey(name: 'answer', defaultValue: '') String answerText,
      @JsonKey(name: 'value') String? score,
      @JsonKey(name: 'numberAnswered') int? count});
}

/// @nodoc
class _$AnswerDistributionEntityCopyWithImpl<$Res>
    implements $AnswerDistributionEntityCopyWith<$Res> {
  _$AnswerDistributionEntityCopyWithImpl(this._self, this._then);

  final AnswerDistributionEntity _self;
  final $Res Function(AnswerDistributionEntity) _then;

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
    return _then(_self.copyWith(
      answerId: null == answerId
          ? _self.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      answerText: null == answerText
          ? _self.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AnswerDistributionEntity].
extension AnswerDistributionEntityPatterns on AnswerDistributionEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AnswerDistributionEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnswerDistributionEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AnswerDistributionEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnswerDistributionEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AnswerDistributionEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnswerDistributionEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'id', defaultValue: '') String answerId,
            @JsonKey(name: 'answer', defaultValue: '') String answerText,
            @JsonKey(name: 'value') String? score,
            @JsonKey(name: 'numberAnswered') int? count)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AnswerDistributionEntity() when $default != null:
        return $default(
            _that.answerId, _that.answerText, _that.score, _that.count);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'id', defaultValue: '') String answerId,
            @JsonKey(name: 'answer', defaultValue: '') String answerText,
            @JsonKey(name: 'value') String? score,
            @JsonKey(name: 'numberAnswered') int? count)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnswerDistributionEntity():
        return $default(
            _that.answerId, _that.answerText, _that.score, _that.count);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'id', defaultValue: '') String answerId,
            @JsonKey(name: 'answer', defaultValue: '') String answerText,
            @JsonKey(name: 'value') String? score,
            @JsonKey(name: 'numberAnswered') int? count)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AnswerDistributionEntity() when $default != null:
        return $default(
            _that.answerId, _that.answerText, _that.score, _that.count);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AnswerDistributionEntity implements AnswerDistributionEntity {
  const _AnswerDistributionEntity(
      {@JsonKey(name: 'id', defaultValue: '') this.answerId = '',
      @JsonKey(name: 'answer', defaultValue: '') this.answerText = '',
      @JsonKey(name: 'value') this.score,
      @JsonKey(name: 'numberAnswered') this.count});
  factory _AnswerDistributionEntity.fromJson(Map<String, dynamic> json) =>
      _$AnswerDistributionEntityFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String answerId;
  @override
  @JsonKey(name: 'answer', defaultValue: '')
  final String answerText;
  @override
  @JsonKey(name: 'value')
  final String? score;
  @override
  @JsonKey(name: 'numberAnswered')
  final int? count;

  /// Create a copy of AnswerDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnswerDistributionEntityCopyWith<_AnswerDistributionEntity> get copyWith =>
      __$AnswerDistributionEntityCopyWithImpl<_AnswerDistributionEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnswerDistributionEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnswerDistributionEntity &&
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

  @override
  String toString() {
    return 'AnswerDistributionEntity(answerId: $answerId, answerText: $answerText, score: $score, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$AnswerDistributionEntityCopyWith<$Res>
    implements $AnswerDistributionEntityCopyWith<$Res> {
  factory _$AnswerDistributionEntityCopyWith(_AnswerDistributionEntity value,
          $Res Function(_AnswerDistributionEntity) _then) =
      __$AnswerDistributionEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String answerId,
      @JsonKey(name: 'answer', defaultValue: '') String answerText,
      @JsonKey(name: 'value') String? score,
      @JsonKey(name: 'numberAnswered') int? count});
}

/// @nodoc
class __$AnswerDistributionEntityCopyWithImpl<$Res>
    implements _$AnswerDistributionEntityCopyWith<$Res> {
  __$AnswerDistributionEntityCopyWithImpl(this._self, this._then);

  final _AnswerDistributionEntity _self;
  final $Res Function(_AnswerDistributionEntity) _then;

  /// Create a copy of AnswerDistributionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? answerId = null,
    Object? answerText = null,
    Object? score = freezed,
    Object? count = freezed,
  }) {
    return _then(_AnswerDistributionEntity(
      answerId: null == answerId
          ? _self.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
      answerText: null == answerText
          ? _self.answerText
          : answerText // ignore: cast_nullable_to_non_nullable
              as String,
      score: freezed == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$AtRiskEmployeeEntity {
  @JsonKey(name: 'anonymous_user_id', defaultValue: '')
  String get anonymousUserId;
  @JsonKey(name: 'satisfaction_percentage')
  double? get satisfactionPercentage;
  @JsonKey(name: 'low_scores_count')
  int? get lowScoresCount;
  @JsonKey(name: 'total_responses')
  int? get totalResponses;
  @JsonKey(name: 'critical_themes')
  List<String>? get criticalThemes;
  @JsonKey(name: 'open_answer')
  String? get openAnswer;

  /// Create a copy of AtRiskEmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AtRiskEmployeeEntityCopyWith<AtRiskEmployeeEntity> get copyWith =>
      _$AtRiskEmployeeEntityCopyWithImpl<AtRiskEmployeeEntity>(
          this as AtRiskEmployeeEntity, _$identity);

  /// Serializes this AtRiskEmployeeEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AtRiskEmployeeEntity &&
            (identical(other.anonymousUserId, anonymousUserId) ||
                other.anonymousUserId == anonymousUserId) &&
            (identical(other.satisfactionPercentage, satisfactionPercentage) ||
                other.satisfactionPercentage == satisfactionPercentage) &&
            (identical(other.lowScoresCount, lowScoresCount) ||
                other.lowScoresCount == lowScoresCount) &&
            (identical(other.totalResponses, totalResponses) ||
                other.totalResponses == totalResponses) &&
            const DeepCollectionEquality()
                .equals(other.criticalThemes, criticalThemes) &&
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
      const DeepCollectionEquality().hash(criticalThemes),
      openAnswer);

  @override
  String toString() {
    return 'AtRiskEmployeeEntity(anonymousUserId: $anonymousUserId, satisfactionPercentage: $satisfactionPercentage, lowScoresCount: $lowScoresCount, totalResponses: $totalResponses, criticalThemes: $criticalThemes, openAnswer: $openAnswer)';
  }
}

/// @nodoc
abstract mixin class $AtRiskEmployeeEntityCopyWith<$Res> {
  factory $AtRiskEmployeeEntityCopyWith(AtRiskEmployeeEntity value,
          $Res Function(AtRiskEmployeeEntity) _then) =
      _$AtRiskEmployeeEntityCopyWithImpl;
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
class _$AtRiskEmployeeEntityCopyWithImpl<$Res>
    implements $AtRiskEmployeeEntityCopyWith<$Res> {
  _$AtRiskEmployeeEntityCopyWithImpl(this._self, this._then);

  final AtRiskEmployeeEntity _self;
  final $Res Function(AtRiskEmployeeEntity) _then;

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
    return _then(_self.copyWith(
      anonymousUserId: null == anonymousUserId
          ? _self.anonymousUserId
          : anonymousUserId // ignore: cast_nullable_to_non_nullable
              as String,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _self.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      lowScoresCount: freezed == lowScoresCount
          ? _self.lowScoresCount
          : lowScoresCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResponses: freezed == totalResponses
          ? _self.totalResponses
          : totalResponses // ignore: cast_nullable_to_non_nullable
              as int?,
      criticalThemes: freezed == criticalThemes
          ? _self.criticalThemes
          : criticalThemes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      openAnswer: freezed == openAnswer
          ? _self.openAnswer
          : openAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AtRiskEmployeeEntity].
extension AtRiskEmployeeEntityPatterns on AtRiskEmployeeEntity {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AtRiskEmployeeEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AtRiskEmployeeEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AtRiskEmployeeEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AtRiskEmployeeEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AtRiskEmployeeEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AtRiskEmployeeEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'anonymous_user_id', defaultValue: '')
            String anonymousUserId,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'low_scores_count') int? lowScoresCount,
            @JsonKey(name: 'total_responses') int? totalResponses,
            @JsonKey(name: 'critical_themes') List<String>? criticalThemes,
            @JsonKey(name: 'open_answer') String? openAnswer)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AtRiskEmployeeEntity() when $default != null:
        return $default(
            _that.anonymousUserId,
            _that.satisfactionPercentage,
            _that.lowScoresCount,
            _that.totalResponses,
            _that.criticalThemes,
            _that.openAnswer);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'anonymous_user_id', defaultValue: '')
            String anonymousUserId,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'low_scores_count') int? lowScoresCount,
            @JsonKey(name: 'total_responses') int? totalResponses,
            @JsonKey(name: 'critical_themes') List<String>? criticalThemes,
            @JsonKey(name: 'open_answer') String? openAnswer)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AtRiskEmployeeEntity():
        return $default(
            _that.anonymousUserId,
            _that.satisfactionPercentage,
            _that.lowScoresCount,
            _that.totalResponses,
            _that.criticalThemes,
            _that.openAnswer);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'anonymous_user_id', defaultValue: '')
            String anonymousUserId,
            @JsonKey(name: 'satisfaction_percentage')
            double? satisfactionPercentage,
            @JsonKey(name: 'low_scores_count') int? lowScoresCount,
            @JsonKey(name: 'total_responses') int? totalResponses,
            @JsonKey(name: 'critical_themes') List<String>? criticalThemes,
            @JsonKey(name: 'open_answer') String? openAnswer)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AtRiskEmployeeEntity() when $default != null:
        return $default(
            _that.anonymousUserId,
            _that.satisfactionPercentage,
            _that.lowScoresCount,
            _that.totalResponses,
            _that.criticalThemes,
            _that.openAnswer);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AtRiskEmployeeEntity implements AtRiskEmployeeEntity {
  const _AtRiskEmployeeEntity(
      {@JsonKey(name: 'anonymous_user_id', defaultValue: '')
      this.anonymousUserId = '',
      @JsonKey(name: 'satisfaction_percentage') this.satisfactionPercentage,
      @JsonKey(name: 'low_scores_count') this.lowScoresCount,
      @JsonKey(name: 'total_responses') this.totalResponses,
      @JsonKey(name: 'critical_themes')
      final List<String>? criticalThemes = const [],
      @JsonKey(name: 'open_answer') this.openAnswer})
      : _criticalThemes = criticalThemes;
  factory _AtRiskEmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$AtRiskEmployeeEntityFromJson(json);

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

  /// Create a copy of AtRiskEmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AtRiskEmployeeEntityCopyWith<_AtRiskEmployeeEntity> get copyWith =>
      __$AtRiskEmployeeEntityCopyWithImpl<_AtRiskEmployeeEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AtRiskEmployeeEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AtRiskEmployeeEntity &&
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

  @override
  String toString() {
    return 'AtRiskEmployeeEntity(anonymousUserId: $anonymousUserId, satisfactionPercentage: $satisfactionPercentage, lowScoresCount: $lowScoresCount, totalResponses: $totalResponses, criticalThemes: $criticalThemes, openAnswer: $openAnswer)';
  }
}

/// @nodoc
abstract mixin class _$AtRiskEmployeeEntityCopyWith<$Res>
    implements $AtRiskEmployeeEntityCopyWith<$Res> {
  factory _$AtRiskEmployeeEntityCopyWith(_AtRiskEmployeeEntity value,
          $Res Function(_AtRiskEmployeeEntity) _then) =
      __$AtRiskEmployeeEntityCopyWithImpl;
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
class __$AtRiskEmployeeEntityCopyWithImpl<$Res>
    implements _$AtRiskEmployeeEntityCopyWith<$Res> {
  __$AtRiskEmployeeEntityCopyWithImpl(this._self, this._then);

  final _AtRiskEmployeeEntity _self;
  final $Res Function(_AtRiskEmployeeEntity) _then;

  /// Create a copy of AtRiskEmployeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? anonymousUserId = null,
    Object? satisfactionPercentage = freezed,
    Object? lowScoresCount = freezed,
    Object? totalResponses = freezed,
    Object? criticalThemes = freezed,
    Object? openAnswer = freezed,
  }) {
    return _then(_AtRiskEmployeeEntity(
      anonymousUserId: null == anonymousUserId
          ? _self.anonymousUserId
          : anonymousUserId // ignore: cast_nullable_to_non_nullable
              as String,
      satisfactionPercentage: freezed == satisfactionPercentage
          ? _self.satisfactionPercentage
          : satisfactionPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      lowScoresCount: freezed == lowScoresCount
          ? _self.lowScoresCount
          : lowScoresCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResponses: freezed == totalResponses
          ? _self.totalResponses
          : totalResponses // ignore: cast_nullable_to_non_nullable
              as int?,
      criticalThemes: freezed == criticalThemes
          ? _self._criticalThemes
          : criticalThemes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      openAnswer: freezed == openAnswer
          ? _self.openAnswer
          : openAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
