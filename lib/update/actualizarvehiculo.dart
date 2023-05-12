import 'package:dam_u4_proyecto1_19400657/services/Vehiculo.dart';
import 'package:dam_u4_proyecto1_19400657/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditarVehiculo extends StatefulWidget {
  const EditarVehiculo({Key? key}) : super(key: key);

  @override
  State<EditarVehiculo> createState() => _EditarVehiculoState();
}

class _EditarVehiculoState extends State<EditarVehiculo> {
  final placaController = TextEditingController();
  final tipoController = TextEditingController();
  final numeroserieController = TextEditingController();
  final combustibleController = TextEditingController();
  final tanqueController = TextEditingController();
  final trabajadorController = TextEditingController();
  final deptoController = TextEditingController();
  final resguardadoporController = TextEditingController();
  final idC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    placaController.text = arguments['placa'];
    tipoController.text = arguments['tipo'];
    numeroserieController.text = arguments['numeroserie'];
    combustibleController.text = arguments['combustible'];
    tanqueController.text = arguments['tanque'].toString();
    trabajadorController.text = arguments['trabajador'];
    deptoController.text = arguments['depto'];
    resguardadoporController.text = arguments['resguardadopor'];
    idC.text = arguments['id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Actualizar Vehiculo",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          TextField(
              decoration: InputDecoration(labelText: "PLACA"),
              controller: placaController),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(labelText: "TIPO"),
              controller: tipoController),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(labelText: "NUMERO SERIE"),
              controller: numeroserieController),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(labelText: "COMBUSTIBLE"),
              controller: combustibleController),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(labelText: "TANQUE"),
              controller: tanqueController),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(labelText: "TRABAJADOR"),
              controller: trabajadorController),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(labelText: "DEPARTAMENTO"),
              controller: deptoController),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(labelText: "RESGUARDADO POR"),
              controller: resguardadoporController),
          SizedBox(
            height: 10,
          ),
          FilledButton(
              onPressed: () async {
                Vehiculo car = Vehiculo(
                    placa: placaController.text,
                    tipo: tipoController.text,
                    numeroserie: numeroserieController.text,
                    combustible: combustibleController.text,
                    tanque: int.parse(tanqueController.text),
                    trabajador: trabajadorController.text,
                    depto: deptoController.text,
                    resguardadopor: resguardadoporController.text);

                await updateVehiculo(arguments['id'], car).then((value) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              },
              child: Text("Guardar Cambios")),
        ],
      ),
    );
  }
}
