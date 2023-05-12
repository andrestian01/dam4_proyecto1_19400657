import 'programaBitacora.dart';
import 'package:flutter/material.dart';

import 'programa.dart';

class Navegador extends StatefulWidget {
  const Navegador({Key? key}) : super(key: key);

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador> {
  int _indice = 0;

  void _cambiarIndice(int indice){
    setState(() {
      _indice = indice;
    });
  }

  final List<Widget> _paginas = [
    ProgramaVehiculos(),
    ProgramaBitacoras(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CocheTec", style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.car_repair), label: "Vehiculos"),
          BottomNavigationBarItem(icon: Icon(Icons.event_note_sharp), label: "Bitacoras"),
          BottomNavigationBarItem(icon: Icon(Icons.sticky_note_2_outlined), label: "Consultas"),
        ],
        showUnselectedLabels: false,
        iconSize: 35,
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _indice,
        onTap: _cambiarIndice,
      ),
    );
  }
}
