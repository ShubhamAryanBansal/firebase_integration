import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app_utils/utils.dart';
import '../../../../custom_shared_widgets/toast.dart';
import '../../../../network/exception.dart';
import 'firebase.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';


final firebaseProvider = Provider<FirebaseDataSource>((ref) => FirebaseDataSourceImpl(ref.read,FirebaseAuth.instance,FirebaseRemoteConfig.instance));

class FirebaseDataSourceImpl implements FirebaseDataSource{

  final Reader read;
  final FirebaseAuth _firebaseAuth;
  final FirebaseRemoteConfig _remoteConfig;

  FirebaseDataSourceImpl(this.read,this._firebaseAuth,this._remoteConfig);


  @override
  Future<bool> createUser({required String name, required String email, required String password}) async{

    try{

      if(!await AppUtils.checkInternetConnection()){
        showToast('Looks like your Internet Connection isn' 't there!',warning: true,centerGravity: true);
        return false;
      }

      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).timeout(const Duration(seconds: 10),onTimeout: (){throw Exception();});
      final docUser = FirebaseFirestore.instance.collection('user').doc();
      Map<String,dynamic> json = {
        'name' : name,
        'email' : email
      };
      await docUser.set(json);
      showToast('Sign Up Successful! $name',centerGravity: true,warning: false);
      return true;
    } on FirebaseAuthException catch (e, stacktrace) {
      print('*******FirebaseAuthException : ${e.toString()}');
      //print(stacktrace);

      if(e.code == 'email-already-in-use'){
        showToast('Already an account exists with this email!',warning: true,centerGravity: true);
        return false;
      }else if(e.code == 'invalid-email'){
        showToast('Oops! Entered email is invalid',warning: true,centerGravity: true);
        return false;
      }else if(e.code == 'weak-password'){
        showToast('Please Enter Strong Password!',warning: true,centerGravity: true);
        return false;
      }

      showToast('Something went wrong!',warning: true,centerGravity: true);
      return false;
    } on Exception catch(e, stacktrace){
      print('*****signupExc : ${e.toString()}');
      //print(stacktrace);
      showToast('Something went wrong! Please try again later',warning: true,centerGravity: true);
      return false;
    }
  }

  @override
  Future<bool> loginUser({required String email, required String password}) async{

    try {

      if(!await AppUtils.checkInternetConnection()){
        showToast('Looks like your Internet Connection isn' 't there!',warning: true,centerGravity: true);
        return false;
      }

      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password,).timeout(const Duration(seconds: 10),onTimeout: (){throw Exception();});
      showToast('Welcome bud!',warning: false);
      return true;
    } on FirebaseAuthException catch (e, stacktrace) {
      print('*******FirebaseAuthException : ${e.code} | $e');
      //print(stacktrace);

      if(e.code == 'wrong-password'){
        showToast('Password Entered is invalid!',warning: true,centerGravity: true);
        return false;
      }else if(e.code == 'user-not-found'){
        showToast('Oops! No User Found',warning: true,centerGravity: true);
        return false;
      }else if(e.code == 'invalid-email'){
        showToast('Email Entered  is invalid!',warning: true,centerGravity: true);
        return false;
      }else if(e.code == 'user-disabled'){
        showToast('Oops! Your user has been disabled',warning: true,centerGravity: true);
        return false;
      }

      showToast('Something went wrong!',warning: true,centerGravity: true);
      return false;
    } on Exception catch(e, stacktrace){
      print('*******signupExc : ${e.toString()}');
      //print(stacktrace);
      showToast('Something went wrong! Please try again later',warning: true,centerGravity: true);
      return false;
    }
  }


  @override
  Future<String> getRemoteConfig() async{

    try{

      if(!await AppUtils.checkInternetConnection()){
        throw DataException.customException('noInternet');
      }

      ///Remote configuration can be set according to the requirement
      _remoteConfig.setConfigSettings(RemoteConfigSettings(fetchTimeout: const Duration(seconds: 10), minimumFetchInterval: const Duration(minutes: 1)));
      await _remoteConfig.fetchAndActivate();

      return _remoteConfig.getString('countryCode');

    }on Exception catch(e,stacktrace){
      print('******remoteConfigExc ${e.toString()}');
      print(stacktrace);
      rethrow;
    }
  }



}