// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownCategoria extends StatelessWidget {
  TextEditingController controller;
  String? selectedValue;

  DropdownCategoria({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        // customButton: const Icon(
        //   Icons.list_sharp,
        //   size: 46,
        //   color: Colors.red,
        // ),
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        customItemsIndexes: const [5],
        customItemsHeight: 8,
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        value: selectedValue,
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);

          selectedValue = value.text;
          print(selectedValue);

          this.controller.text = "Jared";
          print(controller.value);
        },
        itemHeight: 48,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 160,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.redAccent,
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [
    Transport,
    Eventual,
    Alimentacion,
    Servicios,
    Carro
  ];

  static const Transport = MenuItem(text: 'Trasporte', icon: Icons.bus_alert);
  static const Eventual = MenuItem(text: 'Eventual', icon: Icons.warning_sharp);
  static const Alimentacion =
      MenuItem(text: 'Alimentacion', icon: Icons.food_bank);
  static const Servicios = MenuItem(text: 'Servicios', icon: Icons.checklist);
  static const Carro = MenuItem(text: 'carro', icon: Icons.car_crash);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 12,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.Transport:

        //Do something
        break;
      case MenuItems.Eventual:
        //Do something
        break;
      case MenuItems.Alimentacion:
        //Do something
        break;
      case MenuItems.Servicios:
        //Do something
        break;
      case MenuItems.Carro:
        //Do something
        break;
    }
  }
}
