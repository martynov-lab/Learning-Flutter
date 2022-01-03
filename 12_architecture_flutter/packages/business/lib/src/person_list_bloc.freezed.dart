// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'person_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PersonListEventTearOff {
  const _$PersonListEventTearOff();

  PersonLoadedEvent loaded() {
    return const PersonLoadedEvent();
  }
}

/// @nodoc
const $PersonListEvent = _$PersonListEventTearOff();

/// @nodoc
mixin _$PersonListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonLoadedEvent value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PersonLoadedEvent value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonLoadedEvent value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonListEventCopyWith<$Res> {
  factory $PersonListEventCopyWith(
          PersonListEvent value, $Res Function(PersonListEvent) then) =
      _$PersonListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PersonListEventCopyWithImpl<$Res>
    implements $PersonListEventCopyWith<$Res> {
  _$PersonListEventCopyWithImpl(this._value, this._then);

  final PersonListEvent _value;
  // ignore: unused_field
  final $Res Function(PersonListEvent) _then;
}

/// @nodoc
abstract class $PersonLoadedEventCopyWith<$Res> {
  factory $PersonLoadedEventCopyWith(
          PersonLoadedEvent value, $Res Function(PersonLoadedEvent) then) =
      _$PersonLoadedEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PersonLoadedEventCopyWithImpl<$Res>
    extends _$PersonListEventCopyWithImpl<$Res>
    implements $PersonLoadedEventCopyWith<$Res> {
  _$PersonLoadedEventCopyWithImpl(
      PersonLoadedEvent _value, $Res Function(PersonLoadedEvent) _then)
      : super(_value, (v) => _then(v as PersonLoadedEvent));

  @override
  PersonLoadedEvent get _value => super._value as PersonLoadedEvent;
}

/// @nodoc

class _$PersonLoadedEvent implements PersonLoadedEvent {
  const _$PersonLoadedEvent();

  @override
  String toString() {
    return 'PersonListEvent.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PersonLoadedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loaded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PersonLoadedEvent value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PersonLoadedEvent value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PersonLoadedEvent value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PersonLoadedEvent implements PersonListEvent {
  const factory PersonLoadedEvent() = _$PersonLoadedEvent;
}

/// @nodoc
class _$PersonStateTearOff {
  const _$PersonStateTearOff();

  _PersonEmpty empty() {
    return const _PersonEmpty();
  }

  _PersonLoading loading() {
    return const _PersonLoading();
  }

  _PersonLoaded loaded({required List<PersonModel> personsList}) {
    return _PersonLoaded(
      personsList: personsList,
    );
  }

  _PersonError error() {
    return const _PersonError();
  }
}

/// @nodoc
const $PersonState = _$PersonStateTearOff();

/// @nodoc
mixin _$PersonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<PersonModel> personsList) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PersonEmpty value) empty,
    required TResult Function(_PersonLoading value) loading,
    required TResult Function(_PersonLoaded value) loaded,
    required TResult Function(_PersonError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonStateCopyWith<$Res> {
  factory $PersonStateCopyWith(
          PersonState value, $Res Function(PersonState) then) =
      _$PersonStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PersonStateCopyWithImpl<$Res> implements $PersonStateCopyWith<$Res> {
  _$PersonStateCopyWithImpl(this._value, this._then);

  final PersonState _value;
  // ignore: unused_field
  final $Res Function(PersonState) _then;
}

/// @nodoc
abstract class _$PersonEmptyCopyWith<$Res> {
  factory _$PersonEmptyCopyWith(
          _PersonEmpty value, $Res Function(_PersonEmpty) then) =
      __$PersonEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$PersonEmptyCopyWithImpl<$Res> extends _$PersonStateCopyWithImpl<$Res>
    implements _$PersonEmptyCopyWith<$Res> {
  __$PersonEmptyCopyWithImpl(
      _PersonEmpty _value, $Res Function(_PersonEmpty) _then)
      : super(_value, (v) => _then(v as _PersonEmpty));

  @override
  _PersonEmpty get _value => super._value as _PersonEmpty;
}

/// @nodoc

class _$_PersonEmpty implements _PersonEmpty {
  const _$_PersonEmpty();

  @override
  String toString() {
    return 'PersonState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PersonEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<PersonModel> personsList) loaded,
    required TResult Function() error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PersonEmpty value) empty,
    required TResult Function(_PersonLoading value) loading,
    required TResult Function(_PersonLoaded value) loaded,
    required TResult Function(_PersonError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _PersonEmpty implements PersonState {
  const factory _PersonEmpty() = _$_PersonEmpty;
}

/// @nodoc
abstract class _$PersonLoadingCopyWith<$Res> {
  factory _$PersonLoadingCopyWith(
          _PersonLoading value, $Res Function(_PersonLoading) then) =
      __$PersonLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$PersonLoadingCopyWithImpl<$Res> extends _$PersonStateCopyWithImpl<$Res>
    implements _$PersonLoadingCopyWith<$Res> {
  __$PersonLoadingCopyWithImpl(
      _PersonLoading _value, $Res Function(_PersonLoading) _then)
      : super(_value, (v) => _then(v as _PersonLoading));

  @override
  _PersonLoading get _value => super._value as _PersonLoading;
}

/// @nodoc

class _$_PersonLoading implements _PersonLoading {
  const _$_PersonLoading();

  @override
  String toString() {
    return 'PersonState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PersonLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<PersonModel> personsList) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PersonEmpty value) empty,
    required TResult Function(_PersonLoading value) loading,
    required TResult Function(_PersonLoaded value) loaded,
    required TResult Function(_PersonError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _PersonLoading implements PersonState {
  const factory _PersonLoading() = _$_PersonLoading;
}

/// @nodoc
abstract class _$PersonLoadedCopyWith<$Res> {
  factory _$PersonLoadedCopyWith(
          _PersonLoaded value, $Res Function(_PersonLoaded) then) =
      __$PersonLoadedCopyWithImpl<$Res>;
  $Res call({List<PersonModel> personsList});
}

/// @nodoc
class __$PersonLoadedCopyWithImpl<$Res> extends _$PersonStateCopyWithImpl<$Res>
    implements _$PersonLoadedCopyWith<$Res> {
  __$PersonLoadedCopyWithImpl(
      _PersonLoaded _value, $Res Function(_PersonLoaded) _then)
      : super(_value, (v) => _then(v as _PersonLoaded));

  @override
  _PersonLoaded get _value => super._value as _PersonLoaded;

  @override
  $Res call({
    Object? personsList = freezed,
  }) {
    return _then(_PersonLoaded(
      personsList: personsList == freezed
          ? _value.personsList
          : personsList // ignore: cast_nullable_to_non_nullable
              as List<PersonModel>,
    ));
  }
}

/// @nodoc

class _$_PersonLoaded implements _PersonLoaded {
  const _$_PersonLoaded({required this.personsList});

  @override
  final List<PersonModel> personsList;

  @override
  String toString() {
    return 'PersonState.loaded(personsList: $personsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PersonLoaded &&
            const DeepCollectionEquality()
                .equals(other.personsList, personsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(personsList));

  @JsonKey(ignore: true)
  @override
  _$PersonLoadedCopyWith<_PersonLoaded> get copyWith =>
      __$PersonLoadedCopyWithImpl<_PersonLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<PersonModel> personsList) loaded,
    required TResult Function() error,
  }) {
    return loaded(personsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
  }) {
    return loaded?.call(personsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(personsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PersonEmpty value) empty,
    required TResult Function(_PersonLoading value) loading,
    required TResult Function(_PersonLoaded value) loaded,
    required TResult Function(_PersonError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _PersonLoaded implements PersonState {
  const factory _PersonLoaded({required List<PersonModel> personsList}) =
      _$_PersonLoaded;

  List<PersonModel> get personsList;
  @JsonKey(ignore: true)
  _$PersonLoadedCopyWith<_PersonLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PersonErrorCopyWith<$Res> {
  factory _$PersonErrorCopyWith(
          _PersonError value, $Res Function(_PersonError) then) =
      __$PersonErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$PersonErrorCopyWithImpl<$Res> extends _$PersonStateCopyWithImpl<$Res>
    implements _$PersonErrorCopyWith<$Res> {
  __$PersonErrorCopyWithImpl(
      _PersonError _value, $Res Function(_PersonError) _then)
      : super(_value, (v) => _then(v as _PersonError));

  @override
  _PersonError get _value => super._value as _PersonError;
}

/// @nodoc

class _$_PersonError implements _PersonError {
  const _$_PersonError();

  @override
  String toString() {
    return 'PersonState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PersonError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<PersonModel> personsList) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<PersonModel> personsList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PersonEmpty value) empty,
    required TResult Function(_PersonLoading value) loading,
    required TResult Function(_PersonLoaded value) loaded,
    required TResult Function(_PersonError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PersonEmpty value)? empty,
    TResult Function(_PersonLoading value)? loading,
    TResult Function(_PersonLoaded value)? loaded,
    TResult Function(_PersonError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _PersonError implements PersonState {
  const factory _PersonError() = _$_PersonError;
}
