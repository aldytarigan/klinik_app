// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:klinik_app/pegawai/pegawai_detail_page.dart';
import '../model/pegawai.dart';
//import '../pegawai/pegawai_detail_page.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final PegPas pegpas;

  const PegawaiUpdateForm({Key? key, required this.pegpas}) : super(key: key);

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tglPegawaiCtrl = TextEditingController();
  final _nomorPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  void initState(){
    super.initState();
    setState(() {
      _nipPegawaiCtrl.text = widget.pegpas.nip!;
      _namaPegawaiCtrl.text = widget.pegpas.nama!;
      _tglPegawaiCtrl.text = widget.pegpas.tanggal_lahir!;
      _nomorPegawaiCtrl.text = widget.pegpas.nomor_telepon!;
      _emailPegawaiCtrl.text = widget.pegpas.email!;
      _passwordPegawaiCtrl.text = widget.pegpas.password!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubah Poli"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNipPegawai(),
              _fieldNamaPegawai(),
              _fieldTanggalLahir(),
              _fieldNomor(),
              _fieldEmail(),
              _fieldPassword(),
              SizedBox(height: 0),
              _tombolUbah(),
            ],
          ),
        ),
      ),
    );
  }

   _fieldNipPegawai(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nip"
      ),
      controller: _nipPegawaiCtrl,
    );
  }

  _fieldNamaPegawai(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama"
      ),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldTanggalLahir(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Tanggal Lahir"
      ),
      controller: _tglPegawaiCtrl,
    );
  }

  _fieldNomor(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nomor Telepon"
      ),
      controller: _nomorPegawaiCtrl,
    );
  }

  _fieldEmail(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Email"
      ),
      controller: _emailPegawaiCtrl,
    );
  }

  _fieldPassword(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Password"
      ),
      controller: _passwordPegawaiCtrl,
    );
  }

  _tombolUbah(){
    return ElevatedButton(
      onPressed: (){
        PegPas pegpas = PegPas(
          nama: _namaPegawaiCtrl.text,
          nip: _nipPegawaiCtrl.text,
          tanggal_lahir: _tglPegawaiCtrl.text,
          nomor_telepon: _nomorPegawaiCtrl.text,
          email: _emailPegawaiCtrl.text,
          password: _passwordPegawaiCtrl.text,
          );
        Navigator.push(context, 
          MaterialPageRoute(builder: 
              (context) => PegawaiDetailPage(pegpas: pegpas))
        );
      },
      child: Text("Ubah")
    );
  }
}