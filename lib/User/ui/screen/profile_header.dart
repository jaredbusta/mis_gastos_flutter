import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:mis_gastos/User/bloc/user_bloc.dart';
import 'package:mis_gastos/User/model/user_model.dart';
import 'package:mis_gastos/screens/widgets/Circule_button.dart';
import 'package:mis_gastos/screens/widgets/button_color.dart';
import 'package:mis_gastos/utils/util.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'user_info_card.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatefulWidget {
  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  late UserBloc blocUser;
  late TextEditingController qrTextController = TextEditingController();
  final key = GlobalKey<FormState>();
  late UserModel user_model;
  late var digest;

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
    var key = utf8.encode('jared');
    var string = "este es un texto encriptado con [salt:jared]";
    var bytes = utf8.encode(string);
    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    digest = hmacSha256.convert(bytes);
    var b64 = base64.encode(digest.bytes);
    print(b64);

    // print("HMAC digest as bytes: ${digest.bytes}");
    // print("HMAC digest as hex string: $digest");

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

  Widget form() {
    return Form(
        child: Column(
      children: [
        Text("aqui va el texto que va a formar el QR..."),
        Form(
          key: key,
          child: TextFormField(
            controller: qrTextController,
            decoration: InputDecoration(labelText: "texto a encriptar"),
            onSaved: (val) {
              // qrTextController = val!;
            },
            validator: (val) {
              if (val!.isEmpty) {
                return "El concepto es requerido";
              }
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonColor(
            width: MediaQuery.of(context).size.width,
            height: 50,
            text: "Genera QR",
            color1: "#CACACACA",
            color2: "#BFBFBFBF",
            onPressed: () {
              if (key.currentState!.validate()) {
                key.currentState!.save();
                print(qrTextController.text);
                var res =
                    Util.encode(text: qrTextController.text, seed: "jared");
                digest = res;
              }
            },
            textColor: "#000000"),
      ],
    ));
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
      return ListView(
        children: [
          Container(
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
                SizedBox(
                  height: 20,
                ),
                form(),

                SizedBox(
                  height: 20,
                ),
                QrImage(
                  data: "$digest",
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                  embeddedImage: AssetImage('assets/img/la_siesta.jpg'),
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(80, 80),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
                Text("$digest"),
                // CirculeButton(true, Icons.screen_share, 32, Util.color("#000000"),
                //     onPressed: screen_shot, iconColor: Util.color("#BACABA"))
              ],
            ),
          ),
        ],
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

  void screen_shot() {
    print("hola que tal");
  }
}
