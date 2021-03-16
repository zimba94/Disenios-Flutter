import 'package:disenios_app/src/labs/slideshow_page.dart';
import 'package:disenios_app/src/models/layout_model.dart';
import 'package:disenios_app/src/routes/routes.dart';
import 'package:disenios_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Diseños en Flutter - Tablet"),
          backgroundColor: appTheme.currentTheme.accentColor,
        ),
        drawer: _MenuPrincipal(),
        body: Row(
          children: [
            Container(
              width: 300,
              height: double.infinity,
              child: _ListaOpciones(),
            ),
            Container(
              width: 1,
              height: double.infinity,
              color: (appTheme.darkTheme)
                  ? Colors.grey
                  : appTheme.currentTheme.accentColor,
            ),
            Expanded(child: layoutModel.currentPage)
          ],
        ));
    // body: _ListaOpciones());
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: pagesRoutes.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(pagesRoutes[index].icon, color: appTheme.accentColor),
        title: Text(pagesRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => pagesRoutes[index].page));
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage = pagesRoutes[index].page;
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: Container(
          child: Column(
        children: [
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 150,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: Text(
                  'ZC',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          Expanded(
            child: _ListaOpciones(),
          ),
          ListTile(
            leading: Icon(
              Icons.lightbulb_outline,
              color: accentColor,
            ),
            title: Text("Dark Mode"),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                }),
          ),
          SafeArea(
            bottom: true,
            top: false,
            left: false,
            right: false,
            child: ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: accentColor,
              ),
              title: Text("Custom Theme"),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
                  onChanged: (value) {
                    appTheme.custoTheme = value;
                  }),
            ),
          )
        ],
      )),
    );
  }
}
