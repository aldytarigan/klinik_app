import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/pegawai/pegawai_update_form.dart';
import 'package:klinik_app/pegawai/pegawai_page.dart';

class PegawaiDetailPage extends StatefulWidget {
  final PegPas pegpas;

  const PegawaiDetailPage({super.key, required this.pegpas});

  @override
  State<PegawaiDetailPage> createState() => _PegawaiDetailPageState();
}

class _PegawaiDetailPageState extends State<PegawaiDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pegawai"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            "Nip : ${widget.pegpas.nip} ",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nama : ${widget.pegpas.nama}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Tanggal Lahir : ${widget.pegpas.tanggal_lahir}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nomor Telepon : ${widget.pegpas.nomor_telepon}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Email : ${widget.pegpas.email}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Password : ${widget.pegpas.password}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => 
                        PegawaiUpdateForm(pegpas: widget.pegpas)
                    )
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 0, 255, 0), foregroundColor: Colors.white),
                child: Text("Ubah")
              ),
              _tombolHapus()
            ],
          )
        ],
      ),
    );
  }

  _tombolHapus(){
    return ElevatedButton(
      onPressed: (){
        AlertDialog alertDialog = AlertDialog(
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PegawaiPasien()));
              },
              child: Text("YA"),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 0, 0), foregroundColor: Colors.white),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 30, 255, 0), foregroundColor: Colors.white),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 0, 0), foregroundColor: Colors.white),
      child: Text("Hapus"),
    );
  }
}