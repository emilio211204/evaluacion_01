import 'package:evaluacion_01/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text("Presión Arterial Media"),
      ),
      drawer: MiDrawer(),
      body: Column(
        children: [
          Text('Cálculo PAM', style: TextStyle(fontSize: 30)),
          Container(height: 20),
          ingresoDatos(),
          Container(height: 20),
          btnCalcular(context),
        ],
      ),
    );
  }
}

TextEditingController sistolicaController = TextEditingController();
TextEditingController diastolicaController = TextEditingController();

Widget ingresoDatos() {
  return Column(
    children: [
      TextField(
        controller: sistolicaController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Presión sistólica (mmHg)'
        ),
      ),
      Container(height: 10),
      TextField(
        controller: diastolicaController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Presión diastólica (mmHg)'
        ),
      ),
    ],
  );
}

Widget btnCalcular(context) {
  return ElevatedButton(
    onPressed: () => calcularPam(context),
    child: Text('Calcular PAM'),
  );
}

void calcularPam(context) {
  double sistolica = double.parse(sistolicaController.text) ;
  double diastolica = double.parse(diastolicaController.text) ;

  if (sistolica < diastolica) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('La sistólica debe ser mayor que la diastólica'),
      ),
    );
  } else {
    double pam = diastolica + (sistolica - diastolica) / 3;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Resultado'),
        content: Text('PAM: ${pam.toStringAsFixed(1)} mmHg'),
      ),
    );
  }
}

