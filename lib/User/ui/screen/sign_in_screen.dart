import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/User/model/user_model.dart';
import 'package:mis_gastos/home/mis_gastos.dart';
import 'package:mis_gastos/screens/gradient_back.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mis_gastos/screens/widgets/button_color.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserBloc blocUser;

  @override
  Widget build(BuildContext context) {
    blocUser = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: blocUser.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // snapshot contiene el objeto user
        if (!snapshot.hasData) {
          return singInGoogleUi();
        } else {
          return MisGastos();
        }
      },
    );
  }

  Widget singInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(
              title: "",
              height: double.infinity,
              color1: "#3B4CEF",
              color2: "#222FA5"),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Welcome\nAqui vamos a prevenir el desbordamiento de texto",
                style: TextStyle(
                    fontSize: 37,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
            ButtonColor(
                height: 50,
                width: double.infinity,
                text: "login con Google",
                textColor: "#000000",
                color1: "#AFFF71",
                color2: "#73F211",
                onPressed: () {
                  blocUser.signOut();
                  blocUser.signIn().then((UserCredential user) => {
                        blocUser.updateUserDataFirestore(UserModel(
                            uid: user.user!.uid,
                            nombre: user.user!.displayName ?? "",
                            email: user.user!.email ?? "",
                            photoUrl: user.user!.photoURL ?? ""))
                      });
                }),
          ])
        ],
      ),
    );
  }
}
