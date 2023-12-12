import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/pasien/pasien_form_page.dart';
import 'package:klinik_app/pasien/pasien_item_page.dart';
import 'package:klinik_app/widget/sidebar.dart';
//import 'package:klinik_app/pasien/pegawai_item_page.dart';

class PegawaiPasien2 extends StatefulWidget {
  const PegawaiPasien2({super.key});

  @override
  State<PegawaiPasien2> createState() => _PegawaiPasien2State();
}

class _PegawaiPasien2State extends State<PegawaiPasien2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Pasien"),
        actions: [
          GestureDetector(
          child: Icon(Icons.add, color: Color.fromARGB(255, 223, 21, 21), size: 40,),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PasienForm()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          PasienItem(pegpas2: PegPas2(nomor_rm: "Ruang 102", nama: "Alexander", tanggal_lahir: "27 Januari 1998", nomor_telepon: "08912398328", alamat: "Jl. Al-Hidayah No.40")),
        ],
      ),
    );
  }
}