


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_learn_assignment/features/authentication/data/datasource/firebase_impl.dart';

final authRepoProvider = Provider<AuthRepo>((ref) => AuthRepo(ref.read));

class AuthRepo{

  final Reader _read;

  AuthRepo(this._read);

  Future<bool> createUser({required String name, required String email, required String password}) async{
    final result = await _read(firebaseProvider).createUser(name: name, email: email, password: password);
    return result;
  }

  Future<bool> loginUser({required String email, required String password}) async{
    final result = await _read(firebaseProvider).loginUser(email: email, password: password);
    return result;
  }

  Future<String> getRemoteConfig() async{
    final countryCode = await _read(firebaseProvider).getRemoteConfig();
    return countryCode;
  }

}