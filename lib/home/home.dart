import 'package:flutter/material.dart';

import 'app_header.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AppHeader(),
    ]);
  }
}
