

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pingo_learn_assignment/model/form/login_model/login_entity.dart';

part 'login_form.freezed.dart';

@freezed
class LoginForm with _$LoginForm {
  const factory LoginForm(LoginEntity formState) = _LoginForm;
}







