import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRedondo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )

      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();

    //Propiedades

    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //fill=relleno stroke= contorno
    lapiz.strokeWidth = 15;

    final path = new Path();

    //Dibujar con el path y con el lápiz

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
      
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}



class HeaderTriangular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();

    //Propiedades

    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //fill=relleno stroke= contorno
    lapiz.strokeWidth = 15;

    final path = new Path();

    //Dibujar con el path y con el lápiz

    //path.moveTo(0,0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
      
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}




class HeaderPico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();

    //Propiedades

    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //fill=relleno stroke= contorno
    lapiz.strokeWidth = 15;

    final path = new Path();

    //Dibujar con el path y con el lápiz

    path.lineTo(0,size.height * 0.20);
    path.lineTo(size.width * 0.5 , size.height * 0.30);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    //path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
      
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}


class HeaderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();

    //Propiedades

    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //fill=relleno stroke= contorno
    lapiz.strokeWidth = 15;

    final path = new Path();

    //Dibujar con el path y con el lápiz

    path.lineTo(0,size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40 ,size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
      
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}



class HeaderWaves extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = new Paint();

    //Propiedades

    lapiz.color = Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; //fill=relleno stroke= contorno
    lapiz.strokeWidth = 15;

    final path = new Path();

    //Dibujar con el path y con el lápiz

    path.lineTo(0,size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.40 ,size.width * 0.5, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20 ,size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
      
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}


class HeaderGradiente extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderGradientePainter(),
      ),
    );
  }
}

class _HeaderGradientePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(0.0, 55.0),
      radius: 180
    );
    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      stops: [
        0.2,
        0.5,
        1.0
      ]
    );

    final lapiz = new Paint()..shader = gradiente.createShader(rect);

    //Propiedades

    //lapiz.color = Color(0xff615AAB);
    //lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; //fill=relleno stroke= contorno
    lapiz.strokeWidth = 15;

    final path = new Path();

    //Dibujar con el path y con el lápiz

    path.lineTo(0,size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.40 ,size.width * 0.5, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20 ,size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
      
  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}