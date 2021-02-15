import 'package:disenios_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  GraficasCircularesPage({Key key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
          
            porcentaje += 10;
            if (porcentaje > 100) {
              
              porcentaje = 0.0;
            }
            
          });

        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.red),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.green),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
            ],
          )      

        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    @required this.porcentaje, 
    @required this.color,
  }) ;

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      //color: Colors.red,
      child: RadialProgress( porcentaje: porcentaje, colorPrimario: this.color, colorSecundario: Colors.grey, grosorSecundario: 4.0,),
    );
  }
}