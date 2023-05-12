import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_u4_proyecto1_19400657/services/Bitacora.dart';
import 'package:flutter/material.dart';

import '../services/firebase_service.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CapturaBitacora extends StatefulWidget {
  const CapturaBitacora({Key? key}) : super(key: key);

  @override
  State<CapturaBitacora> createState() => _CapturaBitacoraState();
}

class _CapturaBitacoraState extends State<CapturaBitacora> {
  final fechaController = TextEditingController();
  final eventoController = TextEditingController();
  final recursosController = TextEditingController();
  final verificoController = TextEditingController();
  final fechaverificacionController = TextEditingController();
  final idVehiculoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Capturar Bitacora", style: TextStyle(color: Colors.white, fontSize: 29, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.orange, centerTitle: true,),
        body: ListView(
          padding: EdgeInsets.all(30),
          children: [
            TextField(
              decoration: InputDecoration(labelText: "FECHA"),
              controller: fechaController, autofocus: true,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(labelText: "EVENTO"),
              controller: eventoController,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(labelText: "RECURSOS"),
              controller: recursosController,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(labelText: "VERIFICO"),
              controller: verificoController,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(labelText: "FECHA DE VERIFICACIÓN"),
              controller: fechaverificacionController,
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(labelText: "ID DEL VEHICULO"),
              controller: idVehiculoController,
            ),
            SizedBox(height: 10,),

            FilledButton(onPressed: () async{
              Bitacora bit = Bitacora(
                  fecha: fechaController.text,
                  evento: eventoController.text,
                  recursos: recursosController.text,
                  verifico: verificoController.text,
                  fechaverificacion: fechaverificacionController.text,
                  idVehiculo: idVehiculoController.text
              );

              await addBitacora(bit).then((_){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("SE INSERTÓ!"))
                );
                Navigator.pop(context);
              });


            }, child: const Text("Guardar"))
          ],
        )
    );
  }
}