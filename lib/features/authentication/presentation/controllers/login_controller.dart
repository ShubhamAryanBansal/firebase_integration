

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_learn_assignment/features/authentication/data/auth_repo/auth_repo.dart';
import 'package:pingo_learn_assignment/features/authentication/data/datasource/firebase_impl.dart';
import '../../domain/entities/field.dart';
import '../../domain/entities/login_model/login_entity.dart';
import '../../domain/entities/login_model/login_form.dart';



final loginControllerProvider = StateNotifierProvider.autoDispose<LoginControllerProvider, LoginForm>((ref) {
  return LoginControllerProvider(ref.read);
});


class LoginControllerProvider extends StateNotifier<LoginForm> {

  Reader read;
  late LoginEntity _form;

  LoginControllerProvider(this.read) : super(LoginForm(LoginEntity.empty()));

  setEmail(String email){

    final isEmail = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);

    _form = state.formState.copyWith(email: Field(value: email));

    late Field emailField;

    if(isEmail){
      emailField = _form.email.copyWith(isValid: true, errorMessage: '');
    }else{
      emailField = _form.email.copyWith(isValid: false, errorMessage: 'Please Enter a valid Email');
    }

    state = state.copyWith(formState: _form.copyWith(email: emailField));

  }

  setPassword(String pass){

    _form = state.formState.copyWith(password: Field(value: pass));

    late Field password;

    if(pass.trim().length >= 10){
      password = _form.password.copyWith(isValid: true, errorMessage: '');
    }else{
      password = _form.password.copyWith(isValid: false, errorMessage: 'Please Enter a valid Password');
    }

    state = state.copyWith(formState: _form.copyWith(password: password));

  }

  ///Used for toggling button state to show loader instead of text inside button
  toggleButtonState(bool newState){
    state = state.copyWith(formState: _form.copyWith(buttonState: newState));
  }

  ///Calling firebase_repo for login
  Future<bool> loginUser({required final String email, required final String password}) async{

    toggleButtonState(true);
    final result = await read(authRepoProvider).loginUser(email: email, password: password);
    toggleButtonState(false);
    return result;

  }

}

