

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pingo_learn_assignment/model/form/signup_model/signup_entity.dart';

part 'signup_form.freezed.dart';

@freezed
class SignupForm with _$SignupForm {
  const factory SignupForm(SignUpEntity formState) = _SignupForm;
}







