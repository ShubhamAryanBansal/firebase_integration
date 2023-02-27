// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupForm {
  SignUpEntity get formState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupFormCopyWith<SignupForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupFormCopyWith<$Res> {
  factory $SignupFormCopyWith(
          SignupForm value, $Res Function(SignupForm) then) =
      _$SignupFormCopyWithImpl<$Res, SignupForm>;
  @useResult
  $Res call({SignUpEntity formState});

  $SignUpEntityCopyWith<$Res> get formState;
}

/// @nodoc
class _$SignupFormCopyWithImpl<$Res, $Val extends SignupForm>
    implements $SignupFormCopyWith<$Res> {
  _$SignupFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formState = null,
  }) {
    return _then(_value.copyWith(
      formState: null == formState
          ? _value.formState
          : formState // ignore: cast_nullable_to_non_nullable
              as SignUpEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SignUpEntityCopyWith<$Res> get formState {
    return $SignUpEntityCopyWith<$Res>(_value.formState, (value) {
      return _then(_value.copyWith(formState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SignupFormCopyWith<$Res>
    implements $SignupFormCopyWith<$Res> {
  factory _$$_SignupFormCopyWith(
          _$_SignupForm value, $Res Function(_$_SignupForm) then) =
      __$$_SignupFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignUpEntity formState});

  @override
  $SignUpEntityCopyWith<$Res> get formState;
}

/// @nodoc
class __$$_SignupFormCopyWithImpl<$Res>
    extends _$SignupFormCopyWithImpl<$Res, _$_SignupForm>
    implements _$$_SignupFormCopyWith<$Res> {
  __$$_SignupFormCopyWithImpl(
      _$_SignupForm _value, $Res Function(_$_SignupForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formState = null,
  }) {
    return _then(_$_SignupForm(
      null == formState
          ? _value.formState
          : formState // ignore: cast_nullable_to_non_nullable
              as SignUpEntity,
    ));
  }
}

/// @nodoc

class _$_SignupForm implements _SignupForm {
  const _$_SignupForm(this.formState);

  @override
  final SignUpEntity formState;

  @override
  String toString() {
    return 'SignupForm(formState: $formState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupForm &&
            (identical(other.formState, formState) ||
                other.formState == formState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupFormCopyWith<_$_SignupForm> get copyWith =>
      __$$_SignupFormCopyWithImpl<_$_SignupForm>(this, _$identity);
}

abstract class _SignupForm implements SignupForm {
  const factory _SignupForm(final SignUpEntity formState) = _$_SignupForm;

  @override
  SignUpEntity get formState;
  @override
  @JsonKey(ignore: true)
  _$$_SignupFormCopyWith<_$_SignupForm> get copyWith =>
      throw _privateConstructorUsedError;
}
