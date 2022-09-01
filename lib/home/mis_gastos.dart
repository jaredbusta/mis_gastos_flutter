import 'package:flutter/material.dart';
import 'package:mis_gastos/User/ui/screen/profile_header.dart';
import 'package:mis_gastos/combustible/ui/screens/lista_combustible.dart';
import 'package:mis_gastos/gastos/views/lista_gastos.dart';
import 'package:mis_gastos/ingresos/views/ingreso_list.dart';
import 'home.dart';

class MisGastos extends StatefulWidget {
  const MisGastos({Key? key}) : super(key: key);

  @override
  State<MisGastos> createState() => _MisGastosState();
}

class _MisGastosState extends State<MisGastos> {
  int indexTab = 0;

  // lista de tabs
  final List<Widget> widgetsChildren = [
    const Home(),
    IngresoList(),
    ListaGastos(),
    ListaCombustible(),
    ProfileHeader()
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widgetsChildren[indexTab],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey,
            primaryColor: Colors.purple,
          ),
          child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTab,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money_rounded), label: "ingresos"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.money_off), label: "gastos"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.car_repair,
                  ),
                  label: "cargas"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "perfil")
            ],
          ),
        ));
  }
}
