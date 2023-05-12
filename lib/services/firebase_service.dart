import 'package:cloud_firestore/cloud_firestore.dart';
import 'Bitacora.dart';
import 'Vehiculo.dart';

FirebaseFirestore db = FirebaseFirestore.instance; //Hacer una instancia de FirebaseFirestore (la bd)

//Future que nos va regresar una lista de los datos que se tengan en la base
Future<List> getVehiculos() async{
  List vehiculos = [];

  CollectionReference coleccionVehiculos = db.collection('vehiculos');

  QuerySnapshot queryVehiculo = await coleccionVehiculos.get();


  for(var doc in queryVehiculo.docs){
    
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final vehiculo = {
      "placa": data['placa'],
      "tipo": data['tipo'],
      "numeroserie": data['numeroserie'],
      "combustible": data['combustible'],
      "tanque": data['tanque'],
      "trabajador": data['trabajador'],
      "depto": data['depto'],
      "resguardadopor": data['resguardadopor'],
      "id": doc.id,
    };
    vehiculos.add(vehiculo);
  }
  return vehiculos;
}

Future<void> addVehiculo(Vehiculo v) async{
  await db.collection('vehiculos').add(v.toMap());
}

Future<void> updateVehiculo(String id, Vehiculo v) async{
  await db.collection('vehiculos').doc(id).set(v.toMap());
}

Future<void> deleteVehiculo(String id) async{
  await db.collection('vehiculos').doc(id).delete();
}







//==================================================================================================
Future<List> getBitacoras() async{
  List bitacoras = [];

  CollectionReference colBitacora = db.collection('bitacora');
  QuerySnapshot queryBitacora = await colBitacora.get();

  for(var doc in queryBitacora.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final bitacora = {
      "fecha": data['fecha'],
      "evento": data['evento'],
      "recursos": data['recursos'],
      "verifico": data['verifico'],
      "fechaverificacion": data['fechaverificacion'],
      "idVehiculo": data['idVehiculo'],
      "id": doc.id,
    };
    bitacoras.add(bitacora);
  }
  return bitacoras;
}

Future<void> addBitacora(Bitacora b) async{
  await db.collection('bitacora').add(b.toMap());
}

Future<void> updateBitacora(String id, Bitacora b) async{
  await db.collection('bitacora').doc(id).set(b.toMap());
}

Future<void> deleteBitacora(String id) async{
  await db.collection('bitacora').doc(id).delete();
}

