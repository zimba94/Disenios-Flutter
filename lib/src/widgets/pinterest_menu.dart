import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu(
      {this.mostrar = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.blueAccent,
      this.inactiveColor = Colors.blueGrey,
      @required this.items});

  // final List<PinterestButton> items = [
  //   PinterestButton(
  //       onPressed: () => {print("Icon pie_chart pressed")},
  //       icon: Icons.pie_chart),
  //   PinterestButton(
  //       onPressed: () => {print("Icon serach pressed")}, icon: Icons.search),
  //   PinterestButton(
  //       onPressed: () => {print("Icon notifications pressed")},
  //       icon: Icons.notifications),
  //   PinterestButton(
  //       onPressed: () => {print("Icon user pressed")},
  //       icon: Icons.supervised_user_circle)
  // ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 250),
          opacity: (mostrar) ? 1 : 0,
          child: Builder(builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            return _PinterestMenuBackground(child: _MenuItems(items));
          }),
        ));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black45, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length, (i) => _PinterestMenuButton(i, menuItems[i])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final activeColor = Provider.of<_MenuModel>(context).activeColor;
    final inactiveColor = Provider.of<_MenuModel>(context).inactiveColor;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 32 : 25,
          color: (itemSeleccionado == index) ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;
  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.blueAccent;
  Color _inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color color) {
    this._backgroundColor = color;
    notifyListeners();
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color color) {
    this._activeColor = color;
    notifyListeners();
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color color) {
    this._inactiveColor = color;
    notifyListeners();
  }
}
