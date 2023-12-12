import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/pegawai/pegawai_detail_page.dart';

class PegawaiItem extends StatelessWidget {
  final PegPas pegpas;

  const PegawaiItem({super.key, required this.pegpas});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pegpas.nama}"),
          subtitle: Text("Pegawai"),
        ),
      ),
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => PegawaiDetailPage(pegpas: pegpas),));
      },
    );
  }
}