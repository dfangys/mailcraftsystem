// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchQuery _$SearchQueryFromJson(Map<String, dynamic> json) {
  return _SearchQuery.fromJson(json);
}

/// @nodoc
mixin _$SearchQuery {
  String get id => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;
  List<String>? get mailboxPaths => throw _privateConstructorUsedError;
  SearchFilters? get filters => throw _privateConstructorUsedError;
  SearchSort? get sort => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this SearchQuery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchQueryCopyWith<SearchQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchQueryCopyWith<$Res> {
  factory $SearchQueryCopyWith(
          SearchQuery value, $Res Function(SearchQuery) then) =
      _$SearchQueryCopyWithImpl<$Res, SearchQuery>;
  @useResult
  $Res call(
      {String id,
      String query,
      String? accountId,
      List<String>? mailboxPaths,
      SearchFilters? filters,
      SearchSort? sort,
      int limit,
      int offset,
      DateTime? createdAt,
      bool isSaved,
      String? name});

  $SearchFiltersCopyWith<$Res>? get filters;
  $SearchSortCopyWith<$Res>? get sort;
}

/// @nodoc
class _$SearchQueryCopyWithImpl<$Res, $Val extends SearchQuery>
    implements $SearchQueryCopyWith<$Res> {
  _$SearchQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? query = null,
    Object? accountId = freezed,
    Object? mailboxPaths = freezed,
    Object? filters = freezed,
    Object? sort = freezed,
    Object? limit = null,
    Object? offset = null,
    Object? createdAt = freezed,
    Object? isSaved = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      mailboxPaths: freezed == mailboxPaths
          ? _value.mailboxPaths
          : mailboxPaths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as SearchFilters?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SearchSort?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchFiltersCopyWith<$Res>? get filters {
    if (_value.filters == null) {
      return null;
    }

    return $SearchFiltersCopyWith<$Res>(_value.filters!, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }

  /// Create a copy of SearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchSortCopyWith<$Res>? get sort {
    if (_value.sort == null) {
      return null;
    }

    return $SearchSortCopyWith<$Res>(_value.sort!, (value) {
      return _then(_value.copyWith(sort: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchQueryImplCopyWith<$Res>
    implements $SearchQueryCopyWith<$Res> {
  factory _$$SearchQueryImplCopyWith(
          _$SearchQueryImpl value, $Res Function(_$SearchQueryImpl) then) =
      __$$SearchQueryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String query,
      String? accountId,
      List<String>? mailboxPaths,
      SearchFilters? filters,
      SearchSort? sort,
      int limit,
      int offset,
      DateTime? createdAt,
      bool isSaved,
      String? name});

  @override
  $SearchFiltersCopyWith<$Res>? get filters;
  @override
  $SearchSortCopyWith<$Res>? get sort;
}

/// @nodoc
class __$$SearchQueryImplCopyWithImpl<$Res>
    extends _$SearchQueryCopyWithImpl<$Res, _$SearchQueryImpl>
    implements _$$SearchQueryImplCopyWith<$Res> {
  __$$SearchQueryImplCopyWithImpl(
      _$SearchQueryImpl _value, $Res Function(_$SearchQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? query = null,
    Object? accountId = freezed,
    Object? mailboxPaths = freezed,
    Object? filters = freezed,
    Object? sort = freezed,
    Object? limit = null,
    Object? offset = null,
    Object? createdAt = freezed,
    Object? isSaved = null,
    Object? name = freezed,
  }) {
    return _then(_$SearchQueryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      mailboxPaths: freezed == mailboxPaths
          ? _value._mailboxPaths
          : mailboxPaths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as SearchFilters?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as SearchSort?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchQueryImpl implements _SearchQuery {
  const _$SearchQueryImpl(
      {required this.id,
      required this.query,
      this.accountId,
      final List<String>? mailboxPaths,
      this.filters,
      this.sort,
      this.limit = 50,
      this.offset = 0,
      this.createdAt,
      this.isSaved = false,
      this.name})
      : _mailboxPaths = mailboxPaths;

  factory _$SearchQueryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchQueryImplFromJson(json);

  @override
  final String id;
  @override
  final String query;
  @override
  final String? accountId;
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
  final SearchFilters? filters;
  @override
  final SearchSort? sort;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey()
  final bool isSaved;
  @override
  final String? name;

  @override
  String toString() {
    return 'SearchQuery(id: $id, query: $query, accountId: $accountId, mailboxPaths: $mailboxPaths, filters: $filters, sort: $sort, limit: $limit, offset: $offset, createdAt: $createdAt, isSaved: $isSaved, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchQueryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            const DeepCollectionEquality()
                .equals(other._mailboxPaths, _mailboxPaths) &&
            (identical(other.filters, filters) || other.filters == filters) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      query,
      accountId,
      const DeepCollectionEquality().hash(_mailboxPaths),
      filters,
      sort,
      limit,
      offset,
      createdAt,
      isSaved,
      name);

  /// Create a copy of SearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchQueryImplCopyWith<_$SearchQueryImpl> get copyWith =>
      __$$SearchQueryImplCopyWithImpl<_$SearchQueryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchQueryImplToJson(
      this,
    );
  }
}

abstract class _SearchQuery implements SearchQuery {
  const factory _SearchQuery(
      {required final String id,
      required final String query,
      final String? accountId,
      final List<String>? mailboxPaths,
      final SearchFilters? filters,
      final SearchSort? sort,
      final int limit,
      final int offset,
      final DateTime? createdAt,
      final bool isSaved,
      final String? name}) = _$SearchQueryImpl;

  factory _SearchQuery.fromJson(Map<String, dynamic> json) =
      _$SearchQueryImpl.fromJson;

  @override
  String get id;
  @override
  String get query;
  @override
  String? get accountId;
  @override
  List<String>? get mailboxPaths;
  @override
  SearchFilters? get filters;
  @override
  SearchSort? get sort;
  @override
  int get limit;
  @override
  int get offset;
  @override
  DateTime? get createdAt;
  @override
  bool get isSaved;
  @override
  String? get name;

  /// Create a copy of SearchQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchQueryImplCopyWith<_$SearchQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchFilters _$SearchFiltersFromJson(Map<String, dynamic> json) {
  return _SearchFilters.fromJson(json);
}

/// @nodoc
mixin _$SearchFilters {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  DateTime? get dateFrom => throw _privateConstructorUsedError;
  DateTime? get dateTo => throw _privateConstructorUsedError;
  bool? get hasAttachments => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  bool? get isFlagged => throw _privateConstructorUsedError;
  MessagePriority? get priority => throw _privateConstructorUsedError;
  List<String>? get attachmentTypes => throw _privateConstructorUsedError;
  int? get minSize => throw _privateConstructorUsedError;
  int? get maxSize => throw _privateConstructorUsedError;

  /// Serializes this SearchFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchFiltersCopyWith<SearchFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFiltersCopyWith<$Res> {
  factory $SearchFiltersCopyWith(
          SearchFilters value, $Res Function(SearchFilters) then) =
      _$SearchFiltersCopyWithImpl<$Res, SearchFilters>;
  @useResult
  $Res call(
      {String? from,
      String? to,
      String? subject,
      String? body,
      DateTime? dateFrom,
      DateTime? dateTo,
      bool? hasAttachments,
      bool? isRead,
      bool? isFlagged,
      MessagePriority? priority,
      List<String>? attachmentTypes,
      int? minSize,
      int? maxSize});
}

/// @nodoc
class _$SearchFiltersCopyWithImpl<$Res, $Val extends SearchFilters>
    implements $SearchFiltersCopyWith<$Res> {
  _$SearchFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? subject = freezed,
    Object? body = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? hasAttachments = freezed,
    Object? isRead = freezed,
    Object? isFlagged = freezed,
    Object? priority = freezed,
    Object? attachmentTypes = freezed,
    Object? minSize = freezed,
    Object? maxSize = freezed,
  }) {
    return _then(_value.copyWith(
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
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFlagged: freezed == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as MessagePriority?,
      attachmentTypes: freezed == attachmentTypes
          ? _value.attachmentTypes
          : attachmentTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minSize: freezed == minSize
          ? _value.minSize
          : minSize // ignore: cast_nullable_to_non_nullable
              as int?,
      maxSize: freezed == maxSize
          ? _value.maxSize
          : maxSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchFiltersImplCopyWith<$Res>
    implements $SearchFiltersCopyWith<$Res> {
  factory _$$SearchFiltersImplCopyWith(
          _$SearchFiltersImpl value, $Res Function(_$SearchFiltersImpl) then) =
      __$$SearchFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? from,
      String? to,
      String? subject,
      String? body,
      DateTime? dateFrom,
      DateTime? dateTo,
      bool? hasAttachments,
      bool? isRead,
      bool? isFlagged,
      MessagePriority? priority,
      List<String>? attachmentTypes,
      int? minSize,
      int? maxSize});
}

/// @nodoc
class __$$SearchFiltersImplCopyWithImpl<$Res>
    extends _$SearchFiltersCopyWithImpl<$Res, _$SearchFiltersImpl>
    implements _$$SearchFiltersImplCopyWith<$Res> {
  __$$SearchFiltersImplCopyWithImpl(
      _$SearchFiltersImpl _value, $Res Function(_$SearchFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? subject = freezed,
    Object? body = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? hasAttachments = freezed,
    Object? isRead = freezed,
    Object? isFlagged = freezed,
    Object? priority = freezed,
    Object? attachmentTypes = freezed,
    Object? minSize = freezed,
    Object? maxSize = freezed,
  }) {
    return _then(_$SearchFiltersImpl(
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
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFlagged: freezed == isFlagged
          ? _value.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as MessagePriority?,
      attachmentTypes: freezed == attachmentTypes
          ? _value._attachmentTypes
          : attachmentTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      minSize: freezed == minSize
          ? _value.minSize
          : minSize // ignore: cast_nullable_to_non_nullable
              as int?,
      maxSize: freezed == maxSize
          ? _value.maxSize
          : maxSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchFiltersImpl implements _SearchFilters {
  const _$SearchFiltersImpl(
      {this.from,
      this.to,
      this.subject,
      this.body,
      this.dateFrom,
      this.dateTo,
      this.hasAttachments,
      this.isRead,
      this.isFlagged,
      this.priority,
      final List<String>? attachmentTypes,
      this.minSize,
      this.maxSize})
      : _attachmentTypes = attachmentTypes;

  factory _$SearchFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchFiltersImplFromJson(json);

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
  @override
  final bool? isRead;
  @override
  final bool? isFlagged;
  @override
  final MessagePriority? priority;
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
  final int? minSize;
  @override
  final int? maxSize;

  @override
  String toString() {
    return 'SearchFilters(from: $from, to: $to, subject: $subject, body: $body, dateFrom: $dateFrom, dateTo: $dateTo, hasAttachments: $hasAttachments, isRead: $isRead, isFlagged: $isFlagged, priority: $priority, attachmentTypes: $attachmentTypes, minSize: $minSize, maxSize: $maxSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFiltersImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.hasAttachments, hasAttachments) ||
                other.hasAttachments == hasAttachments) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            const DeepCollectionEquality()
                .equals(other._attachmentTypes, _attachmentTypes) &&
            (identical(other.minSize, minSize) || other.minSize == minSize) &&
            (identical(other.maxSize, maxSize) || other.maxSize == maxSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      from,
      to,
      subject,
      body,
      dateFrom,
      dateTo,
      hasAttachments,
      isRead,
      isFlagged,
      priority,
      const DeepCollectionEquality().hash(_attachmentTypes),
      minSize,
      maxSize);

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFiltersImplCopyWith<_$SearchFiltersImpl> get copyWith =>
      __$$SearchFiltersImplCopyWithImpl<_$SearchFiltersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchFiltersImplToJson(
      this,
    );
  }
}

abstract class _SearchFilters implements SearchFilters {
  const factory _SearchFilters(
      {final String? from,
      final String? to,
      final String? subject,
      final String? body,
      final DateTime? dateFrom,
      final DateTime? dateTo,
      final bool? hasAttachments,
      final bool? isRead,
      final bool? isFlagged,
      final MessagePriority? priority,
      final List<String>? attachmentTypes,
      final int? minSize,
      final int? maxSize}) = _$SearchFiltersImpl;

  factory _SearchFilters.fromJson(Map<String, dynamic> json) =
      _$SearchFiltersImpl.fromJson;

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
  bool? get isRead;
  @override
  bool? get isFlagged;
  @override
  MessagePriority? get priority;
  @override
  List<String>? get attachmentTypes;
  @override
  int? get minSize;
  @override
  int? get maxSize;

  /// Create a copy of SearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchFiltersImplCopyWith<_$SearchFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchSort _$SearchSortFromJson(Map<String, dynamic> json) {
  return _SearchSort.fromJson(json);
}

/// @nodoc
mixin _$SearchSort {
  SearchSortField get field => throw _privateConstructorUsedError;
  SearchSortOrder get order => throw _privateConstructorUsedError;

  /// Serializes this SearchSort to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchSortCopyWith<SearchSort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSortCopyWith<$Res> {
  factory $SearchSortCopyWith(
          SearchSort value, $Res Function(SearchSort) then) =
      _$SearchSortCopyWithImpl<$Res, SearchSort>;
  @useResult
  $Res call({SearchSortField field, SearchSortOrder order});
}

/// @nodoc
class _$SearchSortCopyWithImpl<$Res, $Val extends SearchSort>
    implements $SearchSortCopyWith<$Res> {
  _$SearchSortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as SearchSortField,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as SearchSortOrder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSortImplCopyWith<$Res>
    implements $SearchSortCopyWith<$Res> {
  factory _$$SearchSortImplCopyWith(
          _$SearchSortImpl value, $Res Function(_$SearchSortImpl) then) =
      __$$SearchSortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchSortField field, SearchSortOrder order});
}

/// @nodoc
class __$$SearchSortImplCopyWithImpl<$Res>
    extends _$SearchSortCopyWithImpl<$Res, _$SearchSortImpl>
    implements _$$SearchSortImplCopyWith<$Res> {
  __$$SearchSortImplCopyWithImpl(
      _$SearchSortImpl _value, $Res Function(_$SearchSortImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? order = null,
  }) {
    return _then(_$SearchSortImpl(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as SearchSortField,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as SearchSortOrder,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSortImpl implements _SearchSort {
  const _$SearchSortImpl({required this.field, required this.order});

  factory _$SearchSortImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchSortImplFromJson(json);

  @override
  final SearchSortField field;
  @override
  final SearchSortOrder order;

  @override
  String toString() {
    return 'SearchSort(field: $field, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSortImpl &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, field, order);

  /// Create a copy of SearchSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSortImplCopyWith<_$SearchSortImpl> get copyWith =>
      __$$SearchSortImplCopyWithImpl<_$SearchSortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSortImplToJson(
      this,
    );
  }
}

abstract class _SearchSort implements SearchSort {
  const factory _SearchSort(
      {required final SearchSortField field,
      required final SearchSortOrder order}) = _$SearchSortImpl;

  factory _SearchSort.fromJson(Map<String, dynamic> json) =
      _$SearchSortImpl.fromJson;

  @override
  SearchSortField get field;
  @override
  SearchSortOrder get order;

  /// Create a copy of SearchSort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSortImplCopyWith<_$SearchSortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return _SearchResult.fromJson(json);
}

/// @nodoc
mixin _$SearchResult {
  String get queryId => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  DateTime get searchTime => throw _privateConstructorUsedError;
  Duration get searchDuration => throw _privateConstructorUsedError;
  SearchStats? get stats => throw _privateConstructorUsedError;

  /// Serializes this SearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchResultCopyWith<SearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) then) =
      _$SearchResultCopyWithImpl<$Res, SearchResult>;
  @useResult
  $Res call(
      {String queryId,
      List<Message> messages,
      int totalCount,
      bool hasMore,
      DateTime searchTime,
      Duration searchDuration,
      SearchStats? stats});

  $SearchStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res, $Val extends SearchResult>
    implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryId = null,
    Object? messages = null,
    Object? totalCount = null,
    Object? hasMore = null,
    Object? searchTime = null,
    Object? searchDuration = null,
    Object? stats = freezed,
  }) {
    return _then(_value.copyWith(
      queryId: null == queryId
          ? _value.queryId
          : queryId // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchTime: null == searchTime
          ? _value.searchTime
          : searchTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      searchDuration: null == searchDuration
          ? _value.searchDuration
          : searchDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as SearchStats?,
    ) as $Val);
  }

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $SearchStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchResultImplCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$$SearchResultImplCopyWith(
          _$SearchResultImpl value, $Res Function(_$SearchResultImpl) then) =
      __$$SearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String queryId,
      List<Message> messages,
      int totalCount,
      bool hasMore,
      DateTime searchTime,
      Duration searchDuration,
      SearchStats? stats});

  @override
  $SearchStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$SearchResultImplCopyWithImpl<$Res>
    extends _$SearchResultCopyWithImpl<$Res, _$SearchResultImpl>
    implements _$$SearchResultImplCopyWith<$Res> {
  __$$SearchResultImplCopyWithImpl(
      _$SearchResultImpl _value, $Res Function(_$SearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryId = null,
    Object? messages = null,
    Object? totalCount = null,
    Object? hasMore = null,
    Object? searchTime = null,
    Object? searchDuration = null,
    Object? stats = freezed,
  }) {
    return _then(_$SearchResultImpl(
      queryId: null == queryId
          ? _value.queryId
          : queryId // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      searchTime: null == searchTime
          ? _value.searchTime
          : searchTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      searchDuration: null == searchDuration
          ? _value.searchDuration
          : searchDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as SearchStats?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchResultImpl implements _SearchResult {
  const _$SearchResultImpl(
      {required this.queryId,
      required final List<Message> messages,
      required this.totalCount,
      required this.hasMore,
      required this.searchTime,
      required this.searchDuration,
      this.stats})
      : _messages = messages;

  factory _$SearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchResultImplFromJson(json);

  @override
  final String queryId;
  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final int totalCount;
  @override
  final bool hasMore;
  @override
  final DateTime searchTime;
  @override
  final Duration searchDuration;
  @override
  final SearchStats? stats;

  @override
  String toString() {
    return 'SearchResult(queryId: $queryId, messages: $messages, totalCount: $totalCount, hasMore: $hasMore, searchTime: $searchTime, searchDuration: $searchDuration, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultImpl &&
            (identical(other.queryId, queryId) || other.queryId == queryId) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.searchTime, searchTime) ||
                other.searchTime == searchTime) &&
            (identical(other.searchDuration, searchDuration) ||
                other.searchDuration == searchDuration) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      queryId,
      const DeepCollectionEquality().hash(_messages),
      totalCount,
      hasMore,
      searchTime,
      searchDuration,
      stats);

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      __$$SearchResultImplCopyWithImpl<_$SearchResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchResultImplToJson(
      this,
    );
  }
}

abstract class _SearchResult implements SearchResult {
  const factory _SearchResult(
      {required final String queryId,
      required final List<Message> messages,
      required final int totalCount,
      required final bool hasMore,
      required final DateTime searchTime,
      required final Duration searchDuration,
      final SearchStats? stats}) = _$SearchResultImpl;

  factory _SearchResult.fromJson(Map<String, dynamic> json) =
      _$SearchResultImpl.fromJson;

  @override
  String get queryId;
  @override
  List<Message> get messages;
  @override
  int get totalCount;
  @override
  bool get hasMore;
  @override
  DateTime get searchTime;
  @override
  Duration get searchDuration;
  @override
  SearchStats? get stats;

  /// Create a copy of SearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchResultImplCopyWith<_$SearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchStats _$SearchStatsFromJson(Map<String, dynamic> json) {
  return _SearchStats.fromJson(json);
}

/// @nodoc
mixin _$SearchStats {
  int get totalMessages => throw _privateConstructorUsedError;
  int get matchedMessages => throw _privateConstructorUsedError;
  Map<String, int> get mailboxCounts => throw _privateConstructorUsedError;
  Map<String, int> get senderCounts => throw _privateConstructorUsedError;
  Map<String, int> get dateCounts => throw _privateConstructorUsedError;

  /// Serializes this SearchStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStatsCopyWith<SearchStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStatsCopyWith<$Res> {
  factory $SearchStatsCopyWith(
          SearchStats value, $Res Function(SearchStats) then) =
      _$SearchStatsCopyWithImpl<$Res, SearchStats>;
  @useResult
  $Res call(
      {int totalMessages,
      int matchedMessages,
      Map<String, int> mailboxCounts,
      Map<String, int> senderCounts,
      Map<String, int> dateCounts});
}

/// @nodoc
class _$SearchStatsCopyWithImpl<$Res, $Val extends SearchStats>
    implements $SearchStatsCopyWith<$Res> {
  _$SearchStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMessages = null,
    Object? matchedMessages = null,
    Object? mailboxCounts = null,
    Object? senderCounts = null,
    Object? dateCounts = null,
  }) {
    return _then(_value.copyWith(
      totalMessages: null == totalMessages
          ? _value.totalMessages
          : totalMessages // ignore: cast_nullable_to_non_nullable
              as int,
      matchedMessages: null == matchedMessages
          ? _value.matchedMessages
          : matchedMessages // ignore: cast_nullable_to_non_nullable
              as int,
      mailboxCounts: null == mailboxCounts
          ? _value.mailboxCounts
          : mailboxCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      senderCounts: null == senderCounts
          ? _value.senderCounts
          : senderCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      dateCounts: null == dateCounts
          ? _value.dateCounts
          : dateCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStatsImplCopyWith<$Res>
    implements $SearchStatsCopyWith<$Res> {
  factory _$$SearchStatsImplCopyWith(
          _$SearchStatsImpl value, $Res Function(_$SearchStatsImpl) then) =
      __$$SearchStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalMessages,
      int matchedMessages,
      Map<String, int> mailboxCounts,
      Map<String, int> senderCounts,
      Map<String, int> dateCounts});
}

/// @nodoc
class __$$SearchStatsImplCopyWithImpl<$Res>
    extends _$SearchStatsCopyWithImpl<$Res, _$SearchStatsImpl>
    implements _$$SearchStatsImplCopyWith<$Res> {
  __$$SearchStatsImplCopyWithImpl(
      _$SearchStatsImpl _value, $Res Function(_$SearchStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMessages = null,
    Object? matchedMessages = null,
    Object? mailboxCounts = null,
    Object? senderCounts = null,
    Object? dateCounts = null,
  }) {
    return _then(_$SearchStatsImpl(
      totalMessages: null == totalMessages
          ? _value.totalMessages
          : totalMessages // ignore: cast_nullable_to_non_nullable
              as int,
      matchedMessages: null == matchedMessages
          ? _value.matchedMessages
          : matchedMessages // ignore: cast_nullable_to_non_nullable
              as int,
      mailboxCounts: null == mailboxCounts
          ? _value._mailboxCounts
          : mailboxCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      senderCounts: null == senderCounts
          ? _value._senderCounts
          : senderCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      dateCounts: null == dateCounts
          ? _value._dateCounts
          : dateCounts // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchStatsImpl implements _SearchStats {
  const _$SearchStatsImpl(
      {required this.totalMessages,
      required this.matchedMessages,
      required final Map<String, int> mailboxCounts,
      required final Map<String, int> senderCounts,
      required final Map<String, int> dateCounts})
      : _mailboxCounts = mailboxCounts,
        _senderCounts = senderCounts,
        _dateCounts = dateCounts;

  factory _$SearchStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchStatsImplFromJson(json);

  @override
  final int totalMessages;
  @override
  final int matchedMessages;
  final Map<String, int> _mailboxCounts;
  @override
  Map<String, int> get mailboxCounts {
    if (_mailboxCounts is EqualUnmodifiableMapView) return _mailboxCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_mailboxCounts);
  }

  final Map<String, int> _senderCounts;
  @override
  Map<String, int> get senderCounts {
    if (_senderCounts is EqualUnmodifiableMapView) return _senderCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_senderCounts);
  }

  final Map<String, int> _dateCounts;
  @override
  Map<String, int> get dateCounts {
    if (_dateCounts is EqualUnmodifiableMapView) return _dateCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dateCounts);
  }

  @override
  String toString() {
    return 'SearchStats(totalMessages: $totalMessages, matchedMessages: $matchedMessages, mailboxCounts: $mailboxCounts, senderCounts: $senderCounts, dateCounts: $dateCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStatsImpl &&
            (identical(other.totalMessages, totalMessages) ||
                other.totalMessages == totalMessages) &&
            (identical(other.matchedMessages, matchedMessages) ||
                other.matchedMessages == matchedMessages) &&
            const DeepCollectionEquality()
                .equals(other._mailboxCounts, _mailboxCounts) &&
            const DeepCollectionEquality()
                .equals(other._senderCounts, _senderCounts) &&
            const DeepCollectionEquality()
                .equals(other._dateCounts, _dateCounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalMessages,
      matchedMessages,
      const DeepCollectionEquality().hash(_mailboxCounts),
      const DeepCollectionEquality().hash(_senderCounts),
      const DeepCollectionEquality().hash(_dateCounts));

  /// Create a copy of SearchStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStatsImplCopyWith<_$SearchStatsImpl> get copyWith =>
      __$$SearchStatsImplCopyWithImpl<_$SearchStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchStatsImplToJson(
      this,
    );
  }
}

abstract class _SearchStats implements SearchStats {
  const factory _SearchStats(
      {required final int totalMessages,
      required final int matchedMessages,
      required final Map<String, int> mailboxCounts,
      required final Map<String, int> senderCounts,
      required final Map<String, int> dateCounts}) = _$SearchStatsImpl;

  factory _SearchStats.fromJson(Map<String, dynamic> json) =
      _$SearchStatsImpl.fromJson;

  @override
  int get totalMessages;
  @override
  int get matchedMessages;
  @override
  Map<String, int> get mailboxCounts;
  @override
  Map<String, int> get senderCounts;
  @override
  Map<String, int> get dateCounts;

  /// Create a copy of SearchStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStatsImplCopyWith<_$SearchStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchSuggestion _$SearchSuggestionFromJson(Map<String, dynamic> json) {
  return _SearchSuggestion.fromJson(json);
}

/// @nodoc
mixin _$SearchSuggestion {
  String get text => throw _privateConstructorUsedError;
  SearchSuggestionType get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get frequency => throw _privateConstructorUsedError;
  DateTime? get lastUsed => throw _privateConstructorUsedError;

  /// Serializes this SearchSuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchSuggestionCopyWith<SearchSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSuggestionCopyWith<$Res> {
  factory $SearchSuggestionCopyWith(
          SearchSuggestion value, $Res Function(SearchSuggestion) then) =
      _$SearchSuggestionCopyWithImpl<$Res, SearchSuggestion>;
  @useResult
  $Res call(
      {String text,
      SearchSuggestionType type,
      String? description,
      int? frequency,
      DateTime? lastUsed});
}

/// @nodoc
class _$SearchSuggestionCopyWithImpl<$Res, $Val extends SearchSuggestion>
    implements $SearchSuggestionCopyWith<$Res> {
  _$SearchSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
    Object? description = freezed,
    Object? frequency = freezed,
    Object? lastUsed = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchSuggestionType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSuggestionImplCopyWith<$Res>
    implements $SearchSuggestionCopyWith<$Res> {
  factory _$$SearchSuggestionImplCopyWith(_$SearchSuggestionImpl value,
          $Res Function(_$SearchSuggestionImpl) then) =
      __$$SearchSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      SearchSuggestionType type,
      String? description,
      int? frequency,
      DateTime? lastUsed});
}

/// @nodoc
class __$$SearchSuggestionImplCopyWithImpl<$Res>
    extends _$SearchSuggestionCopyWithImpl<$Res, _$SearchSuggestionImpl>
    implements _$$SearchSuggestionImplCopyWith<$Res> {
  __$$SearchSuggestionImplCopyWithImpl(_$SearchSuggestionImpl _value,
      $Res Function(_$SearchSuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? type = null,
    Object? description = freezed,
    Object? frequency = freezed,
    Object? lastUsed = freezed,
  }) {
    return _then(_$SearchSuggestionImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SearchSuggestionType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int?,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSuggestionImpl implements _SearchSuggestion {
  const _$SearchSuggestionImpl(
      {required this.text,
      required this.type,
      this.description,
      this.frequency,
      this.lastUsed});

  factory _$SearchSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchSuggestionImplFromJson(json);

  @override
  final String text;
  @override
  final SearchSuggestionType type;
  @override
  final String? description;
  @override
  final int? frequency;
  @override
  final DateTime? lastUsed;

  @override
  String toString() {
    return 'SearchSuggestion(text: $text, type: $type, description: $description, frequency: $frequency, lastUsed: $lastUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSuggestionImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, type, description, frequency, lastUsed);

  /// Create a copy of SearchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSuggestionImplCopyWith<_$SearchSuggestionImpl> get copyWith =>
      __$$SearchSuggestionImplCopyWithImpl<_$SearchSuggestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSuggestionImplToJson(
      this,
    );
  }
}

abstract class _SearchSuggestion implements SearchSuggestion {
  const factory _SearchSuggestion(
      {required final String text,
      required final SearchSuggestionType type,
      final String? description,
      final int? frequency,
      final DateTime? lastUsed}) = _$SearchSuggestionImpl;

  factory _SearchSuggestion.fromJson(Map<String, dynamic> json) =
      _$SearchSuggestionImpl.fromJson;

  @override
  String get text;
  @override
  SearchSuggestionType get type;
  @override
  String? get description;
  @override
  int? get frequency;
  @override
  DateTime? get lastUsed;

  /// Create a copy of SearchSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchSuggestionImplCopyWith<_$SearchSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchHistory _$SearchHistoryFromJson(Map<String, dynamic> json) {
  return _SearchHistory.fromJson(json);
}

/// @nodoc
mixin _$SearchHistory {
  String get id => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  DateTime get searchTime => throw _privateConstructorUsedError;
  int? get resultCount => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;

  /// Serializes this SearchHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchHistoryCopyWith<SearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHistoryCopyWith<$Res> {
  factory $SearchHistoryCopyWith(
          SearchHistory value, $Res Function(SearchHistory) then) =
      _$SearchHistoryCopyWithImpl<$Res, SearchHistory>;
  @useResult
  $Res call(
      {String id,
      String query,
      DateTime searchTime,
      int? resultCount,
      String? accountId});
}

/// @nodoc
class _$SearchHistoryCopyWithImpl<$Res, $Val extends SearchHistory>
    implements $SearchHistoryCopyWith<$Res> {
  _$SearchHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? query = null,
    Object? searchTime = null,
    Object? resultCount = freezed,
    Object? accountId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchTime: null == searchTime
          ? _value.searchTime
          : searchTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resultCount: freezed == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchHistoryImplCopyWith<$Res>
    implements $SearchHistoryCopyWith<$Res> {
  factory _$$SearchHistoryImplCopyWith(
          _$SearchHistoryImpl value, $Res Function(_$SearchHistoryImpl) then) =
      __$$SearchHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String query,
      DateTime searchTime,
      int? resultCount,
      String? accountId});
}

/// @nodoc
class __$$SearchHistoryImplCopyWithImpl<$Res>
    extends _$SearchHistoryCopyWithImpl<$Res, _$SearchHistoryImpl>
    implements _$$SearchHistoryImplCopyWith<$Res> {
  __$$SearchHistoryImplCopyWithImpl(
      _$SearchHistoryImpl _value, $Res Function(_$SearchHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? query = null,
    Object? searchTime = null,
    Object? resultCount = freezed,
    Object? accountId = freezed,
  }) {
    return _then(_$SearchHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchTime: null == searchTime
          ? _value.searchTime
          : searchTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resultCount: freezed == resultCount
          ? _value.resultCount
          : resultCount // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchHistoryImpl implements _SearchHistory {
  const _$SearchHistoryImpl(
      {required this.id,
      required this.query,
      required this.searchTime,
      this.resultCount,
      this.accountId});

  factory _$SearchHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String query;
  @override
  final DateTime searchTime;
  @override
  final int? resultCount;
  @override
  final String? accountId;

  @override
  String toString() {
    return 'SearchHistory(id: $id, query: $query, searchTime: $searchTime, resultCount: $resultCount, accountId: $accountId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.searchTime, searchTime) ||
                other.searchTime == searchTime) &&
            (identical(other.resultCount, resultCount) ||
                other.resultCount == resultCount) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, query, searchTime, resultCount, accountId);

  /// Create a copy of SearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHistoryImplCopyWith<_$SearchHistoryImpl> get copyWith =>
      __$$SearchHistoryImplCopyWithImpl<_$SearchHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchHistoryImplToJson(
      this,
    );
  }
}

abstract class _SearchHistory implements SearchHistory {
  const factory _SearchHistory(
      {required final String id,
      required final String query,
      required final DateTime searchTime,
      final int? resultCount,
      final String? accountId}) = _$SearchHistoryImpl;

  factory _SearchHistory.fromJson(Map<String, dynamic> json) =
      _$SearchHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get query;
  @override
  DateTime get searchTime;
  @override
  int? get resultCount;
  @override
  String? get accountId;

  /// Create a copy of SearchHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchHistoryImplCopyWith<_$SearchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
