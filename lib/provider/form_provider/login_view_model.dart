
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_learn_assignment/model/form/login_model/login_form.dart';
import 'package:pingo_learn_assignment/repository/firebase_repo/firebase_repository_impl.dart';
import 'package:pingo_learn_assignment/widgets/toast.dart';

import '../../model/form/field.dart';
import '../../model/form/login_model/login_entity.dart';
final loginFormProvider = StateNotifierProvider.autoDispose<LoginFormProvider, LoginForm>((ref) {
  return LoginFormProvider(ref.read);
});


class LoginFormProvider extends StateNotifier<LoginForm> {

  Reader read;
  late LoginEntity _form;

  LoginFormProvider(this.read) : super(LoginForm(LoginEntity.empty()));
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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

  toggleButtonState(bool newState){
    state = state.copyWith(formState: _form.copyWith(buttonState: newState));
  }


  Future<bool> loginUser({required final String email, required final String password}) async{

    toggleButtonState(true);
    final result = await read(firebaseRepositoryProvider).loginUser(email: email, password: password);
    toggleButtonState(false);
    return result;

  }

}

