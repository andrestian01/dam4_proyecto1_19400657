import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Vehicle {
  final String? id;
  final String? placa;
  final String? tipo;
  final String? numeroserial;
  final String? combustible;
  final int? tanque;
  final String? trabajador;
  final String? depto;
  final String? guardedBy;

  Vehicle({
    this.id,
    this.placa,
    this.tipo,
    this.numeroserial,
    this.combustible,
    this.tanque,
    this.trabajador,
    this.depto,
    this.guardedBy,
  });
}

class VehicleForm extends StatefulWidget {
  final Vehicle? vehicle;

  const VehicleForm({Key? key, this.vehicle}) : super(key: key);

  @override
  _VehicleFormState createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  final _formKey = GlobalKey<FormState>();
  final _placaController = TextEditingController();
  final _tipoController = TextEditingController();
  final _numeroserialController = TextEditingController();
  final _combustibleController = TextEditingController();
  final _tanqueController = TextEditingController();
  final _trabajadorController = TextEditingController();
  final _deptoController = TextEditingController();
  final _guardedByController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.vehicle != null) {
      _placaController.text = widget.vehicle!.placa ?? '';
      _tipoController.text = widget.vehicle!.tipo ?? '';
      _numeroserialController.text = widget.vehicle!.numeroserial ?? '';
      _combustibleController.text = widget.vehicle!.combustible ?? '';
      _tanqueController.text = widget.vehicle!.tanque?.toString() ?? '';
      _trabajadorController.text = widget.vehicle!.trabajador ?? '';
      _deptoController.text = widget.vehicle!.depto ?? '';
      _guardedByController.text = widget.vehicle!.guardedBy ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        widget.vehicle == null ? 'Agregar vehículo' : 'Editar vehículo',
    ),
    ),
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    TextFormField(
    controller: _placaController,
    decoration: InputDecoration(
    labelText: 'Placa',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'La placa es requerida';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _tipoController,
    decoration: InputDecoration(
    labelText: 'Tipo',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'El tipo es requerido';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _numeroserialController,
    decoration: InputDecoration(
    labelText: 'Número de serie',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'El número de serie es requerido';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _combustibleController,
    decoration: InputDecoration(
    labelText: 'Combustible',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
      return 'El tipo de combustible es requerido';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _trabajadorController,
    decoration: InputDecoration(
    labelText: 'Trabajador',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'El trabajador es requerido';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _deptoController,
    decoration: InputDecoration(
    labelText: 'Departamento',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'El departamento es requerido';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _guardedByController,
    decoration: InputDecoration(
    labelText: 'Guardado por',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'La persona responsable es requerida';
    }
    return null;
    },
    ),
    SizedBox(height: 16.0),
    ElevatedButton(
    onPressed: () async {
    if (_formKey.currentState!.validate()) {
    final vehicle = Vehicle(
    placa: _placaController.text,
    tipo: _tipoController.text,
    numeroserial: _numeroserialController.text,
    combustible: _combustibleController.text,
    tanque: int.tryParse(_tanqueController.text),
    trabajador: _trabajadorController.text,
    depto: _deptoController.text,
    guardedBy: _guardedByController.text,
    );
    await addOrUpdateVehicle(vehicle);
    Navigator.pop(context);
    }
    },
    child: Text('Guardar'),
    ),
    ],
    ),
    ),
    ),
    ),
    );
    }

    Future<void> addOrUpdateVehicle(Vehicle vehicle) async {
    final firebaseApp = await Firebase.initializeApp();
    final vehiclesCollection =
    FirebaseFirestore.instance.collection('vehicles');
    if (widget.vehicle == null) {
    await vehiclesCollection.add(vehicle.toJson());
    } else {
    await vehiclesCollection.doc(widget.vehicle!.id).update(vehicle.toJson());
    }
    }
  }
