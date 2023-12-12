import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/pasien/pasien_update_form.dart';
import 'package:klinik_app/pasien/pasien_page.dart';

class PasienDetailPage extends StatefulWidget {
  final PegPas2 pegpas2;

  const PasienDetailPage({super.key, required this.pegpas2});

  @override
  State<PasienDetailPage> createState() => _PasienDetailPageState();
}

class _PasienDetailPageState extends State<PasienDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pasien"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            "Nomor Rm : ${widget.pegpas2.nomor_rm} ",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nama : ${widget.pegpas2.nama}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Tanggal Lahir : ${widget.pegpas2.tanggal_lahir}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nomor Telepon : ${widget.pegpas2.nomor_telepon}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Alamat : ${widget.pegpas2.alamat}",
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
                        PasienUpdateForm(pegpas2: widget.pegpas2)
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
                  MaterialPageRoute(builder: (context) => PegawaiPasien2()));
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