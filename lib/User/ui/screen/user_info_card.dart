import 'package:flutter/material.dart';
import 'package:mis_gastos/User/model/user_model.dart';

class UserInfoCard extends StatelessWidget {
  UserModel user;
  UserInfoCard({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    final user_photo = Container(
      width: 90,
      height: 90,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 2, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(user.photoUrl ?? ''))),
    );
    return Column(
      children: [user_photo, Text(user.nombre ?? ''), Text(user.email ?? '')],
    );
  }
}
