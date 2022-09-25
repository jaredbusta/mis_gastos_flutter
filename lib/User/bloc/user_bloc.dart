// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:mis_gastos/User/model/user_model.dart';
import 'package:mis_gastos/User/repository/cloud_firestore_repository.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import 'package:mis_gastos/gastos/repository/demo_repository_gastos.dart';
import 'package:mis_gastos/gastos/repository/gastos_cloud_firestore_repository.dart';
import 'package:mis_gastos/gastos/widget/gasto_card.dart';
import 'package:mis_gastos/ingresos/model/ingreso_model.dart';
import 'package:mis_gastos/ingresos/repository/ingreso_repository.dart';

import '../repository/auth_repository.dart';

class UserBloc extends Bloc {
  final _auth_repository = AuthRepository();
  // uso de Stream
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  // Stream<User?> get authStatus => streamFirebase;

  Stream<UserModel> get authStatus {
    return FirebaseAuth.instance.authStateChanges().map((user) {
      return UserModel(
          uid: user!.uid,
          email: user.email,
          nombre: user.displayName,
          photoUrl: user.photoURL);
    });
  }

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
  final _ingresoRepository = IngresoRepository();

  final _demoRepositoryGasto = DemoRepositoryGastos();
  void updateUserDataFirestore(UserModel user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  // guarda gastos del usuario
  Future<void> updateGastoData(GastoModel gasto) =>
      _cloudFirestoreRepositoryGastos.updateGastoDataFirestore(gasto);

// funcions demo antes de limpiar
  void getMisGastosStream(start, end, category) {
    // FirebaseFirestore.instance
    //     .collection("gastos")
    //     .where("fecha", isGreaterThanOrEqualTo: start)
    //     .where("fecha", isLessThanOrEqualTo: end)
    //     // .where("owner", isEqualTo: "users/${user!.uid}")
    //     // .where("owner", isEqualTo: FirebaseFirestore.instance.doc("users/${user!.uid}"))
    //     .orderBy("fecha", descending: true).

    // indice de fecha en proceso de generar
    var data = FirebaseFirestore.instance
        .collection("gastos")
        .where("owner", isEqualTo: "users/L5mzpTMBr2RgwgNLw7473lvZiS63")
        .where("categoria", isEqualTo: category)
        .where("fecha", isGreaterThanOrEqualTo: start)
        .where("fecha", isLessThanOrEqualTo: end)
        .get()
        .then((value) {});
  }

  List<GastoCard> listaGastos(List<DocumentSnapshot> gastosSnapshot) =>
      _cloudFirestoreRepositoryGastos.buildMyGastosCard(gastosSnapshot);

  Stream<QuerySnapshot> getMisGastos(start, end, category) =>
      _cloudFirestoreRepositoryGastos.getMisGastos(start, end, category);

  Future<void> nuevoIngreso(IngresoModel ingreso) =>
      _ingresoRepository.nuevoIngreso(ingreso);

  Stream<QuerySnapshot> getMisIngresos(start, end) =>
      _ingresoRepository.getMisIngresos(start, end);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
