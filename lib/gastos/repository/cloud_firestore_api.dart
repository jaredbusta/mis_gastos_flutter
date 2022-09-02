import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mis_gastos/gastos/model/gasto_model.dart';
import '../../User/repository/cloud_firestore_api.dart';

class CloudFirestoreApi {
  final String GASTO_TABLE = "gastos"; // collection
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> updateGastoDataFirestore(GastoModel gasto) async {
    // DocumentReference ref = this._db.collection(GASTO_TABLE).doc(gasto.uid);
    DocumentReference ref = this._db.collection(GASTO_TABLE).doc();
    // user repository
    CloudFirestoreAPI userRepositoryFirestore = new CloudFirestoreAPI();

    var user = _auth.currentUser;
    if (user != null) {
      await ref.set({
        ...gasto.toMap(),
        "owner": "${userRepositoryFirestore.USERS}/${user.uid}"
      });
    } else {
      print("No hay usuario logeado ...");
    }
  }

  Future<List<GastoModel>> getMisGastos() async {
    // QuerySnapshot data = await this._db.collection("gastos").get();
    // var _data = data.docs.map((docs) => docs.data()).toList();
    // print(_data);

    // var start = DateTime(2022, 9, 1);
    // var end = DateTime(2022, 9, 2);
    // print(start);
    // print(end);

    List<GastoModel> gastos = [];
    try {
      final docRef = this._db.collection("gastos").doc();
      docRef.get().then((value) {
        final data = value.data() as Map<String, dynamic>;
        print(data);
      }, onError: (e) => print(e));
    } catch (e) {
      print(e);
    }
    return gastos;
  }
}
