
import 'package:evaluacion_01/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dividir Cuenta'),),
      drawer: MiDrawer(),
          body: Column(
        children: [
          Text('División de cuenta', style: TextStyle(fontSize: 30)),
          Container(height: 20),
          ingresoDatos(),
          Container(height: 20),
          btnCalcular(context),
        ],
      ),
    );
  }
}

TextEditingController totalController = TextEditingController();
TextEditingController personasController = TextEditingController();
TextEditingController propinaController = TextEditingController();
bool conPropina = false;

Widget ingresoDatos() {
  return Column(
    children: [
      TextField(
        controller: totalController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Total de la cuenta'
        ),
      ),
      Container(height: 10),
      TextField(
        controller: personasController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Número de personas'
        ),
      ),
      Container(height: 10),
      Row(
        children: [
          Text('¿Agregar propina?'),
          Switch(
            value: conPropina,
            onChanged: (value) {
              conPropina = value;
            },
          ),
        ],
      ),
      if (conPropina)
        TextField(
          controller: propinaController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Porcentaje de propina'
          ),
        ),
    ],
  );
}

Widget btnCalcular(context) {
  return ElevatedButton(
    onPressed: () => calcularDivision(context),
    child: Text('Calcular'),
  );
}

void calcularDivision(context) {
  double total = double.parse(totalController.text);
  int personas = int.parse(personasController.text);
  double propina = 0;

  if (conPropina) {
    propina = total * (double.parse(propinaController.text) / 100);
  }

  double totalConPropina = total + propina;
  double porPersona = totalConPropina / personas;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Resultado'),
      content: Text(
        conPropina
          ? 'Total con propina: \$${totalConPropina.toStringAsFixed(2)}\n'
            'Cada persona paga: \$${porPersona.toStringAsFixed(2)}'
          : 'Cada persona paga: \$${porPersona.toStringAsFixed(2)}',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    ),
  );
}
