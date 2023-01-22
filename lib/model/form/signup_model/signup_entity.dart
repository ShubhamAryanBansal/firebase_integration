

import 'package:freezed_annotation/freezed_annotation.dart';

import '../field.dart';
part 'signup_entity.freezed.dart';


@freezed
class SignUpEntity with _$SignUpEntity{

  const SignUpEntity._();

  const factory SignUpEntity({
    required Field name,
    required Field email,
    required Field password,
    required bool buttonState
  }) = _SignUpEntity;

  factory SignUpEntity.empty() => const SignUpEntity(name: Field(value: ''),
      email: Field(value: ''), password: Field(value: 'value'),buttonState: false);

  bool get isValid => name.isValid && email.isValid && password.isValid;

}
