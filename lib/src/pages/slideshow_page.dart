import 'package:flutter/material.dart';
import 'package:disenios_app/src/widgets/slideshow.dart';
//mport 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: MiSlideshow()),
        Expanded(child: MiSlideshow())
      ],
    ));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 18,
      bulletSecundario: 11,
      //dotsTop: true,
      colorPrimario: Colors.red,
      colorSecundario: Colors.purple,
      slides: [
        // SvgPicture.asset('assets/svgs/slide-1.svg'),
        // SvgPicture.asset('assets/svgs/slide-2.svg'),
        // SvgPicture.asset('assets/svgs/slide-3.svg'),
        // SvgPicture.asset('assets/svgs/slide-4.svg'),
        // SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
