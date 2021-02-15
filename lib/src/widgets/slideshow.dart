import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsTop;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const Slideshow(
      {Key key,
      @required this.slides,
      this.dotsTop = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12,
      this.bulletSecundario = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (BuildContext context) {
            Provider.of<_SlideshowModel>(context)._colorPrimario =
                this.colorPrimario;
            Provider.of<_SlideshowModel>(context)._colorSecundario =
                this.colorSecundario;
            Provider.of<_SlideshowModel>(context)._bulletPrimario =
                this.bulletPrimario;
            Provider.of<_SlideshowModel>(context)._bulletSecundario =
                this.bulletSecundario;
            return _CrearEstructuraSlide(dotsTop: dotsTop, slides: slides);
          },
        )),
      ),
    );
  }
}

class _CrearEstructuraSlide extends StatelessWidget {
  const _CrearEstructuraSlide({
    Key key,
    @required this.dotsTop,
    @required this.slides,
  }) : super(key: key);

  final bool dotsTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.dotsTop) (_Dots(this.slides.length)),
        Expanded(child: _Slides(this.slides)),
        if (!this.dotsTop) (_Dots(this.slides.length)),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlideshowModel>(context);
    double tamanio;
    Color color;

    if (slideShowModel.currentPage >= index - 0.5 &&
        slideShowModel.currentPage <= index + 0.5) {
      tamanio = slideShowModel._bulletPrimario;
      color = slideShowModel._colorPrimario;
    } else {
      tamanio = slideShowModel._bulletSecundario;
      color = slideShowModel._colorSecundario;
    }

    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: tamanio,
        height: tamanio,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 15;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color colorPrimario) {
    this._colorPrimario = colorPrimario;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color colorSecundario) {
    this._colorSecundario = colorSecundario;
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario(double bulletPrimario) {
    this._bulletPrimario = bulletPrimario;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario(double bulletSecundario) {
    this._bulletSecundario = bulletSecundario;
  }
}
