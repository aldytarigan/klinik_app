import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/pegawai/pegawai_form_page.dart';
import 'package:klinik_app/pegawai/pegawai_item_page.dart';
import 'package:klinik_app/widget/sidebar.dart';

class PegawaiPasien extends StatefulWidget {
  const PegawaiPasien({super.key});

  @override
  State<PegawaiPasien> createState() => _PegawaiPasienState();
}

class _PegawaiPasienState extends State<PegawaiPasien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Pegawai"),
        actions: [
          GestureDetector(
          child: Icon(Icons.add, color: Color.fromARGB(255, 25, 192, 75), size: 40,),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(pegpas: PegPas(nip: "15220292", nama: "Aldy Tarigan", tanggal_lahir: "5 Mei 2004", nomor_telepon: "08912398328", email: "aldytarigan@gmail.com", password: "aldy12345")),
        ],
      ),
    );
  }
}