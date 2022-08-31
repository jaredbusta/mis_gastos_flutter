import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/User/model/user_model.dart';
import 'package:mis_gastos/User/ui/screen/user_info.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/utils/util.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
  late UserBloc blocUser;
  late UserModel user;
  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: blocUser.streamFirebase,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return showProfileData(snapshot);
            case ConnectionState.done:
              return showProfileData(snapshot);
          }
        });
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
      print("Logeado");
      print(snapshot.data.displayName);
      print(snapshot.data.email);
      print(snapshot.data.photoURL);
      // print(snapshot.data.photoURL);
      user = UserModel(
          nombre: snapshot.data.displayName,
          email: snapshot.data.email,
          photoUrl: snapshot.data.photoURL);
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
            UserInfo(
              user: user,
            ),
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
}
