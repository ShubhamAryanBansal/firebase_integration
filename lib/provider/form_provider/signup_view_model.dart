
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_learn_assignment/repository/firebase_repo/firebase_repository_impl.dart';

import '../../model/form/field.dart';
import '../../model/form/signup_model/signup_entity.dart';
import '../../model/form/signup_model/signup_form.dart';
import '../../widgets/toast.dart';

final signupFormProvider = StateNotifierProvider.autoDispose<SignupFormProvider, SignupForm>((ref) {
  return SignupFormProvider(ref.read);
});


class SignupFormProvider extends StateNotifier<SignupForm> {

  Reader read;
  late SignUpEntity _form;

  SignupFormProvider(this.read) : super(SignupForm(SignUpEntity.empty()));


  setName(String name){

    _form = state.formState.copyWith(name: Field(value: name));

    late Field nameField;

    if(name.trim().isNotEmpty){
      nameField = _form.name.copyWith(isValid: true, errorMessage: '');
    }else{
      nameField = _form.name.copyWith(isValid: false, errorMessage: 'Please Enter valid Name');
    }

    state = state.copyWith(formState: _form.copyWith(name: nameField));
  }


  setEmail(String email){

    final isEmail = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);

    _form = state.formState.copyWith(email: Field(value: email));

    late Field emailField;

    if(isEmail){
      emailField = _form.email.copyWith(isValid: true, errorMessage: '');
    }else{
      emailField = _form.email.copyWith(isValid: false, errorMessage: 'Please Enter valid Email');
    }

    state = state.copyWith(formState: _form.copyWith(email: emailField));

  }

  setPassword(String pass){

    _form = state.formState.copyWith(password: Field(value: pass));

    late Field password;

    if(pass.trim().length >= 10){
      password = _form.password.copyWith(isValid: true, errorMessage: '');
    }else{
      password = _form.password.copyWith(isValid: false, errorMessage: 'Please Enter valid Password');
    }

    state = state.copyWith(formState: _form.copyWith(password: password));

  }

  ///Used for toggling button state to show loader instead of text inside button
  toggleButtonState(bool newState){
    state = state.copyWith(formState: _form.copyWith(buttonState: newState));
  }

  ///Calling firebase_repo for signup
  Future<bool> signupUser({required final String name, required final String email, required final String password}) async{

    toggleButtonState(true);
    bool result = await read(firebaseRepositoryProvider).createUser(name: name, email: email, password: password);
    toggleButtonState(false);
    return result;
  }

}

