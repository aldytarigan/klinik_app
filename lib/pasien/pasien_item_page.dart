import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/pasien/pasien_detail_page.dart';

class PasienItem extends StatelessWidget {
  final PegPas2 pegpas2;

  const PasienItem({super.key, required this.pegpas2});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pegpas2.nama}"),
          subtitle: Text("Pasien"),
        ),
      ),
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => PasienDetailPage(pegpas2: pegpas2),));
      },
    );
  }
}