// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpEntity {
  Field get name => throw _privateConstructorUsedError;
  Field get email => throw _privateConstructorUsedError;
  Field get password => throw _privateConstructorUsedError;
  bool get buttonState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpEntityCopyWith<SignUpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEntityCopyWith<$Res> {
  factory $SignUpEntityCopyWith(
          SignUpEntity value, $Res Function(SignUpEntity) then) =
      _$SignUpEntityCopyWithImpl<$Res, SignUpEntity>;
  @useResult
  $Res call({Field name, Field email, Field password, bool buttonState});

  $FieldCopyWith<$Res> get name;
  $FieldCopyWith<$Res> get email;
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class _$SignUpEntityCopyWithImpl<$Res, $Val extends SignUpEntity>
    implements $SignUpEntityCopyWith<$Res> {
  _$SignUpEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? buttonState = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field,
      buttonState: null == buttonState
          ? _value.buttonState
          : buttonState // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get name {
    return $FieldCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get email {
    return $FieldCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<$Res> get password {
    return $FieldCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SignUpEntityCopyWith<$Res>
    implements $SignUpEntityCopyWith<$Res> {
  factory _$$_SignUpEntityCopyWith(
          _$_SignUpEntity value, $Res Function(_$_SignUpEntity) then) =
      __$$_SignUpEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Field name, Field email, Field password, bool buttonState});

  @override
  $FieldCopyWith<$Res> get name;
  @override
  $FieldCopyWith<$Res> get email;
  @override
  $FieldCopyWith<$Res> get password;
}

/// @nodoc
class __$$_SignUpEntityCopyWithImpl<$Res>
    extends _$SignUpEntityCopyWithImpl<$Res, _$_SignUpEntity>
    implements _$$_SignUpEntityCopyWith<$Res> {
  __$$_SignUpEntityCopyWithImpl(
      _$_SignUpEntity _value, $Res Function(_$_SignUpEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? buttonState = null,
  }) {
    return _then(_$_SignUpEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Field,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field,
      buttonState: null == buttonState
          ? _value.buttonState
          : buttonState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SignUpEntity extends _SignUpEntity {
  const _$_SignUpEntity(
      {required this.name,
      required this.email,
      required this.password,
      required this.buttonState})
      : super._();

  @override
  final Field name;
  @override
  final Field email;
  @override
  final Field password;
  @override
  final bool buttonState;

  @override
  String toString() {
    return 'SignUpEntity(name: $name, email: $email, password: $password, buttonState: $buttonState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.buttonState, buttonState) ||
                other.buttonState == buttonState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, password, buttonState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpEntityCopyWith<_$_SignUpEntity> get copyWith =>
      __$$_SignUpEntityCopyWithImpl<_$_SignUpEntity>(this, _$identity);
}

abstract class _SignUpEntity extends SignUpEntity {
  const factory _SignUpEntity(
      {required final Field name,
      required final Field email,
      required final Field password,
      required final bool buttonState}) = _$_SignUpEntity;
  const _SignUpEntity._() : super._();

  @override
  Field get name;
  @override
  Field get email;
  @override
  Field get password;
  @override
  bool get buttonState;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpEntityCopyWith<_$_SignUpEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
