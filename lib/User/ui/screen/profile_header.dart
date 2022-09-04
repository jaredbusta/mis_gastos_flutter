import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/User/model/user_model.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/utils/util.dart';
import 'user_info_card.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatefulWidget {
  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late UserBloc blocUser;

  late UserModel user_model;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
    streamFirebase.listen((user) {
      print("${user?.uid}");
      setState(() {
        user_model = UserModel(
            nombre: user?.displayName,
            email: user?.email,
            photoUrl: user?.photoURL);
        print(user_model.nombre);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of(context);
    // print(user_model.toString());
    // print(user_model?.nombre ?? "todavia no carga el usuario");
    // return _handleCurrentSession();

    return StreamBuilder(
        stream: blocUser.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(blocUser.authStatus);
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return showProfileData(snapshot);
            case ConnectionState.done:
              return showProfileData(snapshot);
          }
        });
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: blocUser.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // snapshot contiene el objeto user
        if (!snapshot.hasData) {
          return loadingData();
        } else {
          return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("El usuario no está logueado");
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la información, Haz login")
          ],
        ),
      );
    } else {
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfoCard(user: user_model),
            CirculeButton(
              false,
              Icons.exit_to_app,
              32,
              Util.color("#FF6464"),
              iconColor: Util.color("#202020"),
              onPressed: () {
                blocUser.signOut();
              },
            ),
            // ButtonsBar()
          ],
        ),
      );
    }
  }

  Widget loadingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Esperando data"),
        SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(),
        ElevatedButton(
            onPressed: () {
              blocUser.signOut();
            },
            child: Text("SingOUT bais"))
      ],
    );
  }
}
