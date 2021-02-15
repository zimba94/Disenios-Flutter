import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Titulo(),
      // body: _ListaTareas(),
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList(),
          )
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: RaisedButton(
        onPressed: () {},
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      _ListItem('Orange', Color(0xffF08F66)),
      _ListItem('Family', Color(0xffF2A38A)),
      _ListItem('Subscriptions', Color(0xffF7CDD5)),
      _ListItem('Books', Color(0xffFCEBAF)),
      _ListItem('Orange', Color(0xffF08F66)),
      _ListItem('Family', Color(0xffF2A38A)),
      _ListItem('Subscriptions', Color(0xffF7CDD5)),
      _ListItem('Books', Color(0xffFCEBAF)),
    ];
    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.green,
        //   title: Text("Zimba"),
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
              minheight: 200,
              maxheight: 250,
              child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: _Titulo())),
        ),
        SliverList(
          delegate: SliverChildListDelegate([...items, SizedBox(height: 100)]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {@required this.minheight,
      @required this.maxheight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (minheight > maxheight) ? minheight : maxheight;

  @override
  // TODO: implement minExtent
  double get minExtent => (minheight < maxheight) ? minheight : maxheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              "New",
              style: TextStyle(color: Colors.orange[700], fontSize: 50),
            )),
        Stack(
          children: [
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text(
                "List",
                style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.titulo,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: this.color, borderRadius: BorderRadius.circular(30)),
    );
  }
}
