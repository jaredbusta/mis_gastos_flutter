import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mis_gastos/User/model/user_model.dart';
import 'package:mis_gastos/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserDataFirestore(UserModel user) =>
      _cloudFirestoreAPI.updateUserData(user);
}
