import 'package:evaluacion_01/navigation/Drawer.dart';
import 'package:flutter/material.dart';

class Ejercicio3 extends StatelessWidget {
  const Ejercicio3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dividir Cuenta')),
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
        keyboardType: TextInputType.numberWithOptions(decimal: true),
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
      Text('¿Agregar propina?'),
      Container(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              conPropina = true;
            },
            child: Text('Sí'),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              conPropina = false;
            },
            child: Text('No'),
          ),
        ],
      ),
      if (conPropina)
        TextField(
          controller: propinaController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
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
  try {
    if (totalController.text.isEmpty || personasController.text.isEmpty) {
      throw Exception('Por favor ingrese el total y el número de personas');
    }

    double total = double.parse(totalController.text);
    int personas = int.parse(personasController.text);
    
    if (total <= 0 || personas <= 0) {
      throw Exception('El total y el número de personas deben ser mayores a 0');
    }

    double propina = 0;

    if (conPropina && propinaController.text.isNotEmpty) {
      double porcentajePropina = double.parse(propinaController.text);
      if (porcentajePropina < 0) {
        throw Exception('El porcentaje de propina no puede ser negativo');
      }
      propina = total * (porcentajePropina / 100);
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
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(e.toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}