// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchIndexStatus _$SearchIndexStatusFromJson(Map<String, dynamic> json) {
  return _SearchIndexStatus.fromJson(json);
}

/// @nodoc
mixin _$SearchIndexStatus {
  String get accountId => throw _privateConstructorUsedError;
  bool get isIndexed => throw _privateConstructorUsedError;
  int get totalMessages => throw _privateConstructorUsedError;
  int get indexedMessages => throw _privateConstructorUsedError;
  DateTime get lastIndexUpdate => throw _privateConstructorUsedError;
  bool get isIndexing => throw _privateConstructorUsedError;
  double? get indexingProgress => throw _privateConstructorUsedError;
  String? get indexingStatus => throw _privateConstructorUsedError;

  /// Serializes this SearchIndexStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchIndexStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchIndexStatusCopyWith<SearchIndexStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchIndexStatusCopyWith<$Res> {
  factory $SearchIndexStatusCopyWith(
          SearchIndexStatus value, $Res Function(SearchIndexStatus) then) =
      _$SearchIndexStatusCopyWithImpl<$Res, SearchIndexStatus>;
  @useResult
  $Res call(
      {String accountId,
      bool isIndexed,
      int totalMessages,
      int indexedMessages,
      DateTime lastIndexUpdate,
      bool isIndexing,
      double? indexingProgress,
      String? indexingStatus});
}

/// @nodoc
class _$SearchIndexStatusCopyWithImpl<$Res, $Val extends SearchIndexStatus>
    implements $SearchIndexStatusCopyWith<$Res> {
  _$SearchIndexStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchIndexStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? isIndexed = null,
    Object? totalMessages = null,
    Object? indexedMessages = null,
    Object? lastIndexUpdate = null,
    Object? isIndexing = null,
    Object? indexingProgress = freezed,
    Object? indexingStatus = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      isIndexed: null == isIndexed
          ? _value.isIndexed
          : isIndexed // ignore: cast_nullable_to_non_nullable
              as bool,
      totalMessages: null == totalMessages
          ? _value.totalMessages
          : totalMessages // ignore: cast_nullable_to_non_nullable
              as int,
      indexedMessages: null == indexedMessages
          ? _value.indexedMessages
          : indexedMessages // ignore: cast_nullable_to_non_nullable
              as int,
      lastIndexUpdate: null == lastIndexUpdate
          ? _value.lastIndexUpdate
          : lastIndexUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isIndexing: null == isIndexing
          ? _value.isIndexing
          : isIndexing // ignore: cast_nullable_to_non_nullable
              as bool,
      indexingProgress: freezed == indexingProgress
          ? _value.indexingProgress
          : indexingProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      indexingStatus: freezed == indexingStatus
          ? _value.indexingStatus
          : indexingStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchIndexStatusImplCopyWith<$Res>
    implements $SearchIndexStatusCopyWith<$Res> {
  factory _$$SearchIndexStatusImplCopyWith(_$SearchIndexStatusImpl value,
          $Res Function(_$SearchIndexStatusImpl) then) =
      __$$SearchIndexStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountId,
      bool isIndexed,
      int totalMessages,
      int indexedMessages,
      DateTime lastIndexUpdate,
      bool isIndexing,
      double? indexingProgress,
      String? indexingStatus});
}

/// @nodoc
class __$$SearchIndexStatusImplCopyWithImpl<$Res>
    extends _$SearchIndexStatusCopyWithImpl<$Res, _$SearchIndexStatusImpl>
    implements _$$SearchIndexStatusImplCopyWith<$Res> {
  __$$SearchIndexStatusImplCopyWithImpl(_$SearchIndexStatusImpl _value,
      $Res Function(_$SearchIndexStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchIndexStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? isIndexed = null,
    Object? totalMessages = null,
    Object? indexedMessages = null,
    Object? lastIndexUpdate = null,
    Object? isIndexing = null,
    Object? indexingProgress = freezed,
    Object? indexingStatus = freezed,
  }) {
    return _then(_$SearchIndexStatusImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      isIndexed: null == isIndexed
          ? _value.isIndexed
          : isIndexed // ignore: cast_nullable_to_non_nullable
              as bool,
      totalMessages: null == totalMessages
          ? _value.totalMessages
          : totalMessages // ignore: cast_nullable_to_non_nullable
              as int,
      indexedMessages: null == indexedMessages
          ? _value.indexedMessages
          : indexedMessages // ignore: cast_nullable_to_non_nullable
              as int,
      lastIndexUpdate: null == lastIndexUpdate
          ? _value.lastIndexUpdate
          : lastIndexUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isIndexing: null == isIndexing
          ? _value.isIndexing
          : isIndexing // ignore: cast_nullable_to_non_nullable
              as bool,
      indexingProgress: freezed == indexingProgress
          ? _value.indexingProgress
          : indexingProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      indexingStatus: freezed == indexingStatus
          ? _value.indexingStatus
          : indexingStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchIndexStatusImpl implements _SearchIndexStatus {
  const _$SearchIndexStatusImpl(
      {required this.accountId,
      required this.isIndexed,
      required this.totalMessages,
      required this.indexedMessages,
      required this.lastIndexUpdate,
      this.isIndexing = false,
      this.indexingProgress,
      this.indexingStatus});

  factory _$SearchIndexStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchIndexStatusImplFromJson(json);

  @override
  final String accountId;
  @override
  final bool isIndexed;
  @override
  final int totalMessages;
  @override
  final int indexedMessages;
  @override
  final DateTime lastIndexUpdate;
  @override
  @JsonKey()
  final bool isIndexing;
  @override
  final double? indexingProgress;
  @override
  final String? indexingStatus;

  @override
  String toString() {
    return 'SearchIndexStatus(accountId: $accountId, isIndexed: $isIndexed, totalMessages: $totalMessages, indexedMessages: $indexedMessages, lastIndexUpdate: $lastIndexUpdate, isIndexing: $isIndexing, indexingProgress: $indexingProgress, indexingStatus: $indexingStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchIndexStatusImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.isIndexed, isIndexed) ||
                other.isIndexed == isIndexed) &&
            (identical(other.totalMessages, totalMessages) ||
                other.totalMessages == totalMessages) &&
            (identical(other.indexedMessages, indexedMessages) ||
                other.indexedMessages == indexedMessages) &&
            (identical(other.lastIndexUpdate, lastIndexUpdate) ||
                other.lastIndexUpdate == lastIndexUpdate) &&
            (identical(other.isIndexing, isIndexing) ||
                other.isIndexing == isIndexing) &&
            (identical(other.indexingProgress, indexingProgress) ||
                other.indexingProgress == indexingProgress) &&
            (identical(other.indexingStatus, indexingStatus) ||
                other.indexingStatus == indexingStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      isIndexed,
      totalMessages,
      indexedMessages,
      lastIndexUpdate,
      isIndexing,
      indexingProgress,
      indexingStatus);

  /// Create a copy of SearchIndexStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchIndexStatusImplCopyWith<_$SearchIndexStatusImpl> get copyWith =>
      __$$SearchIndexStatusImplCopyWithImpl<_$SearchIndexStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchIndexStatusImplToJson(
      this,
    );
  }
}

abstract class _SearchIndexStatus implements SearchIndexStatus {
  const factory _SearchIndexStatus(
      {required final String accountId,
      required final bool isIndexed,
      required final int totalMessages,
      required final int indexedMessages,
      required final DateTime lastIndexUpdate,
      final bool isIndexing,
      final double? indexingProgress,
      final String? indexingStatus}) = _$SearchIndexStatusImpl;

  factory _SearchIndexStatus.fromJson(Map<String, dynamic> json) =
      _$SearchIndexStatusImpl.fromJson;

  @override
  String get accountId;
  @override
  bool get isIndexed;
  @override
  int get totalMessages;
  @override
  int get indexedMessages;
  @override
  DateTime get lastIndexUpdate;
  @override
  bool get isIndexing;
  @override
  double? get indexingProgress;
  @override
  String? get indexingStatus;

  /// Create a copy of SearchIndexStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchIndexStatusImplCopyWith<_$SearchIndexStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdvancedSearchCriteria _$AdvancedSearchCriteriaFromJson(
    Map<String, dynamic> json) {
  return _AdvancedSearchCriteria.fromJson(json);
}

/// @nodoc
mixin _$AdvancedSearchCriteria {
  String? get allWords => throw _privateConstructorUsedError;
  String? get exactPhrase => throw _privateConstructorUsedError;
  String? get anyWords => throw _privateConstructorUsedError;
  String? get excludeWords => throw _privateConstructorUsedError;
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  DateTime? get dateFrom => throw _privateConstructorUsedError;
  DateTime? get dateTo => throw _privateConstructorUsedError;
  bool? get hasAttachments => throw _privateConstructorUsedError;
  List<String>? get attachmentTypes => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  bool? get isFlagged => throw _privateConstructorUsedError;
  bool? get isImportant => throw _privateConstructorUsedError;
  int? get minSize => throw _privateConstructorUsedError;
  int? get maxSize => throw _privateConstructorUsedError;
  List<String>? get labels => throw _privateConstructorUsedError;
  List<String>? get mailboxPaths => throw _privateConstructorUsedError;

  /// Serializes this AdvancedSearchCriteria to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AdvancedSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdvancedSearchCriteriaCopyWith<AdvancedSearchCriteria> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvancedSearchCriteriaCopyWith<$Res> {
  factory $AdvancedSearchCriteriaCopyWith(AdvancedSearchCriteria value,
          $Res Function(AdvancedSearchCriteria) then) =
      _$AdvancedSearchCriteriaCopyWithImpl<$Res, AdvancedSearchCriteria>;
  @useResult
  $Res call(
      {String? allWords,
      String? exactPhrase,
      String? anyWords,
      String? excludeWords,
      String? from,
      String? to,
      String? subject,
      String? body,
      DateTime? dateFrom,
      DateTime? dateTo,
      bool? hasAttachments,
      List<String>? attachmentTypes,
      bool? isRead,
      bool? isFlagged,
      bool? isImportant,
      int? minSize,
      int? maxSize,
      List<String>? labels,
      List<String>? mailboxPaths});
}

/// @nodoc
class _$AdvancedSearchCriteriaCopyWithImpl<$Res,
        $Val extends AdvancedSearchCriteria>
    implements $AdvancedSearchCriteriaCopyWith<$Res> {
  _$AdvancedSearchCriteriaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdvancedSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allWords = freezed,
    Object? exactPhrase = freezed,
    Object? anyWords = freezed,
    Object? excludeWords = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? subject = freezed,
    Object? body = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? hasAttachments = freezed,
    Object? attachmentTypes = freezed,
    Object? isRead = freezed,
    Object? isFlagged = freezed,
    Object? isImportant = freezed,
    Object? minSize = freezed,
    Object? maxSize = freezed,
    Object? labels = freezed,
    Object? mailboxPaths = freezed,
  }) {
    return _then(_value.copyWith(
      allWords: freezed == allWords
          ? _value.allWords
          : allWords // ignore: cast_nullable_to_non_nullable
              as String?,
      exactPhrase: freezed == exactPhrase
          ? _value.exactPhrase
          : exactPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
      anyWords: freezed == anyWords
          ? _value.anyWords
          : anyWords // ignore: cast_nullable_to_non_nullable
              as String?,
      excludeWords: freezed == excludeWords
          ? _value.excludeWords
          : excludeWords // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasAttachments: freezed == hasAttachments
          ? _value.hasAttachments
          : hasAttachments // ignore: cast_nullable_to_non_nullable
              as bool?,
      attachmentTypes: freezed == attachmentTypes
          ? _value.attachmentTypes
          : attachmentTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFlagged: freezed == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool?,
      isImportant: freezed == isImportant
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool?,
      minSize: freezed == minSize
          ? _value.minSize
          : minSize // ignore: cast_nullable_to_non_nullable
              as int?,
      maxSize: freezed == maxSize
          ? _value.maxSize
          : maxSize // ignore: cast_nullable_to_non_nullable
              as int?,
      labels: freezed == labels
          ? _value.labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mailboxPaths: freezed == mailboxPaths
          ? _value.mailboxPaths
          : mailboxPaths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvancedSearchCriteriaImplCopyWith<$Res>
    implements $AdvancedSearchCriteriaCopyWith<$Res> {
  factory _$$AdvancedSearchCriteriaImplCopyWith(
          _$AdvancedSearchCriteriaImpl value,
          $Res Function(_$AdvancedSearchCriteriaImpl) then) =
      __$$AdvancedSearchCriteriaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? allWords,
      String? exactPhrase,
      String? anyWords,
      String? excludeWords,
      String? from,
      String? to,
      String? subject,
      String? body,
      DateTime? dateFrom,
      DateTime? dateTo,
      bool? hasAttachments,
      List<String>? attachmentTypes,
      bool? isRead,
      bool? isFlagged,
      bool? isImportant,
      int? minSize,
      int? maxSize,
      List<String>? labels,
      List<String>? mailboxPaths});
}

/// @nodoc
class __$$AdvancedSearchCriteriaImplCopyWithImpl<$Res>
    extends _$AdvancedSearchCriteriaCopyWithImpl<$Res,
        _$AdvancedSearchCriteriaImpl>
    implements _$$AdvancedSearchCriteriaImplCopyWith<$Res> {
  __$$AdvancedSearchCriteriaImplCopyWithImpl(
      _$AdvancedSearchCriteriaImpl _value,
      $Res Function(_$AdvancedSearchCriteriaImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdvancedSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allWords = freezed,
    Object? exactPhrase = freezed,
    Object? anyWords = freezed,
    Object? excludeWords = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? subject = freezed,
    Object? body = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? hasAttachments = freezed,
    Object? attachmentTypes = freezed,
    Object? isRead = freezed,
    Object? isFlagged = freezed,
    Object? isImportant = freezed,
    Object? minSize = freezed,
    Object? maxSize = freezed,
    Object? labels = freezed,
    Object? mailboxPaths = freezed,
  }) {
    return _then(_$AdvancedSearchCriteriaImpl(
      allWords: freezed == allWords
          ? _value.allWords
          : allWords // ignore: cast_nullable_to_non_nullable
              as String?,
      exactPhrase: freezed == exactPhrase
          ? _value.exactPhrase
          : exactPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
      anyWords: freezed == anyWords
          ? _value.anyWords
          : anyWords // ignore: cast_nullable_to_non_nullable
              as String?,
      excludeWords: freezed == excludeWords
          ? _value.excludeWords
          : excludeWords // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _value.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateTo: freezed == dateTo
          ? _value.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasAttachments: freezed == hasAttachments
          ? _value.hasAttachments
          : hasAttachments // ignore: cast_nullable_to_non_nullable
              as bool?,
      attachmentTypes: freezed == attachmentTypes
          ? _value._attachmentTypes
          : attachmentTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFlagged: freezed == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool?,
      isImportant: freezed == isImportant
          ? _value.isImportant
          : isImportant // ignore: cast_nullable_to_non_nullable
              as bool?,
      minSize: freezed == minSize
          ? _value.minSize
          : minSize // ignore: cast_nullable_to_non_nullable
              as int?,
      maxSize: freezed == maxSize
          ? _value.maxSize
          : maxSize // ignore: cast_nullable_to_non_nullable
              as int?,
      labels: freezed == labels
          ? _value._labels
          : labels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mailboxPaths: freezed == mailboxPaths
          ? _value._mailboxPaths
          : mailboxPaths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvancedSearchCriteriaImpl implements _AdvancedSearchCriteria {
  const _$AdvancedSearchCriteriaImpl(
      {this.allWords,
      this.exactPhrase,
      this.anyWords,
      this.excludeWords,
      this.from,
      this.to,
      this.subject,
      this.body,
      this.dateFrom,
      this.dateTo,
      this.hasAttachments,
      final List<String>? attachmentTypes,
      this.isRead,
      this.isFlagged,
      this.isImportant,
      this.minSize,
      this.maxSize,
      final List<String>? labels,
      final List<String>? mailboxPaths})
      : _attachmentTypes = attachmentTypes,
        _labels = labels,
        _mailboxPaths = mailboxPaths;

  factory _$AdvancedSearchCriteriaImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvancedSearchCriteriaImplFromJson(json);

  @override
  final String? allWords;
  @override
  final String? exactPhrase;
  @override
  final String? anyWords;
  @override
  final String? excludeWords;
  @override
  final String? from;
  @override
  final String? to;
  @override
  final String? subject;
  @override
  final String? body;
  @override
  final DateTime? dateFrom;
  @override
  final DateTime? dateTo;
  @override
  final bool? hasAttachments;
  final List<String>? _attachmentTypes;
  @override
  List<String>? get attachmentTypes {
    final value = _attachmentTypes;
    if (value == null) return null;
    if (_attachmentTypes is EqualUnmodifiableListView) return _attachmentTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isRead;
  @override
  final bool? isFlagged;
  @override
  final bool? isImportant;
  @override
  final int? minSize;
  @override
  final int? maxSize;
  final List<String>? _labels;
  @override
  List<String>? get labels {
    final value = _labels;
    if (value == null) return null;
    if (_labels is EqualUnmodifiableListView) return _labels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _mailboxPaths;
  @override
  List<String>? get mailboxPaths {
    final value = _mailboxPaths;
    if (value == null) return null;
    if (_mailboxPaths is EqualUnmodifiableListView) return _mailboxPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdvancedSearchCriteria(allWords: $allWords, exactPhrase: $exactPhrase, anyWords: $anyWords, excludeWords: $excludeWords, from: $from, to: $to, subject: $subject, body: $body, dateFrom: $dateFrom, dateTo: $dateTo, hasAttachments: $hasAttachments, attachmentTypes: $attachmentTypes, isRead: $isRead, isFlagged: $isFlagged, isImportant: $isImportant, minSize: $minSize, maxSize: $maxSize, labels: $labels, mailboxPaths: $mailboxPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvancedSearchCriteriaImpl &&
            (identical(other.allWords, allWords) ||
                other.allWords == allWords) &&
            (identical(other.exactPhrase, exactPhrase) ||
                other.exactPhrase == exactPhrase) &&
            (identical(other.anyWords, anyWords) ||
                other.anyWords == anyWords) &&
            (identical(other.excludeWords, excludeWords) ||
                other.excludeWords == excludeWords) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.hasAttachments, hasAttachments) ||
                other.hasAttachments == hasAttachments) &&
            const DeepCollectionEquality()
                .equals(other._attachmentTypes, _attachmentTypes) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged) &&
            (identical(other.isImportant, isImportant) ||
                other.isImportant == isImportant) &&
            (identical(other.minSize, minSize) || other.minSize == minSize) &&
            (identical(other.maxSize, maxSize) || other.maxSize == maxSize) &&
            const DeepCollectionEquality().equals(other._labels, _labels) &&
            const DeepCollectionEquality()
                .equals(other._mailboxPaths, _mailboxPaths));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        allWords,
        exactPhrase,
        anyWords,
        excludeWords,
        from,
        to,
        subject,
        body,
        dateFrom,
        dateTo,
        hasAttachments,
        const DeepCollectionEquality().hash(_attachmentTypes),
        isRead,
        isFlagged,
        isImportant,
        minSize,
        maxSize,
        const DeepCollectionEquality().hash(_labels),
        const DeepCollectionEquality().hash(_mailboxPaths)
      ]);

  /// Create a copy of AdvancedSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvancedSearchCriteriaImplCopyWith<_$AdvancedSearchCriteriaImpl>
      get copyWith => __$$AdvancedSearchCriteriaImplCopyWithImpl<
          _$AdvancedSearchCriteriaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvancedSearchCriteriaImplToJson(
      this,
    );
  }
}

abstract class _AdvancedSearchCriteria implements AdvancedSearchCriteria {
  const factory _AdvancedSearchCriteria(
      {final String? allWords,
      final String? exactPhrase,
      final String? anyWords,
      final String? excludeWords,
      final String? from,
      final String? to,
      final String? subject,
      final String? body,
      final DateTime? dateFrom,
      final DateTime? dateTo,
      final bool? hasAttachments,
      final List<String>? attachmentTypes,
      final bool? isRead,
      final bool? isFlagged,
      final bool? isImportant,
      final int? minSize,
      final int? maxSize,
      final List<String>? labels,
      final List<String>? mailboxPaths}) = _$AdvancedSearchCriteriaImpl;

  factory _AdvancedSearchCriteria.fromJson(Map<String, dynamic> json) =
      _$AdvancedSearchCriteriaImpl.fromJson;

  @override
  String? get allWords;
  @override
  String? get exactPhrase;
  @override
  String? get anyWords;
  @override
  String? get excludeWords;
  @override
  String? get from;
  @override
  String? get to;
  @override
  String? get subject;
  @override
  String? get body;
  @override
  DateTime? get dateFrom;
  @override
  DateTime? get dateTo;
  @override
  bool? get hasAttachments;
  @override
  List<String>? get attachmentTypes;
  @override
  bool? get isRead;
  @override
  bool? get isFlagged;
  @override
  bool? get isImportant;
  @override
  int? get minSize;
  @override
  int? get maxSize;
  @override
  List<String>? get labels;
  @override
  List<String>? get mailboxPaths;

  /// Create a copy of AdvancedSearchCriteria
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdvancedSearchCriteriaImplCopyWith<_$AdvancedSearchCriteriaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SearchAnalytics _$SearchAnalyticsFromJson(Map<String, dynamic> json) {
  return _SearchAnalytics.fromJson(json);
}

/// @nodoc
mixin _$SearchAnalytics {
  String get accountId => throw _privateConstructorUsedError;
  int get totalSearches => throw _privateConstructorUsedError;
  Map<String, int> get topSearchTerms => throw _privateConstructorUsedError;
  Map<String, int> get searchResultCounts => throw _privateConstructorUsedError;
  Duration get averageSearchTime => throw _privateConstructorUsedError;
  DateTime get lastSearch => throw _privateConstructorUsedError;
  Map<String, int>? get searchesByMailbox => throw _privateConstructorUsedError;
  Map<String, int>? get searchesByTimeOfDay =>
      throw _privateConstructorUsedError;

  /// Serializes this SearchAnalytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchAnalyticsCopyWith<SearchAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchAnalyticsCopyWith<$Res> {
  factory $SearchAnalyticsCopyWith(
          SearchAnalytics value, $Res Function(SearchAnalytics) then) =
      _$SearchAnalyticsCopyWithImpl<$Res, SearchAnalytics>;
  @useResult
  $Res call(
      {String accountId,
      int totalSearches,
      Map<String, int> topSearchTerms,
      Map<String, int> searchResultCounts,
      Duration averageSearchTime,
      DateTime lastSearch,
      Map<String, int>? searchesByMailbox,
      Map<String, int>? searchesByTimeOfDay});
}

/// @nodoc
class _$SearchAnalyticsCopyWithImpl<$Res, $Val extends SearchAnalytics>
    implements $SearchAnalyticsCopyWith<$Res> {
  _$SearchAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? totalSearches = null,
    Object? topSearchTerms = null,
    Object? searchResultCounts = null,
    Object? averageSearchTime = null,
    Object? lastSearch = null,
    Object? searchesByMailbox = freezed,
    Object? searchesByTimeOfDay = freezed,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      totalSearches: null == totalSearches
          ? _value.totalSearches
          : totalSearches // ignore: cast_nullable_to_non_nullable
              as int,
      topSearchTerms: null == topSearchTerms
          ? _value.topSearchTerms
          : topSearchTerms // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      searchResultCounts: null == searchResultCounts
          ? _value.searchResultCounts
          : searchResultCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      averageSearchTime: null == averageSearchTime
          ? _value.averageSearchTime
          : averageSearchTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      lastSearch: null == lastSearch
          ? _value.lastSearch
          : lastSearch // ignore: cast_nullable_to_non_nullable
              as DateTime,
      searchesByMailbox: freezed == searchesByMailbox
          ? _value.searchesByMailbox
          : searchesByMailbox // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      searchesByTimeOfDay: freezed == searchesByTimeOfDay
          ? _value.searchesByTimeOfDay
          : searchesByTimeOfDay // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchAnalyticsImplCopyWith<$Res>
    implements $SearchAnalyticsCopyWith<$Res> {
  factory _$$SearchAnalyticsImplCopyWith(_$SearchAnalyticsImpl value,
          $Res Function(_$SearchAnalyticsImpl) then) =
      __$$SearchAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountId,
      int totalSearches,
      Map<String, int> topSearchTerms,
      Map<String, int> searchResultCounts,
      Duration averageSearchTime,
      DateTime lastSearch,
      Map<String, int>? searchesByMailbox,
      Map<String, int>? searchesByTimeOfDay});
}

/// @nodoc
class __$$SearchAnalyticsImplCopyWithImpl<$Res>
    extends _$SearchAnalyticsCopyWithImpl<$Res, _$SearchAnalyticsImpl>
    implements _$$SearchAnalyticsImplCopyWith<$Res> {
  __$$SearchAnalyticsImplCopyWithImpl(
      _$SearchAnalyticsImpl _value, $Res Function(_$SearchAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? totalSearches = null,
    Object? topSearchTerms = null,
    Object? searchResultCounts = null,
    Object? averageSearchTime = null,
    Object? lastSearch = null,
    Object? searchesByMailbox = freezed,
    Object? searchesByTimeOfDay = freezed,
  }) {
    return _then(_$SearchAnalyticsImpl(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      totalSearches: null == totalSearches
          ? _value.totalSearches
          : totalSearches // ignore: cast_nullable_to_non_nullable
              as int,
      topSearchTerms: null == topSearchTerms
          ? _value._topSearchTerms
          : topSearchTerms // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      searchResultCounts: null == searchResultCounts
          ? _value._searchResultCounts
          : searchResultCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      averageSearchTime: null == averageSearchTime
          ? _value.averageSearchTime
          : averageSearchTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      lastSearch: null == lastSearch
          ? _value.lastSearch
          : lastSearch // ignore: cast_nullable_to_non_nullable
              as DateTime,
      searchesByMailbox: freezed == searchesByMailbox
          ? _value._searchesByMailbox
          : searchesByMailbox // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      searchesByTimeOfDay: freezed == searchesByTimeOfDay
          ? _value._searchesByTimeOfDay
          : searchesByTimeOfDay // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchAnalyticsImpl implements _SearchAnalytics {
  const _$SearchAnalyticsImpl(
      {required this.accountId,
      required this.totalSearches,
      required final Map<String, int> topSearchTerms,
      required final Map<String, int> searchResultCounts,
      required this.averageSearchTime,
      required this.lastSearch,
      final Map<String, int>? searchesByMailbox,
      final Map<String, int>? searchesByTimeOfDay})
      : _topSearchTerms = topSearchTerms,
        _searchResultCounts = searchResultCounts,
        _searchesByMailbox = searchesByMailbox,
        _searchesByTimeOfDay = searchesByTimeOfDay;

  factory _$SearchAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchAnalyticsImplFromJson(json);

  @override
  final String accountId;
  @override
  final int totalSearches;
  final Map<String, int> _topSearchTerms;
  @override
  Map<String, int> get topSearchTerms {
    if (_topSearchTerms is EqualUnmodifiableMapView) return _topSearchTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_topSearchTerms);
  }

  final Map<String, int> _searchResultCounts;
  @override
  Map<String, int> get searchResultCounts {
    if (_searchResultCounts is EqualUnmodifiableMapView)
      return _searchResultCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchResultCounts);
  }

  @override
  final Duration averageSearchTime;
  @override
  final DateTime lastSearch;
  final Map<String, int>? _searchesByMailbox;
  @override
  Map<String, int>? get searchesByMailbox {
    final value = _searchesByMailbox;
    if (value == null) return null;
    if (_searchesByMailbox is EqualUnmodifiableMapView)
      return _searchesByMailbox;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, int>? _searchesByTimeOfDay;
  @override
  Map<String, int>? get searchesByTimeOfDay {
    final value = _searchesByTimeOfDay;
    if (value == null) return null;
    if (_searchesByTimeOfDay is EqualUnmodifiableMapView)
      return _searchesByTimeOfDay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SearchAnalytics(accountId: $accountId, totalSearches: $totalSearches, topSearchTerms: $topSearchTerms, searchResultCounts: $searchResultCounts, averageSearchTime: $averageSearchTime, lastSearch: $lastSearch, searchesByMailbox: $searchesByMailbox, searchesByTimeOfDay: $searchesByTimeOfDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchAnalyticsImpl &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.totalSearches, totalSearches) ||
                other.totalSearches == totalSearches) &&
            const DeepCollectionEquality()
                .equals(other._topSearchTerms, _topSearchTerms) &&
            const DeepCollectionEquality()
                .equals(other._searchResultCounts, _searchResultCounts) &&
            (identical(other.averageSearchTime, averageSearchTime) ||
                other.averageSearchTime == averageSearchTime) &&
            (identical(other.lastSearch, lastSearch) ||
                other.lastSearch == lastSearch) &&
            const DeepCollectionEquality()
                .equals(other._searchesByMailbox, _searchesByMailbox) &&
            const DeepCollectionEquality()
                .equals(other._searchesByTimeOfDay, _searchesByTimeOfDay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountId,
      totalSearches,
      const DeepCollectionEquality().hash(_topSearchTerms),
      const DeepCollectionEquality().hash(_searchResultCounts),
      averageSearchTime,
      lastSearch,
      const DeepCollectionEquality().hash(_searchesByMailbox),
      const DeepCollectionEquality().hash(_searchesByTimeOfDay));

  /// Create a copy of SearchAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchAnalyticsImplCopyWith<_$SearchAnalyticsImpl> get copyWith =>
      __$$SearchAnalyticsImplCopyWithImpl<_$SearchAnalyticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _SearchAnalytics implements SearchAnalytics {
  const factory _SearchAnalytics(
      {required final String accountId,
      required final int totalSearches,
      required final Map<String, int> topSearchTerms,
      required final Map<String, int> searchResultCounts,
      required final Duration averageSearchTime,
      required final DateTime lastSearch,
      final Map<String, int>? searchesByMailbox,
      final Map<String, int>? searchesByTimeOfDay}) = _$SearchAnalyticsImpl;

  factory _SearchAnalytics.fromJson(Map<String, dynamic> json) =
      _$SearchAnalyticsImpl.fromJson;

  @override
  String get accountId;
  @override
  int get totalSearches;
  @override
  Map<String, int> get topSearchTerms;
  @override
  Map<String, int> get searchResultCounts;
  @override
  Duration get averageSearchTime;
  @override
  DateTime get lastSearch;
  @override
  Map<String, int>? get searchesByMailbox;
  @override
  Map<String, int>? get searchesByTimeOfDay;

  /// Create a copy of SearchAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchAnalyticsImplCopyWith<_$SearchAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
