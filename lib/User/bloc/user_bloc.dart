import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/model/user_model.dart';
import 'package:mis_gastos/User/repository/cloud_firestore_repository.dart';
import 'package:mis_gastos/gastos/repository/gastos_cloud_firestore_repository.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';

import '../repository/auth_repository.dart';

class UserBloc extends Bloc {
  final _auth_repository = AuthRepository();
  // uso de Stream
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streamFirebase;

  // Casos de uso del objeto user
  //1.- signIn Google
  Future<UserCredential> signIn() {
    return _auth_repository.signFirebase();
  }

  void signOut() {
    _auth_repository.signOutFirebase();
  }

  //2. Registrar usuario en BD
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  final _cloudFirestoreRepositoryGastos = GastosCloudFirestoreRepository();
  void updateUserDataFirestore(UserModel user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  // guarda gastos del usuario
  Future<void> updateGastoData(GastoModel gasto) =>
      _cloudFirestoreRepositoryGastos.updateGastoDataFirestore(gasto);
  Future<void> getMisGastos() => _cloudFirestoreRepositoryGastos.getMisGastos();

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
