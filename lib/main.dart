import 'package:evaluacion_01/navigation/Drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicios());
}

class Ejercicios extends StatelessWidget {
  const Ejercicios({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VENTANA PRINCIPAL'),
      actions: [IconButton(onPressed: ()=>mensajeAutor(context), icon: Icon(Icons.animation_rounded))],
      ),
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("assets/img/spider.jpg"),
            fit: BoxFit.cover
          ),
        ),
        
     ),
     
     drawer: MiDrawer(),
     
    );
  }
}

void mensajeAutor(context){
  showDialog(context: context, builder: (context)=>
  AlertDialog(
    title: Text('TITULO: Ejercicios de Programación'),
    content: Text('PROGRMADOR: Emilio Chacha\n' 
            'CARRERA: Desarrollo de Software'),
  )
  );
}