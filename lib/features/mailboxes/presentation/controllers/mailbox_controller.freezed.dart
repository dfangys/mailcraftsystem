// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mailbox_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MailboxState {
  bool get isLoading => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  List<Mailbox> get mailboxes => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;
  Mailbox? get selectedMailbox => throw _privateConstructorUsedError;

  /// Create a copy of MailboxState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MailboxStateCopyWith<MailboxState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailboxStateCopyWith<$Res> {
  factory $MailboxStateCopyWith(
          MailboxState value, $Res Function(MailboxState) then) =
      _$MailboxStateCopyWithImpl<$Res, MailboxState>;
  @useResult
  $Res call(
      {bool isLoading,
      Failure? failure,
      List<Mailbox> mailboxes,
      List<Message> messages,
      Mailbox? selectedMailbox});

  $FailureCopyWith<$Res>? get failure;
  $MailboxCopyWith<$Res>? get selectedMailbox;
}

/// @nodoc
class _$MailboxStateCopyWithImpl<$Res, $Val extends MailboxState>
    implements $MailboxStateCopyWith<$Res> {
  _$MailboxStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MailboxState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failure = freezed,
    Object? mailboxes = null,
    Object? messages = null,
    Object? selectedMailbox = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      mailboxes: null == mailboxes
          ? _value.mailboxes
          : mailboxes // ignore: cast_nullable_to_non_nullable
              as List<Mailbox>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      selectedMailbox: freezed == selectedMailbox
          ? _value.selectedMailbox
          : selectedMailbox // ignore: cast_nullable_to_non_nullable
              as Mailbox?,
    ) as $Val);
  }

  /// Create a copy of MailboxState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get failure {
    if (_value.failure == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.failure!, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }

  /// Create a copy of MailboxState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MailboxCopyWith<$Res>? get selectedMailbox {
    if (_value.selectedMailbox == null) {
      return null;
    }

    return $MailboxCopyWith<$Res>(_value.selectedMailbox!, (value) {
      return _then(_value.copyWith(selectedMailbox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MailboxStateImplCopyWith<$Res>
    implements $MailboxStateCopyWith<$Res> {
  factory _$$MailboxStateImplCopyWith(
          _$MailboxStateImpl value, $Res Function(_$MailboxStateImpl) then) =
      __$$MailboxStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Failure? failure,
      List<Mailbox> mailboxes,
      List<Message> messages,
      Mailbox? selectedMailbox});

  @override
  $FailureCopyWith<$Res>? get failure;
  @override
  $MailboxCopyWith<$Res>? get selectedMailbox;
}

/// @nodoc
class __$$MailboxStateImplCopyWithImpl<$Res>
    extends _$MailboxStateCopyWithImpl<$Res, _$MailboxStateImpl>
    implements _$$MailboxStateImplCopyWith<$Res> {
  __$$MailboxStateImplCopyWithImpl(
      _$MailboxStateImpl _value, $Res Function(_$MailboxStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MailboxState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failure = freezed,
    Object? mailboxes = null,
    Object? messages = null,
    Object? selectedMailbox = freezed,
  }) {
    return _then(_$MailboxStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      mailboxes: null == mailboxes
          ? _value._mailboxes
          : mailboxes // ignore: cast_nullable_to_non_nullable
              as List<Mailbox>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      selectedMailbox: freezed == selectedMailbox
          ? _value.selectedMailbox
          : selectedMailbox // ignore: cast_nullable_to_non_nullable
              as Mailbox?,
    ));
  }
}

/// @nodoc

class _$MailboxStateImpl implements _MailboxState {
  const _$MailboxStateImpl(
      {this.isLoading = true,
      this.failure,
      final List<Mailbox> mailboxes = const [],
      final List<Message> messages = const [],
      this.selectedMailbox})
      : _mailboxes = mailboxes,
        _messages = messages;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Failure? failure;
  final List<Mailbox> _mailboxes;
  @override
  @JsonKey()
  List<Mailbox> get mailboxes {
    if (_mailboxes is EqualUnmodifiableListView) return _mailboxes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mailboxes);
  }

  final List<Message> _messages;
  @override
  @JsonKey()
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final Mailbox? selectedMailbox;

  @override
  String toString() {
    return 'MailboxState(isLoading: $isLoading, failure: $failure, mailboxes: $mailboxes, messages: $messages, selectedMailbox: $selectedMailbox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MailboxStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality()
                .equals(other._mailboxes, _mailboxes) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.selectedMailbox, selectedMailbox) ||
                other.selectedMailbox == selectedMailbox));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      failure,
      const DeepCollectionEquality().hash(_mailboxes),
      const DeepCollectionEquality().hash(_messages),
      selectedMailbox);

  /// Create a copy of MailboxState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MailboxStateImplCopyWith<_$MailboxStateImpl> get copyWith =>
      __$$MailboxStateImplCopyWithImpl<_$MailboxStateImpl>(this, _$identity);
}

abstract class _MailboxState implements MailboxState {
  const factory _MailboxState(
      {final bool isLoading,
      final Failure? failure,
      final List<Mailbox> mailboxes,
      final List<Message> messages,
      final Mailbox? selectedMailbox}) = _$MailboxStateImpl;

  @override
  bool get isLoading;
  @override
  Failure? get failure;
  @override
  List<Mailbox> get mailboxes;
  @override
  List<Message> get messages;
  @override
  Mailbox? get selectedMailbox;

  /// Create a copy of MailboxState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MailboxStateImplCopyWith<_$MailboxStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
