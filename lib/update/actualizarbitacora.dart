import 'package:dam_u4_proyecto1_19400657/services/vehiculo.dart';
import 'package:dam_u4_proyecto1_19400657/services/firebase_service.dart';
import 'package:flutter/material.dart';

import 'package:dam_u4_proyecto1_19400657/services/Bitacora.dart';

class EditarBitacora extends StatefulWidget {
  const EditarBitacora({Key? key}) : super(key: key);

  @override
  State<EditarBitacora> createState() => _EditarBitacoraState();
}

class _EditarBitacoraState extends State<EditarBitacora> {

  final fechaController = TextEditingController();
  final eventoController = TextEditingController();
  final recursosController = TextEditingController();
  final verificoController = TextEditingController();
  final fechaverificacionController = TextEditingController();
  final idVehiculoController = TextEditingController();
  final idB = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    fechaController.text = arguments['fecha'];
    eventoController.text = arguments['evento'];
    recursosController.text = arguments['recursos'];
    verificoController.text = arguments['verifico'];
    fechaverificacionController.text = arguments['fechaverificacion'].toString();
    idVehiculoController.text = arguments['idVehiculo'];
    idB.text = arguments['id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Actualizar Vehiculo", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          TextField(decoration: InputDecoration(labelText: "FECHA"),controller: fechaController),
          SizedBox(height: 10,),
          TextField(decoration: InputDecoration(labelText: "EVENTO"), controller: eventoController),
          SizedBox(height: 10,),
          TextField(decoration: InputDecoration(labelText: "RECURSOS"), controller: recursosController),
          SizedBox(height: 10,),
          TextField(decoration: InputDecoration(labelText: "VERIFICO"), controller: verificoController),
          SizedBox(height: 10,),
          TextField(decoration: InputDecoration(labelText: "FECHA VERIFICACION"), controller: fechaverificacionController),
          SizedBox(height: 10,),
          TextField(decoration: InputDecoration(labelText: "ID VEHICULO"), controller: idVehiculoController),
          SizedBox(height: 10,),

          FilledButton(onPressed: () async{
            Bitacora bit = Bitacora(
              fecha: fechaController.text,
              evento: eventoController.text,
              recursos: recursosController.text,
              verifico: verificoController.text,
              fechaverificacion: fechaverificacionController.text,
              idVehiculo: idVehiculoController.text,
            );

            await updateBitacora(arguments['id'], bit).then((value){
              Navigator.pop(context);
              Navigator.pop(context);
            });


          }, child: Text("Guardar Cambios")),
        ],
      ),

    );
  }
}
