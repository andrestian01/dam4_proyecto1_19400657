class Bitacora{
  String fecha;
  String evento;
  String recursos;
  String verifico;
  String fechaverificacion;
  String? id;
  String idVehiculo;

  Bitacora({
    required this.fecha,
    required this.evento,
    required this.recursos,
    required this.verifico,
    required this.fechaverificacion,
    required this.idVehiculo,
  });

  Map<String, dynamic> toMap(){
    return{
      'fecha': fecha,
      'evento': evento,
      'recursos': recursos,
      'verifico': verifico,
      'fechaverificacion': fechaverificacion,
      'idVehiculo': idVehiculo,
    };
  }

  @override
  String toString() {
    return 'Bitacora{fecha: $fecha, evento: $evento, recursos: $recursos, verifico: $verifico, fechaverificacion: $fechaverificacion}';
  }
}