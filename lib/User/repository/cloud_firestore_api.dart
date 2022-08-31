import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mis_gastos/User/model/user_model.dart';

class CloudFirestoreAPI {
  final String USERS = "users";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(UserModel user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return ref.set({...user.toMap(), 'lastSingin': DateTime.now()});
  }
}
