import 'package:evaluacion_01/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Energía Cinética"),
      ),
      drawer: MiDrawer(),
      body: Column(
        children: [
          Text('Cálculo de Energía', style: TextStyle(fontSize: 30)),
          Container(height: 20),
          ingresoDatos(),
          Container(height: 20),
          btnCalcular(context),
        ],
      ),
    );
  }
}

TextEditingController masaController = TextEditingController();
TextEditingController velocidadController = TextEditingController();

Widget ingresoDatos() {
  return Column(
    children: [
      TextField(
        controller: masaController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Masa (kg)'
        ),
      ),
      Container(height: 10),
      TextField(
        controller: velocidadController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Velocidad (m/s)'
        ),
      ),
    ],
  );
}

Widget btnCalcular(context) {
  return ElevatedButton(
    onPressed: () => calcularEnergia(context),
    child: Text('Calcular Energía'),
  );
}

void calcularEnergia(context) {
  double masa = double.parse(masaController.text);
  double velocidad = double.parse(velocidadController.text);

  if (velocidad == 0) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Resultado'),
        content: Text('El objeto está en reposo (energía = 0)'),
      ),
    );
  } else {
    double energia = 0.5 * masa * (velocidad * velocidad);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Resultado'),
        content: Text('Energía cinética: ${energia.toStringAsFixed(2)}'),
      ),
    );
  }
}