import 'package:flutter/material.dart';
import 'package:klinik_app/pasien/pasien_detail_page.dart';
import 'package:klinik_app/model/pasien.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _normPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tglPasienCtrl = TextEditingController();
  final _telpPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Pasien"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNomorRM(),
              _fieldNamaPasien(),
              _fieldTglPasien(),
              _fieldTelpPasien(),
              _fieldAlamatPasien(),
              SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _fieldNomorRM(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nomor RM"
      ),
      controller: _normPasienCtrl,
    );
  }

  _fieldNamaPasien(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama"
      ),
      controller: _namaPasienCtrl,
    );
  }
  
  _fieldTglPasien(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Tanggal Lahir"
      ),
      controller: _tglPasienCtrl,
    );
  }

  _fieldTelpPasien(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nomor Telepon"
      ),
      controller: _telpPasienCtrl,
    );
  }

  _fieldAlamatPasien(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Alamat"
      ),
      controller: _alamatPasienCtrl,
    );
  }

  _tombolSimpan(){
    return ElevatedButton(
      onPressed: (){
        PegPas2 pegpas2 = PegPas2(
          nomor_rm: _normPasienCtrl.text,
          nama: _namaPasienCtrl.text,
          tanggal_lahir: _tglPasienCtrl.text,
          nomor_telepon: _telpPasienCtrl.text,
          alamat: _alamatPasienCtrl.text,
        );
        Navigator.push(context, 
          MaterialPageRoute(builder: 
              (context) => PasienDetailPage(pegpas2: pegpas2))
        );
      },
      child: Text("Simpan")
    );
  }
}