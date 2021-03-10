import 'package:disenios_app/src/theme/theme.dart';
import 'package:disenios_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Scaffold(
        body: (appTheme.darkTheme)
            ? HeaderGradiente()
            : HeaderWaves(color: accentColor));
  }
}
