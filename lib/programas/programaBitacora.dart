import 'Programa.dart';
import 'package:dam_u4_proyecto1_19400657/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ProgramaBitacoras extends StatefulWidget {
  const ProgramaBitacoras({Key? key}) : super(key: key);

  @override
  State<ProgramaBitacoras> createState() => _ProgramaBitacorasState();
}

class _ProgramaBitacorasState extends State<ProgramaBitacoras> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: FutureBuilder(
        
          future: getBitacoras(),
          builder: ((context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      //=============================================================================================
                      showDialog(context: context, builder: (builder){
                        return AlertDialog(
                          title: Text("ATENCIÓN"),
                          content: Text("¿Que quieres hacer con esta Bitacora?"),
                          actions: [
                            TextButton(onPressed: () async{
                              await Navigator.pushNamed(context, '/editB', arguments: {
                                "fecha": snapshot.data?[index]['fecha'],
                                "evento": snapshot.data?[index]['evento'],
                                "recursos": snapshot.data?[index]['recursos'],
                                "verifico": snapshot.data?[index]['verifico'],
                                "fechaverificacion": snapshot.data?[index]['fechaverificacion'],
                                "idVehiculo": snapshot.data?[index]['idVehiculo'],
                                "id": snapshot.data?[index]['id'],
                              });
                              setState(() { });
                            }, child: const Text("ACTUALIZAR")),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("NADA")),
                          ],
                        );
                      });
                      //=============================================================================================
                    },
                    child: ListTile(
                      title: Text(snapshot.data?[index]['evento'] + ' - ' + snapshot.data?[index]['idVehiculo']),
                      subtitle: Text(snapshot.data?[index]['id']),
                      trailing: Text(snapshot.data?[index]['verifico']),
                    ),
                  );
                },);
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        await Navigator.pushNamed(context, '/addB').then((value) {
          setState(() {
            ProgramaBitacoras();
          });
        },);
      },child: Icon(Icons.add), backgroundColor: Colors.blue,),
    );
  }
}
