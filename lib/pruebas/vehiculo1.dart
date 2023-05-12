import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Vehiculo {
  String? placa;
  String? tipo;
  String? numeroSerie;
  String? combustible;
  int? tanque;
  String? trabajador;
  String? depto;
  String? resguardadoPor;
  List<Bitacora> bitacoras;

  Vehiculo({
    this.placa,
    this.tipo,
    this.numeroSerie,
    this.combustible,
    this.tanque,
    this.trabajador,
    this.depto,
    this.resguardadoPor,
    this.bitacoras = const [],
  });
}

class Bitacora {
  DateTime? fecha;
  String? evento;
  String? recursos;
  String? verifico;
  DateTime? fechaVerificacion;

  Bitacora({
    this.fecha,
    this.evento,
    this.recursos,
    this.verifico,
    this.fechaVerificacion,
  });
}
class VehiculoService {
  final CollectionReference vehiculos =
  FirebaseFirestore.instance.collection('vehiculos');

  Future<void> crearVehiculo(Vehiculo vehiculo) async {
    await vehiculos.add({
      'placa': vehiculo.placa,
      'tipo': vehiculo.tipo,
      'numeroSerie': vehiculo.numeroSerie,
      'combustible': vehiculo.combustible,
      'tanque': vehiculo.tanque,
      'trabajador': vehiculo.trabajador,
      'depto': vehiculo.depto,
      'resguardadoPor': vehiculo.resguardadoPor,
      'bitacoras': vehiculo.bitacoras
          .map((bitacora) => {
        'fecha': bitacora.fecha,
        'evento': bitacora.evento,
        'recursos': bitacora.recursos,
        'verifico': bitacora.verifico,
        'fechaVerificacion': bitacora.fechaVerificacion,
      })
          .toList(),
    });
  }

  Future<void> actualizarVehiculo(String id, Vehiculo vehiculo) async {
    await vehiculos.doc(id).update({
        'placa': vehiculo.placa,
        'tipo': vehiculo.tipo,
        'numeroSerie': vehiculo.numeroSerie,
        'combustible': vehiculo.combustible,
        'tanque': vehiculo.tanque,
        'trabajador': vehiculo.trabajador,
      'depto': vehiculo.depto,
      'resguardadoPor': vehiculo.resguardadoPor,
      'bitacoras': vehiculo.bitacoras
          .map((bitacora) => {
        'fecha': bitacora.fecha,
        'evento': bitacora.evento,
        'recursos': bitacora.recursos,
        'verifico': bitacora.verifico,
        'fechaVerificacion': bitacora.fechaVerificacion,
      })
          .toList(),
    });
  }

  Future<void> eliminarVehiculo(String id) async {
    await vehiculos.doc(id).delete();
  }


    Stream<List<Vehiculo>> obtenerVehiculos() {
      return vehiculos.snapshots().map((snapshot) =>
          snapshot.docs.map((document) => Vehiculo.fromFirestore(document.data(), document.id)).toList()
      );
    }


}

class Vehiculo {
  String id;
  String placa;
  String tipo;
  String numeroSerie;
  String combustible;
  int tanque;
  String trabajador;
  String depto;
  String resguardadoPor;
  List<Bitacora> bitacoras;

  Vehiculo({
    this.id,
    this.placa,
    this.tipo,
    this.numeroSerie,
    this.combustible,
    this.tanque,
    this.trabajador,
    this.depto,
    this.resguardadoPor,
    this.bitacoras,
  });

  factory Vehiculo.fromFirestore(Map<String, dynamic> data, String id) {
    return Vehiculo(
      id: id,
      placa: data['placa'],
      tipo: data['tipo'],
      numeroSerie: data['numeroSerie'],
      combustible: data['combustible'],
      tanque: data['tanque'],
      trabajador: data['trabajador'],
      depto: data['depto'],
      resguardadoPor: data['resguardadoPor'],
      bitacoras: List<Bitacora>.from(
        data['bitacoras'].map((bitacora) => Bitacora.fromFirestore(bitacora)),
      ),
    );
  }
}

class Bitacora {
  DateTime fecha;
  String evento;
  String recursos;
  String verifico;
  DateTime fechaVerificacion;

  Bitacora({
    this.fecha,
    this.evento,
    this.recursos,
    this.verifico,
    this.fechaVerificacion,
  });

  factory Bitacora.fromFirestore(Map<String, dynamic> data) {
    return Bitacora(
      fecha: data['fecha'].toDate(),
      evento: data['evento'],
      recursos: data['recursos'],
      verifico: data['verifico'],
      fechaVerificacion: data['fechaVerificacion'] != null
          ? data['fechaVerificacion'].toDate()
          : null,
    );
  }
}
