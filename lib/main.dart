import 'package:disenios_app/src/models/layout_model.dart';
import 'package:disenios_app/src/pages/launcher_page.dart';
import 'package:disenios_app/src/pages/launcher_tablet_page.dart';
import 'package:disenios_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:disenios_app/src/pages/sliver_list_page.dart';
//import 'package:disenios_app/src/pages/emergency_page.dart';
//import 'package:disenios_app/src/pages/headers_page.dart';
//import 'src/pages/slideshow_page.dart';
// import 'package:disenios_app/src/pages/pinterest_page.dart';
// import 'package:disenios_app/src/pages/animaciones_page.dart';
// import 'src/labs/circular_progress_page.dart';
// import 'src/pages/gaficas_circulares_page.dart';
// import 'src/retos/cuadrado_animado_page.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (_) => new ThemeChanger(2)),
      ChangeNotifierProvider<LayoutModel>(create: (_) => new LayoutModel()),
    ], child: MyApp()));

// void main() => runApp(
//     ChangeNotifierProvider(create: (_) => new ThemeChanger(2), child: MyApp()));

// void main() => runApp(ChangeNotifierProvider(
//       create: (_) => new LayoutModel(),
//       child: ChangeNotifierProvider(
//           create: (_) => new ThemeChanger(2), child: MyApp()),
//     ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: "Diseños APP",
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          // print("Orientation: ${orientation}");

          final screenSize = MediaQuery.of(context).size;

          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
