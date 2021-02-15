import 'package:flutter/material.dart';
import 'package:disenios_app/src/pages/sliver_list_page.dart';
//import 'package:disenios_app/src/pages/emergency_page.dart';
//import 'package:disenios_app/src/pages/headers_page.dart';
//import 'src/pages/slideshow_page.dart';
// import 'package:disenios_app/src/pages/pinterest_page.dart';
// import 'package:disenios_app/src/pages/animaciones_page.dart';
// import 'src/labs/circular_progress_page.dart';
// import 'src/pages/gaficas_circulares_page.dart';
// import 'src/retos/cuadrado_animado_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Diseños APP",
      home: SliverListPage(),
    );
  }
}
