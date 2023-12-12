import 'package:flutter/material.dart';
import 'package:klinik_app/service/poli_service.dart';
import 'package:klinik_app/ui/poli_form_update.dart';
import 'package:klinik_app/ui/poli_page.dart';
import '../model/poli.dart';

class PoliDetailPage extends StatefulWidget {
  final Poli poli;

  const PoliDetailPage({super.key, required this.poli});

  @override
  State<PoliDetailPage> createState() => _PoliDetailPageState();
}

class _PoliDetailPageState extends State<PoliDetailPage> {
  Stream<Poli> getData() async* {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth; //untuk selain text
    // ignore: unused_local_variable
    double ffem = fem * 0.97; //untuk text

    return Scaffold(
      appBar: AppBar(title: Text("Detail Poli"),),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            if(snapshot.connectionState != ConnectionState.done){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(!snapshot.hasData && snapshot.connectionState == ConnectionState.done){
                  return Text("Data Tidak Ditemukan");
            }
            return Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Nama Poli : ${snapshot.data.namaPoli}",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [_tombolUbah(), _tombolhapus()],
                )
              ],
            );
        },
      )
    );
  }
  
  _tombolUbah(){
    return StreamBuilder(
      stream: getData(), 
      builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=>
                PoliUpdateForm(poli: snapshot.data)));
          },
          style: ElevatedButton.styleFrom(primary: Colors.green),
          child: const Text("Ubah")));
  }

  _tombolhapus(){
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            StreamBuilder(
              stream: getData(),
              builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                onPressed: () async {
                  await PoliService().hapus(snapshot.data).then((value) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(
                        builder: (contect) => PoliPage()));
                  });
                }, 
              child: const Text("YA"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              )
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              child: const Text("TIDAK"),
              style: ElevatedButton.styleFrom(primary: Colors.green)
              )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      }, 
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: const Text("Hapus"));
  }
}